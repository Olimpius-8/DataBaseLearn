use Pelegram
go

create function GetSum (@idword int, @idmajor int)
returns int
begin
	declare @sumcoin int
	declare @sum int

	set @sumcoin = (select sum(CountInMessage) from Coincedence 
	where IDWord = @idword AND IDMajor = @idmajor)

	set @sum = (select count(Mentions.TimeWithStartRing) from Mentions 
	where IDWord = @idword AND IDMajor = @idmajor)

	set @sum = @sum + @sumcoin
	return @sum
end

go



create procedure Statistic
As
begin 
select StopWords.Id, Word, ComradeMajor.ID, 'ФИО' = name + ' ' + Lastname + ' ' + surname, 
'Всего найдено'=dbo.getSum(StopWords.ID, ComradeMajor.ID)--sum(countInMessage) , count(Mentions.TimeWithStartRing)
from Coincedence
JOIN StopWords on Coincedence.IDWord = StopWords.ID
JOIN ComradeMajor on ComradeMajor.ID = Coincedence.IDMajor
JOIN Mentions on Mentions.IDMajor = ComradeMajor.ID AND Mentions.IDWord = StopWords.ID
GROUP BY StopWords.Id,ComradeMajor.ID,Word,name,lastname, surname

end 
go

------------------------------------------------------------


/*print CHARINDEX(';','1,2,3,4;5,6,7,8;9,10,11,12;')
print CHARINDEX(';','1,2,3,4;5,6,7,8;9,10,11,12;',9)
print CHARINDEX(';','1,2,3,4;5,6,7,8;9,10,11,12;',17)
print CHARINDEX(';','1,2,3,4;5,6,7,8;9,10,11,12;',28)

print SUBSTRING('1,2,3,4,5,6,7,800,', 1, (CHARINDEX(',','1,2,3,4,5,6,7,800,',1))-1) +'|'+ cast ((CHARINDEX(',','1,2,3,4,5,6,7,800,',1)) as char)
print SUBSTRING('1,2,3,4,5,6,7,800,', 3, (CHARINDEX(',','1,2,3,4,5,6,7,800,',3))-3)+'|'+ cast ((CHARINDEX(',','1,2,3,4,5,6,7,800,',3)) as char)
print SUBSTRING('1,2,3,4,5,6,7,800,', 5, (CHARINDEX(',','1,2,3,4,5,6,7,800,',5))-5)+'|'+ cast ((CHARINDEX(',','1,2,3,4,5,6,7,800,',5)) as char)
print SUBSTRING('1,2,3,4,5,6,7,800,', 7, (CHARINDEX(',','1,2,3,4,5,6,7,800,',7))-7)+'|'+ cast ((CHARINDEX(',','1,2,3,4,5,6,7,800,',7))as char)
print SUBSTRING('1,2,3,4,5,6,7,800,', 9, (CHARINDEX(',','1,2,3,4,5,6,7,800,',9))-9)+'|'+ cast ((CHARINDEX(',','1,2,3,4,5,6,7,800,',9))as char)
print SUBSTRING('1,2,3,4,5,6,7,800,', 11, (CHARINDEX(',','1,2,3,4,5,6,7,800,',11))-11)+'|'+ cast ((CHARINDEX(',','1,2,3,4,5,6,7,800,',11))as char)
print SUBSTRING('1,2,3,4,5,6,7,800,', 13, (CHARINDEX(',','1,2,3,4,5,6,7,800,',13))-13)+'|'+ cast ((CHARINDEX(',','1,2,3,4,5,6,7,800,',13))as char)
print SUBSTRING('1,2,3,4,5,6,7,800;', 15, (CHARINDEX(';','1,2,3,4,5,6,7,800;',15))-15)+'|'+ cast ((CHARINDEX(';','1,2,3,4,5,6,7,800,',15))as char)

--print SUBSTRING('1,2,3,4,5,6,7,8,', 19, (CHARINDEX(',','1,2,3,4,5,6,7,8,',19))-19)


print SUBSTRING('1,2,1,1;1,3,1,1;1,236663,0,0;2,21,1,1;2,23,1,0;2,24,1,1;3,31,1,1;3,44,1,0;4,2,1,0;', 19, (25-19))
*/
go
create procedure CreateListUsers
(
	@values varchar(max)
)
as
begin
	declare
	@id_conf	int, 
	@id_user	int,
	@chat		bit,
	@attach		bit,
	@admin		int,
	@banned		bit,
	@delimeter1 varchar = ';',
	@delimeter2 varchar = ',',
	@indexdelimeter1 int,
	@indexdelimeter2 int,
	@number		int = 1	,			--current index in string 
	@temp varchar(max),
	@check varchar(2)

	set @values = REPLACE(REPLACE(REPLACE(@values, CHAR(10), ''), CHAR(13), ''), CHAR(9), '')
	set @check =  REVERSE(@values)
	if CHARINDEX(@delimeter1,@check,0)!=1
		set @values = concat(@values, ';')
	--------------
	set @indexdelimeter1 = CHARINDEX(@delimeter1,@values,@number)
	while (@indexdelimeter1 != 0)
	begin
		set @indexdelimeter2 = CHARINDEX(@delimeter2,@values, @number)
		if @indexdelimeter2 !=0				--check end of string
		begin
			-----------idconf
			set @temp = SUBSTRING(@values, @number, (@indexdelimeter2-@number))
			if (@temp='NULL')
				set @id_conf = 0
			else
				set @id_conf = Cast(@temp as int)
			set @number = @indexdelimeter2+1
			------------iduser
			set @indexdelimeter2 = CHARINDEX(@delimeter2,@values, @number)
			set @temp = SUBSTRING(@values, @number, (@indexdelimeter2-@number))
			if (@temp='NULL')
				set @id_user = 0
			else
				set @id_user = Cast(@temp as int)
			set @number = @indexdelimeter2+1
			------------chat
			set @indexdelimeter2 = CHARINDEX(@delimeter2,@values, @number)
			set @temp = SUBSTRING(@values, @number, (@indexdelimeter2-@number))
			if (@temp='NULL')
				set @chat  = 0
			else
				set @chat = Cast(@temp as bit)
			set @number = @indexdelimeter2+1
			------------attach
			set @temp = SUBSTRING(@values, @number, (@indexdelimeter1-@number))
			if (@temp='NULL')
				set @attach  =  0
			else
				set @attach =Cast(@temp as bit)
			set @number = @indexdelimeter1+1
			------------
			--print cast(@id_conf as varchar) + '|' + cast(@id_user as varchar)  + '|'+ cast(@chat as varchar)  + '|'+ cast(@attach as varchar)
		end
		--start insert
		
		begin
			if (@id_conf != 0 AND @id_user!=0)					
			begin
				set @admin = (select Conference.IDAdmin from Conference where ID = @id_conf)
				if Exists (select BlacklistStatus from ContactBook where IDOwner = @id_user AND IDContact = @admin)
					set @banned = (select BlacklistStatus from ContactBook where IDOwner = @id_user AND IDContact = @admin)
				else
					set @banned = 0
				if (@admin != @id_user) 
				begin
					if (@banned = 0)
					begin
						insert into ListUsers(IDConference,IDUser, PermissionChat, PermissionAttachment) Values
						(@id_conf, @id_user, @chat, @attach)
					end
				end
			end
		end
		set @indexdelimeter1 = CHARINDEX(@delimeter1,@values,@number)
		------------------
	end
end
go
---------------------------------down checked
	/*if (CHARINDEX(@delimeter1, reverse(@values)))!=1
	begin
		set @values = @values+';'
	end*/
create type ListLineItem as Table (
	IDRows int identity (1,1),
	IDConf int,
	IDUser int,
	Chat bit,
	Attach bit
);
go
--old variant in table
create procedure CreateListUsersTable
(
@LineItems ListLineItem READONLY
)
as
begin
	declare 
	@id_conf	int, 
	@id_user	int, 
	@admin		int,
	@chat		bit,
	@attach		bit,
	@banned		bit,
	@rows		int = (Select count(IDRows) from @LineItems),
	@counter	int  = 1
	while (@counter <= @rows)
	begin
		set @id_conf = (Select IDConf from @LineItems where IDRows = @counter)
		set	@id_user = (Select IDUser from @LineItems where IDRows = @counter)
		set @admin = (select Conference.IDAdmin from Conference where ID = @id_conf)
		if Exists (select BlacklistStatus from ContactBook where IDOwner = @id_user AND IDContact = @admin)
			set @banned = (select BlacklistStatus from ContactBook where IDOwner = @id_user AND IDContact = @admin)
		else
			set @banned = 0
		if (@admin != @id_user) 
		begin
			if (@banned = 0)
			begin
				set @chat = (Select Chat from @LineItems where IDRows = @counter)
				set @attach = (Select Attach from @LineItems where IDRows = @counter)
				insert into ListUsers(IDConference,IDUser, PermissionChat, PermissionAttachment) Values
				(@id_conf, @id_user, @chat, @attach)
			end
		end
		set @counter = @counter + 1
	end
end

go


create procedure printContactBook
as
begin
SELECT 
Users.ID,
'Владелец'=(Users.Name +' '+Users.Lastname+' '+Users.Surname) ,
'Его номер' = Users.PhoneNumber, 
Users_2.ID,
'Абонент'=(Users_2.Name +' '+Users_2.Lastname+' '+Users_2.Surname),
'Номер' = Users_2.PhoneNumber,
BlacklistStatus
FROM ContactBook
JOIN Users				ON ContactBook.IDOwner = Users.ID
JOIN Users AS Users_2 ON ContactBook.IDContact = Users_2.ID
end

go


create procedure printCurrentMajorDictionary
as
begin
--выводит слова дежурного товарица майора
SELECT  
ComradeMajor.ID,
'Майор' = (ComradeMajor.Name +' '+ ComradeMajor.Lastname +' '+ ComradeMajor.Surname),
'Стоп-слово' = StopWords.Word,
'Приоритет' = StopWords.Priority
FROM Dictionary 
JOIN StopWords
ON Dictionary.IDWord = StopWords.ID
JOIN ComradeMajor
ON ComradeMajor.ID = Dictionary.IDMajor
JOIN TimeTable
ON TimeTable.IDMajor = ComradeMajor.ID
where TimeTable.WorkDay = Convert(Date, Current_TIMESTAMP) AND  Convert (Time, CURRENT_TIMESTAMP) BETWEEN TimeTable.TimeStart AND Timetable.TimeEnd 
end
go


create procedure printMajorsDictionary
as
begin
--выводит слова дежурного товарица майора
SELECT  
ComradeMajor.ID,
'Майор' = (ComradeMajor.Name +' '+ ComradeMajor.Lastname +' '+ ComradeMajor.Surname),
'Стоп-слово' = StopWords.Word,
'Приоритет' = StopWords.Priority
FROM Dictionary 
JOIN StopWords
ON Dictionary.IDWord = StopWords.ID
JOIN ComradeMajor
ON ComradeMajor.ID = Dictionary.IDMajor
JOIN TimeTable
ON TimeTable.IDMajor = ComradeMajor.ID
order by  ComradeMajor.ID

end