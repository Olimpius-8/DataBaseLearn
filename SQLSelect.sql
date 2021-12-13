use Pelegram
go


create view Counters
as
select IDMajor, IDOwner, sum(CountInMessage) as counts 
		from Coincedence
		join TextMessage on Coincedence.IDMessage = TextMessage.ID
		group by IDMajor, IDOwner
go
--1
/*
Для каждого пользователя: 
Телефон, Никнейм, кол-во сообщений, кол-во стоп-слов в сообщениях, ФИО майора, который чаще всего получал совпадений
*/
select Users.PhoneNumber, 
Users.Nickname, 
count(distinct TextMessage.ID) as CountMessages,
count(distinct MessagesDialog.IDDialog) as CountPersons,
Counters.counts as CountStopWords,    --sum(Coincedence.CountInMessage)
(ComradeMajor.Lastname + ' ' + ComradeMajor.Name + ' '+ComradeMajor.Surname) as Major
-------
from Users 
join TextMessage		on TextMessage.IDOwner = Users.ID 
join MessagesDialog		on MessagesDialog.IDMessage = TextMessage.ID
join Coincedence		on Coincedence.IDMessage = TextMessage.ID
-------
join Counters			on Counters.IDOwner = Users.ID
join ComradeMajor on ComradeMajor.ID = Counters.IDMajor
group by PhoneNumber, Nickname, 
ComradeMajor.Name,ComradeMajor.Lastname,ComradeMajor.Surname,
Counters.counts


--test
select distinct Counters.IDOwner, max(Counters.counts) as Maximum
from Counters
group by Counters.IDOwner

select distinct Counters.IDMajor, max(Counters.counts) as Maximum
from Counters
group by Counters.IDMajor

select * from counters 