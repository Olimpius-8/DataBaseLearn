IF DB_ID('Pelegram') IS NOT NULL
BEGIN
    use Pelegram
END

INSERT INTO Users(Nickname,PhoneNumber,Name, Lastname, Surname, LastSession, EncriptionKey) VALUES
('Abraksas',	'77777777777',	'Абраксас',	'Кужугетов',	'Арсланович',	Current_TimeStamp,	'df8s96sdg76d'	),
('ЗЫЗЫА',		'78956423512',	'Тимофей',	'Покрышкин',	'Михайлович',	Current_TimeStamp,	'k234jhKJh342'	),
('a',			'76786592873',	'Афанасий',	'Малыкин',		'Ибрагимович',  Current_TimeStamp,	'as0b9cv7hj'	),
('b',			'79864521354',	'Андрей',	'Скоморохин',	'Тимурович',	Current_TimeStamp,	'odfiger9df'	),
('c',			'87907987986',	'Анатолий',	'Силиванов',	'Артурович',	Current_TimeStamp,	'D)(UdsgG*(&s9'	);

go

INSERT INTO StopWords(Word, priority) VALUES
('Взорвать',			2),
('Похитить',			2),
('Уничтожить',			1),
('Взломать',			2),
('Дезинтегрировать',	2),
('Не по телефону',		4);

INSERT INTO ComradeMajor(Name, Lastname, Surname) VALUES
('Антон','Бондаренко','Степанович'),
('Олег','Демидов','Александрович'),
('Борис','Овчаренко','Михайлович'),
('Артём','Сигизмундов','Игоревич'),
('Николай','Трофимов','Дамирович'),
('Владислав','Никифоров','Артёмович');

SET IDENTITY_INSERT Timetable OFF		--отключаем ручной ввод ID

INSERT INTO Timetable(IDMajor, WorkDay, TimeStart, TimeEnd) VALUES
(1,GETDATE(),'13:30','21:30'),
(2,GETDATE()+1,'08:30','17:30'),
(5,GETDATE()+3,'07:30','15:30'),
(4,GETDATE()+5,'05:30','15:30');

SET IDENTITY_INSERT Dialog OFF

INSERT INTO Dialog(IDFirst, IDSecond, TimeCreate, LastMessage, LastAttachment) VALUES
(1,2,CURRENT_TIMESTAMP,NULL,NULL),
(3,4,CURRENT_TIMESTAMP,NULL,NULL)



INSERT INTO Dictionary(IDWord,IDMajor) VALUES
(1,1),
(1,2),
(2,3),
(2,2),
(2,4),
(3,2),
(3,4),
(3,5);

INSERT INTO ContactBook(IDOwner, IDContact, BlacklistStatus) VALUES
(1,2,0),
(1,3,0),
(1,4,1),
(1,5,0),
(2,1,0),
(2,3,1),
(2,4,0)

SET IDENTITY_INSERT TextMessage OFF
go
INSERT INTO TextMessage VALUES
(1,'Надо взорвать базу', CURRENT_TIMESTAMP, 1,CURRENT_TIMESTAMP,0,NULL,0,0,NULL),
(2,'Необходимо устранить конкурентов', CURRENT_TIMESTAMP+1,1, CURRENT_TIMESTAMP,1,CURRENT_TIMESTAMP+0.5,1,0,NULL),
(3,'Надо найти на карте оставленные документы и взорвать взорвать', CURRENT_TIMESTAMP+2, 0, NULL, 0,NULL,0,0,NULL)
  
  /*
  delete from messagesDialog
  delete from coincedence
  delete from TextMessage
  */
  --select * from textmessage


  INSERT INTO MessagesDialog VALUES
(1,1),
(1,2),
(2,3)


Select * from Coincedence

SELECT * FROM Users

SELECT * FROM StopWords

SELECT * FROM Timetable

--выводит слова конкретного товарица майора
SELECT  
'Майор' = (ComradeMajor.Name +' '+ ComradeMajor.Lastname +' '+ ComradeMajor.Surname),
'Стоп-слово' = StopWords.Word,
'Приоритет' = StopWords.Priority
FROM Dictionary
JOIN StopWords
ON Dictionary.IDWord = StopWords.ID
JOIN ComradeMajor
ON ComradeMajor.ID = Dictionary.IDMajor 

--выводит контактную книгу
SELECT 
'Владелец'=(Users.Name +' '+Users.Lastname+' '+Users.Surname) ,
'Его номер' = Users.PhoneNumber, 
'Абонент'=(Users_2.Name +' '+Users_2.Lastname+' '+Users_2.Surname),
'Номер' = Users_2.PhoneNumber
FROM ContactBook
JOIN Users				ON ContactBook.IDOwner = Users.ID
JOIN Users AS Users_2 ON ContactBook.IDContact = Users_2.ID

SELECT * FROM Timetable

select * from TextMessage

--словать дежурного майора
SELECT ComradeMajor.ID, StopWords.Word 
FROM ComradeMajor
JOIN TimeTable ON Timetable.IDMajor = ComradeMajor.ID
JOIN Dictionary ON ComradeMajor.ID = Dictionary.IDMajor
JOIN StopWords ON StopWords.ID = Dictionary.IDWord
Where CONVERT(Date, CURRENT_TIMESTAMP) = TimeTable.WorkDay AND
CONVERT(TIME, CURRENT_TIMESTAMP) BETWEEN TimeStart AND TimeEnd

 

use master