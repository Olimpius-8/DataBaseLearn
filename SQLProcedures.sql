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
create type ListLineItem as Table (
	IDRows int identity (1,1),
	IDConf int,
	IDUser int,
	Chat bit,
	Attach bit
);

go
create procedure CreateListUsers
(
@LineItems ListLineItem READONLY
)
as
begin
	declare 
	@id_conf	int  , 
	@id_user	int , 
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