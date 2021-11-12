IF DB_ID('Pelegram') IS NOT NULL
BEGIN
    use Pelegram
END
go

--SELECT * FROM Users
INSERT INTO Users(Nickname,PhoneNumber,Name, Lastname, Surname, LastSession, EncriptionKey) VALUES
('Abraksas',	'77777777777',	'Абраксас',	'Кужугетов',	'Арсланович',	Current_TimeStamp,	'df8s96sdg76d'	),
('ЗЫЗЫА',		'78956423512',	'Тимофей',	'Покрышкин',	'Михайлович',	Current_TimeStamp,	'k234jhKJh342'	),
('a',			'76786592873',	'Афанасий',	'Малыкин',		'Ибрагимович',  Current_TimeStamp,	'as0b9cv7hj'	),
('b',			'79864521354',	'Андрей',	'Скоморохин',	'Тимурович',	Current_TimeStamp,	'odfiger9df'	),
('c',			'87907987986',	'Анатолий',	'Силиванов',	'Артурович',	Current_TimeStamp,	'D)(UdsgG*(&s9'	);

go
--select * from stopwords
INSERT INTO StopWords(Word, priority) VALUES
('Взорвать',			2),
('Похитить',			2),
('Уничтожить',			1),
('Взломать',			2),
('Устранить',			2),
('Не по телефону',		4);
--select * from comrademajor
INSERT INTO ComradeMajor(Name, Lastname, Surname) VALUES
('Антон','Бондаренко','Степанович'),
('Олег','Демидов','Александрович'),
('Борис','Овчаренко','Михайлович'),
('Артём','Сигизмундов','Игоревич'),
('Николай','Трофимов','Дамирович'),
('Владислав','Никифоров','Артёмович');

SET IDENTITY_INSERT Timetable OFF		--отключаем ручной ввод ID
--select * from  timetable 
INSERT INTO Timetable(IDMajor, WorkDay, TimeStart, TimeEnd) VALUES
(1,GETDATE(),'3:30','21:30'),
(2,GETDATE()+1,'08:30','17:30'),
(5,GETDATE()+3,'07:30','15:30'),
(4,GETDATE()+5,'05:30','15:30');

SET IDENTITY_INSERT Dialog OFF

INSERT INTO Dialog(IDFirst, IDSecond, TimeCreate, LastMessage, LastAttachment) VALUES
(1,2,CURRENT_TIMESTAMP,NULL,NULL),
(3,4,CURRENT_TIMESTAMP,NULL,NULL),
(2,3,CURRENT_TIMESTAMP,NULL,NULL),
(1,4,CURRENT_TIMESTAMP,NULL,NULL)

--select * from dialog

INSERT INTO Dictionary(IDWord,IDMajor) VALUES
(1,1),
(1,2),
(5,1),
(2,3),
(2,2),
(2,4),
(3,2),
(3,4),
(3,5);
--select * from dictionary
INSERT INTO ContactBook(IDOwner, IDContact, BlacklistStatus) VALUES
(1,2,0),
(1,3,0),
(1,4,1),
(1,5,0),
(2,1,1),
(2,3,1),
(2,4,0)

--select * from contactbook 

--delete from ContactBook
go
SET IDENTITY_INSERT TextMessage OFF

go
INSERT INTO TextMessage VALUES
(1,'Надо найти и взорвать базу', CURRENT_TIMESTAMP, 1,CURRENT_TIMESTAMP,0,NULL,0,0,NULL),
(2,'Необходимо устранить конкурентов', CURRENT_TIMESTAMP+1,1, CURRENT_TIMESTAMP,1,CURRENT_TIMESTAMP+0.5,1,0,NULL),
(3,'Надо найти на карте оставленные документы и взорвать взорвать их', CURRENT_TIMESTAMP+2, 0, NULL, 0,NULL,0,0,NULL),
(2,'Необходимо обеспечить  и взорвать взорвать непрерывной поток данных',CURRENT_TIMESTAMP+1, 0, NULL, 0,NULL,0,0,NULL)
  
  /*
  delete from messagesDialog
  delete from coincedence
  disable trigger MessageDelete on TextMessage
  delete from TextMessage
  */
  --select * from textmessage
  /*delete from TextMessage where ID = 3
  update TextMessage set Deleted = 0 where TextMessage.ID = 3*/
  go

Select IDMessage, 'Слово' = StopWords.Word, IDMajor, CountInMessage 
from Coincedence
--JOIN Dictionary ON Dictionary.IDWord = Coincedence.IDWord
JOIN StopWords ON Coincedence.IDWord = StopWords.Id

select * from TextMessage
go
INSERT INTO MessagesDialog VALUES
(1,9),
(2,10),
(4,11),
(3,12)

Select * from Dialog
/*
delete from MessagesDialog
select * from MessagesDialog
*/
go
SET IDENTITY_INSERT TextMessage OFF

go
INSERT INTO TextMessage VALUES
(1,'А что он нам предлагает?', CURRENT_TIMESTAMP, 1,CURRENT_TIMESTAMP,0,NULL,0,0,NULL),
(2,'Ну даже не знаю, может позже скажет', CURRENT_TIMESTAMP+1,1, CURRENT_TIMESTAMP,1,CURRENT_TIMESTAMP+0.5,1,0,NULL),
(3,'Это при том, что у нас его нету', CURRENT_TIMESTAMP+2, 0, NULL, 0,NULL,0,0,1),
(2,'И ему ещё нужно согласовать это',CURRENT_TIMESTAMP+1, 0, NULL, 0,NULL,0,0,NULL)

insert into ListUsers VAlues
(1,2,1,1,CURRENT_TIMESTAMP, 0),
(1,3,0,0,CURRENT_TIMESTAMP, 0),
(1,4,1,0,CURRENT_TIMESTAMP,0);

go
SET IDENTITY_INSERT Conference Off
go
insert into Conference values 
(1,CURRENT_TIMESTAMP),
(2,CURRENT_TIMESTAMP+1)

select * from MessagesConference

insert into Ring Values
(1,3,'ноя 12 2021 4:22PM', 'ноя 12 2021 4:30PM',480) 

insert into Mentions Values
(1,1,1,5)

select * from mentions 
select * from Coincedence order by IDWord

--exec statistic

go
select  * from ListUsers

select * from TextMessage

delete from MessagesConference

insert into MessagesConference values
(1,5),
(1,6),
(1,7),
(1,8)



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



SELECT * FROM Users

SELECT * FROM StopWords

SELECT * FROM Timetable

--выводит контактную книгу
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
select * from textmessage
--*/
