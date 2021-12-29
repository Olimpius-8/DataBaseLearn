USE Pelegram
go

--1: проверка на нахождение в чёрном списке
Create trigger Blacklistdialog
ON MessagesDialog
instead of insert
as
declare @iddialog int,
@idmessage int,
@idowner int,			--владелец сообщения
@idsend int,			--второй участник диалога
@banned bit,
@check int				--проверка, является ли владелец сообщения первым участником

Declare DMsg_Cursor CURSOR
for select
inserted.IDDialog, INSERTED.IDMessage
FROM inserted
OPEN DMsg_Cursor
FETCH NEXT FROM DMsg_Cursor into @iddialog, @idmessage
--print @@FETCH_status
while @@FETCH_STATUS = 0
begin
		
		set @idowner = (select IDOwner from TextMessage where ID = @idmessage)
		set @check = (select IDFirst from Dialog where ID = @iddialog AND IDFirst = @idowner)
		
		if (@check !=0)	--если владелец в первом поле 
			set @idsend = (select IDSecond from Dialog where ID = @iddialog AND IDFirst = @idowner)--берем из первого
		else
			set @idsend = (select IDFirst from Dialog where ID = @iddialog AND IDSecond = @idowner)--иначе из второго

		/*
		print 'idmessage'+cast(@idmessage as varchar)
		print 'idowner'+cast(@idowner as varchar)
		print 'idsend'+cast(@idsend as varchar)
		*/
		
		if exists (select BlacklistStatus from ContactBook where IDOwner = @idsend and IDContact = @idowner)
		begin
			set @banned  = (select BlacklistStatus from ContactBook
			where IDOwner = @idsend and IDContact = @idowner)
		end
		else
			set @banned=0
		--print 'banned'+cast(@banned as varchar)
		if (@banned = 0)
		begin
			Insert into MessagesDialog values
			(@iddialog, @idmessage)
		end
		else
		begin
			--print 'Запрещена отправка сообщений'
			delete from TextMessage 
			where ID = @idmessage
		end
				
		FETCH NEXT FROM DMsg_Cursor into @iddialog, @idmessage
end
close Dmsg_cursor
deallocate Dmsg_cursor

go

--2: проверка на разрешения в конференции - проверить!!!
Create trigger PermissionsConference
ON MessagesConference 
instead of insert
as
declare @idconference int,
@idmessage int,
@idowner int,			--владелец сообщения
@chatban int,			--второй участник диалога
@attachban bit,
@check int				--проверка, является ли владелец сообщения первым участником

Declare CMsg_Cursor CURSOR
for select
inserted.IDConference, INSERTED.IDTextMessage
FROM inserted
OPEN CMsg_Cursor
FETCH NEXT FROM Cmsg_Cursor into @idconference, @idmessage
--print @@FETCH_status
while @@FETCH_STATUS = 0
begin
		set @idowner = (select IDOwner from TextMessage where ID = @idmessage)
		--проверка на существование записи в таблице
		if exists (select PermissionChat from ListUsers 
		where IDConference = @idconference AND IDUser = @idowner)
		begin
			set @chatban = (select PermissionChat from ListUsers 
			where IDConference = @idconference AND IDUser = @idowner)
			set @attachban = (select PermissionAttachment from ListUsers
			where IDConference = @idconference AND IDUser = @idowner)
		end
		else
		begin
			set @chatban=0
			set @attachban=0
		end
		--нет разрешения на сообщения - удаляем 
		if (@chatban = 0)
		begin
			Insert into MessagesConference values (@idconference, @idmessage)
		end
		else
		begin
			--print 'Запрещена отправка сообщений'
			delete from TextMessage where ID = @idmessage
		end
		--если не разрешено отправлять сообщения - обнуляем поле
		if (@attachban = 0)
		begin
			--print 'Запрещена отправка вложений'
			update TextMessage set FirstAttachment = NULL where ID=@idmessage 
		end 
				
		FETCH NEXT FROM Cmsg_Cursor into @idconference, @idmessage
end
close Cmsg_cursor
deallocate Cmsg_cursor

go
--3: триггер на стоп-слова - работает
go
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
	DECLARE Words_CURSOR SCROLL CURSOR 
	FOR 
	SELECT Dictionary.IDWord, StopWords.Word FROM Dictionary 
	JOIN StopWords on StopWords.ID = Dictionary.IDWord
	WHERE Dictionary.IDMajor = @currentMajor
---------------------------
	DECLARE Messages_CURSOR CURSOR 
	FOR 
	SELECT TextMessage.ID,TextMessage.txt from TextMessage
	JOIN INSERTED ON TextMessage.ID = inserted.ID
---------------------------   для начала циклов
	OPEN MESSAGES_CURSOR
	OPEN Words_CURSOR
	FETCH NEXT FROM MESSAGES_CURSOR INTO @idmessage, @text
	--FETCH NEXT FROM Words_CURSOR INTO @idword, @word   --worked old
----------------------------
	while @@FETCH_STATUS = 0
	BEGIN
		/*
		set @idmessage = (select TextMessage.ID from inserted join TextMessage on TextMessage.ID = inserted.ID)
		set @Text = (select TextMessage.Txt from TextMessage inner join INSERTED on TextMessage.ID = inserted.ID  where inserted.ID = @idmessage)
		*/
		--print 'idmessage:'+cast(@idmessage as varchar)
		--print 'text:'+@Text
		--print 'word'+@word
		--open cursor
		--поиск совпадений работает
		FETCH FIRST FROM Words_CURSOR INTO @idword, @word  -- пропускает запись из сообщений, поэтому закоментированно
		while @@FETCH_STATUS = 0
		BEGIN
			--print 'idword:'+@word
			set @count = ((SELECT LEN(UPPER(@text)) - LEN(REPLACE(UPPER(@text), UPPER(@word), '')))/len(@word))
			--print'count:' + cast (@count as varchar)
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

--Вместо удаления - меняем поле
create trigger 
MessageDelete ON TextMessage
instead of delete
as

declare @rows int
declare @id int
declare @deltable table (rowid int identity(1,1), ID int)
insert into @deltable (ID)
select ID from deleted

declare Del_mescursor CURSOR
for select TextMessage.ID from TextMessage
join deleted on TextMessage.ID = deleted.ID

open del_mescursor 
FETCH next from del_mescursor into @id
while @@FETCH_STATUS =  0
begin
	update TextMessage set Deleted = 1 where ID = @id
	FETCH next from del_mescursor into @id
end
close del_mescursor
deallocate del_mescursor
go

--Автоподсчёт длительности звонка
create trigger 
RingTalktime ON Ring
instead of insert
as
declare @id int,
		@idinner int,
		@idouter int
declare @timestart datetime
declare @timeend datetime,
		@talk  int
Declare Ring_Cursor CURSOR
for select
inserted.ID, inserted.IDInner, inserted.IDOuter, inserted.TimeStart, inserted.TimeEnd
FROM inserted
OPEN Ring_Cursor
FETCH NEXT FROM Ring_Cursor into @id, @idinner, @idouter, @timestart, @timeend

while @@FETCH_STATUS = 0
begin
		--print(@timestart)
		--print(@timeend)

		set @talk = (select datediff (s, @timestart, @timeend))
		if (@talk is null)
		set @talk = 0
		

			INSERT INTO Ring(IDInner, IDOuter, TimeStart, TimeEnd, Talktime) VALUES
			( @idinner, @idouter, @timestart, @timeend, @talk)
		FETCH NEXT FROM Ring_Cursor into @id, @idinner, @idouter, @timestart, @timeend
end
close Ring_Cursor
deallocate Ring_Cursor
go