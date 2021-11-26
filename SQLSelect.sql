use Pelegram
go


--1
select Users.PhoneNumber, Users.Nickname, count(TextMessage.ID) as CountMessages, count(MessagesDialog.IDDialog) as CountPersons, sum(Coincedence.CountInMessage) as CountStopWords
from Users 
join TextMessage on TextMessage.IDOwner = Users.ID 
join MessagesDialog on MessagesDialog.IDMessage = TextMessage.ID
join Dialog on MessagesDialog.IDDialog = Dialog.ID
join Coincedence on Coincedence.IDMessage = TextMessage.ID
where Dialog.IDFirst = TextMessage.IDOwner
--OR Dialog.IDSecond = TextMessage.IDOwner
group by PhoneNumber, Nickname


select IDOwner, Coincedence.IDMessage , sum(Coincedence.CountInMessage) from Coincedence 
join TextMessage on TextMessage.ID = Coincedence.IDMessage
join MessagesDialog on TextMessage.ID = MessagesDialog.IDMessage
where TextMessage.IDOwner = 3 or TextMessage.IDOwner = 2
group by IDOwner,Coincedence.IDMessage
order by IDOwner
select * from Coincedence