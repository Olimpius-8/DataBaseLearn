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

exec statistic 

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

print SUBSTRING('1,2,3,4,5,6,7,8,', 1, (CHARINDEX(',','1,2,3,4,5,6,7,8,',1))-1) +'|'+ cast ((CHARINDEX(',','1,2,3,4,5,6,7,8,',1)) as char)
print SUBSTRING('1,2,3,4,5,6,7,8,', 3, (CHARINDEX(',','1,2,3,4,5,6,7,8,',3))-3)+'|'+ cast ((CHARINDEX(',','1,2,3,4,5,6,7,8,',3)) as char)
print SUBSTRING('1,2,3,4,5,6,7,8,', 5, (CHARINDEX(',','1,2,3,4,5,6,7,8,',5))-5)+'|'+ cast ((CHARINDEX(',','1,2,3,4,5,6,7,8,',5)) as char)
print SUBSTRING('1,2,3,4,5,6,7,8,', 7, (CHARINDEX(',','1,2,3,4,5,6,7,8,',7))-7)+'|'+ cast ((CHARINDEX(',','1,2,3,4,5,6,7,8,',7))as char)
print SUBSTRING('1,2,3,4,5,6,7,8,', 9, (CHARINDEX(',','1,2,3,4,5,6,7,8,',9))-9)+'|'+ cast ((CHARINDEX(',','1,2,3,4,5,6,7,8,',9))as char)
print SUBSTRING('1,2,3,4,5,6,7,8,', 11, (CHARINDEX(',','1,2,3,4,5,6,7,8,',11))-11)+'|'+ cast ((CHARINDEX(',','1,2,3,4,5,6,7,8,',11))as char)
print SUBSTRING('1,2,3,4,5,6,7,8,', 13, (CHARINDEX(',','1,2,3,4,5,6,7,8,',13))-13)+'|'+ cast ((CHARINDEX(',','1,2,3,4,5,6,7,8,',13))as char)
print SUBSTRING('1,2,3,4,5,6,7,8;', 15, (CHARINDEX(';','1,2,3,4,5,6,7,8;',15))-15)+'|'+ cast ((CHARINDEX(';','1,2,3,4,5,6,7,8,',15))as char)

--print SUBSTRING('1,2,3,4,5,6,7,8,', 19, (CHARINDEX(',','1,2,3,4,5,6,7,8,',19))-19)
*/
go
create procedure CreateListUsers
(
	@values nvarchar(max)
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
	@delimeter1 nvarchar = ';',
	@delimeter2 nvarchar = ',',
	@indexdelimeter1 int,
	@indexdelimeter2 int,
	@number		int = 1	,			--current index in string 
	@temp nvarchar

	set @values = replace (replace(@values, CHAR(10),''), CHAR(13), ' ')
	--------------
	set @indexdelimeter1 = CHARINDEX(@delimeter1,@values,@number)
	while (@indexdelimeter1 != 0)
	begin
		--print @indexdelimeter1
		set @indexdelimeter2 = CHARINDEX(@delimeter2,@values, @number)
		--print @indexdelimeter2
		if @indexdelimeter2 !=0				--check end of string
		begin
			-----------idconf
			set @temp = SUBSTRING(@values, @number, (@indexdelimeter2-@number))
			if (@temp!='NULL')
				set @id_conf = Cast(@temp as int)
			else
				set @id_conf = 0
			set @number = @indexdelimeter2+1
			------------iduser
			set @indexdelimeter2 = CHARINDEX(@delimeter2,@values, @number)
			--print @indexdelimeter2
			set @temp = SUBSTRING(@values, @number, (@indexdelimeter2-@number))
			if (@temp!='NULL')
				set @id_user = Cast(@temp as int)
			else
				set @id_user = 0
			set @number = @indexdelimeter2+1
			------------chat
			set @indexdelimeter2 = CHARINDEX(@delimeter2,@values, @number)
			--print @indexdelimeter2
			set @temp = SUBSTRING(@values, @number, (@indexdelimeter2-@number))
			if (@temp!='NULL')
				set @chat  = Cast(@temp as bit)
			else
				set @chat = NULL
			
			set @number = @indexdelimeter2+1
			------------attach
			set @temp = SUBSTRING(@values, @number, (@indexdelimeter1-@number))
			if (@temp!='NULL')
				set @attach  = Cast(@temp as bit)
			else
				set @attach = NULL
			set @number = @indexdelimeter1+1
			------------
			--print cast(@id_conf as varchar) + '|' + cast(@id_user as varchar)  + '|'+ cast(@chat as varchar)  + '|'+ cast(@attach as varchar)
		end
		--start insert
		--while (@counter <= @rows)
		begin
			if (@id_conf != 0 AND @id_user!=0)					-- AND @chat!=NULL AND @attach!=NULL)
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

/*
select * from ContactBook
select * from Conference
*/