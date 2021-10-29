USE Pelegram
go
--3: триггер на стоп-слова - работает
create trigger DetectWord
On TextMessage
after insert 
as

declare @idmessage int, @Text varchar(250), @currentMajor integer , 
@word varchar(100), @idword int, @count int
set @currentMajor = 
(select ComradeMajor.ID from ComradeMajor 
join Timetable 
on Timetable.IDMajor = ComradeMajor.ID 
where TimeTable.WorkDay = Convert(Date, Current_TIMESTAMP) AND  Convert (Time, CURRENT_TIMESTAMP) BETWEEN TimeTable.TimeStart AND Timetable.TimeEnd 
)
--print 'майор :'+cast(@currentmajor as varchar)
if (@currentMajor IS NOT NULL)		--если кто-то дежурит
BEGIN
---------------------------
	DECLARE Words_CURSOR CURSOR LOCAL
	FOR 
	SELECT Dictionary.IDWord, StopWords.Word FROM Dictionary 
	JOIN StopWords on StopWords.ID = Dictionary.IDWord
	WHERE Dictionary.IDMajor = @currentMajor
---------------------------
	DECLARE Messages_CURSOR CURSOR LOCAL
	FOR 
	SELECT TextMessage.ID,TExtMessage.txt from TextMessage
	JOIN INSERTED ON TextMessage.ID = inserted.ID
---------------------------   для начала циклов
	OPEN MESSAGES_CURSOR
	OPEN Words_CURSOR
	FETCH NEXT FROM MESSAGES_CURSOR INTO @idmessage, @text
	FETCH NEXT FROM Words_CURSOR INTO @idword, @word   --worked old
----------------------------
	while @@FETCH_STATUS = 0
	BEGIN
		/*
		set @idmessage = (select TextMessage.ID from inserted join TextMessage on TextMessage.ID = inserted.ID)
		set @Text = (select TextMessage.Txt from TextMessage inner join INSERTED on TextMessage.ID = inserted.ID  where inserted.ID = @idmessage)
		*/
		--print 'idmessage:'+cast(@idmessage as varchar)
		--print 'text:'+@Text
		--open cursor
		--поиск совпадений работает
		--FETCH NEXT FROM Words_CURSOR INTO @idword, @word  -- пропускает запись из сообщений, поэтому закоментированно
		while @@FETCH_STATUS = 0
		BEGIN
			--print 'idword:'+@word
			set @count = ((SELECT LEN(UPPER(@text)) - LEN(REPLACE(UPPER(@text), UPPER(@word), '')))/len(@word))
			if (@count!=0)				--(CHARINDEX(UPPER(@word), UPPER(@Text)) != -1)  -- if find 
			BEGIN
				INSERT INTO Coincedence(IDMessage,IDWord, IDMajor, CountInMessage) VALUES
				(@idmessage, @idword,@currentMajor,@count)
			END
			FETCH NEXT FROM Words_CURSOR INTO @idword,@word
		END
		FETCH NEXT FROM MESSAGES_CURSOR INTO @idmessage, @text
	END
	CLOSE Words_CURSOR
	DEALLOCATE Words_CURSOR
	CLOSE Messages_CURSOR
	DEALLOCATE Messages_CURSOR
END
go

/*
--? курсоры и #temp

--триггер проверки размера вложений
Create trigger CheckSize
On Attachment
INSTEAD OF INSERT 
AS 
declare @NMbytes Integer, 
		@Sum Integer,
		@Size Integer, 
		@i Integer,
		@last integer;
set @NMBytes = 2000;
set @i=(select ID from inserted);
set @Sum = (select Size from inserted where ID = @i);  -- сумма = размер первого вложения в сообщении
while ((select Attachment.IDNext from Attachment where Attachment.ID = @i) != NULL ) 			--пока есть следующее вложение
BEGIN
	set @i = (select Attachment.IDNext from Attachment where Attachment.ID = @i);
	set @Sum = @Sum  + (select Attachment.Size from Attachment where Attachment.ID = @i);
	--вставка во временную таблицу
	select inserted.ID, inserted.IDMessage, inserted.IDNext, 
	inserted.NameFile,inserted.Tip, inserted.Extension, inserted.Size  
	into #temp from inserted
	inner join Attachment on Attachment.ID = inserted.ID
END
if (@Sum > @NMBytes)
BEGIN
	--rollback
	print('Превышен размер вложений в сообщении');
END
else
begin
	--вставка 
	SET @last = (select max(#temp.Id) from #temp)
	set @i =	(select min(#temp.Id) from #temp)
	set @sum = @last - @i
	--sum = количество вложений в сообщении
	--insert into Attachment 
	while (@i < @last)
	begin --- курсором ?
		declare @IDMessage integer =  (select #temp.IDMessage  from #temp where #temp.ID = @i)
		declare @IDNext integer = (select #temp.IDNext from #temp where #temp.ID = @i)
		declare @Tip varchar(20) = (select #temp.Tip from #temp where #temp.ID = @i)
		declare @Extension varchar(20) = (select #temp.Extension from #temp where #temp.ID = @i)
		insert into Attachment
		values (@i, #temp.IDMessage, #temp.IDNext, #temp)  --from #temp where #temp.id = @i
		set @i = @i+1
	end
end*/
--go 

--1: триггер: черного списка в диалоге  
Create trigger BlacklistDialog
On MessagesDialog
instead of insert   
as
declare @iddialog int
declare @idmessage int
declare @idowner int
declare @banned bit
----------------------
--find dialog
DECLARE Dialog_CURSOR CURSOR
FOR 
SELECT Dialog.ID
from Dialog 
join inserted on Dialog.ID = inserted.IDDialog
----------
OPEN Dialog_CURSOR
-------
FETCH NEXT FROM Dialog_CURSOR INTO @iddialog
WHILE @@FETCH_STATUS =0		
BEGIN
		PRINT 'IDDIALOG:' + CAST(@IDDIALOG AS VARCHAR)
		DECLARE Message_CURSOR CURSOR			--сообщения диалога
		FOR 
		SELECT MessagesDialog.IDMessage, TextMessage.IDOwner from TextMessage
		JOIN MessagesDialog ON MessagesDialog.IDMessage = TextMessage.ID
		JOIN inserted ON Inserted.IDDialog = MessagesDialog.IDDialog
		WHERE MessagesDialog.IDDialog=@iddialog
		---------
		OPEN Message_CURSOR

		FETCH NEXT FROM Message_CURSOR INTO @idmessage , @idowner

		PRINT 'IDOWNERMESSAGE[1]:' + CAST(@IDOWNER AS VARCHAR)
		PRINT 'BANNED[1]:' + CAST(@BANNED AS VARCHAR)
		WHILE @@FETCH_STATUS = 0
		BEGIN
				--ищем статус в чёрном списке
				set @banned = (select ContactBook.BlacklistStatus from ContactBook
				join Users on ContactBook.IDContact = Users.id 
				join Dialog on 
				(Dialog.IDFirst = Users.ID) OR (Dialog.IDSecond = Users.ID)				--пользователь состоит в диалоге (основатель или нет - не важно)
				where Dialog.ID = @IDdialog AND @idowner = ContactBook.IDContact)		--владелец сообщения находится в контактной книге
				-----------
				PRINT 'IDOWNERMESSAGE:' + CAST( @IDOWNER AS VARCHAR)
				PRINT 'BANNED:' + CAST(@BANNED AS VARCHAR)
				if (@banned=1)
				begin		
					DELETE FROM TextMessage WHERE TextMessage.ID = @idmessage
					--rollback
				end
				else
				begin
					INSERT INTO MessagesDialog Values (@IDdialog, @idmessage)
					--commit
				end
				FETCH NEXT FROM Message_CURSOR INTO @idmessage, @idowner
		END
		FETCH NEXT FROM Dialog_CURSOR INTO @iddialog
		CLOSE Message_CURSOR
		DEALLOCATE Message_CURSOR
		-------
END

CLOSE Dialog_CURSOR
DEALLOCATE Dialog_CURSOR

--drop trigger BlacklistDialog

--2:  триггер прав доступа в конференции
/*
CREATE TRIGGER BlacklistConference
	--find conference 
	BEGIN
		declare @IDconf int = (select MessagesConference.IDConference from MessagesConference 
		join TextMessage on TextMessage.ID = MessagesConference.IDTextMessage)
		if (@IDconf != NULL)
		begin
			declare @permissionMessage bit;
			declare @permissionAttachment bit;
			set @permissionAttachment = (select ListUsers.IDUser from ListUsers 
			join Conference on ListUsers.IDConference = Conference.ID
			join MessagesConference on MessagesConference.IDConference = Conference.ID
			join TextMessage on TextMessage.ID = MessagesConference.IDTextMessage
			where TextMessage.IDOwner = ListUsers.IDUser and Conference.ID=@IDconf)
		end
	END
*/