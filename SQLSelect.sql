use Pelegram
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
sum(Coincedence.CountInMessage) as CountStopWords,
(ComradeMajor.Lastname + ' ' + ComradeMajor.Name + ' '+ComradeMajor.Surname) as Major
-------
from Users 
join TextMessage		on TextMessage.IDOwner = Users.ID 
join MessagesDialog		on MessagesDialog.IDMessage = TextMessage.ID
join Coincedence		on Coincedence.IDMessage = TextMessage.ID
join (
	select IDMajor,IDOwner, max(counts) as counter
	from 
		(select IDMajor, IDOwner, sum(CountInMessage) as counts 
		from Coincedence
		join TextMessage on Coincedence.IDMessage = TextMessage.ID
		group by IDMajor, IDOwner
		) as Counts
	group by Counts.IDMajor,IDOwner
) Counters
on Counters.IDowner = Users.ID
join ComradeMajor on ComradeMajor.ID = Counters.IDMajor
group by PhoneNumber, Nickname, ComradeMajor.Name,ComradeMajor.Lastname,ComradeMajor.Surname

