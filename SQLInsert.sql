IF DB_ID('Pelegram') IS NOT NULL
BEGIN
    use Pelegram
END

INSERT INTO Users(Nickname,PhoneNumber,Name, Lastname, Surname, LastSession, EncriptionKey) VALUES
('Abraksas',	'77777777777',	'��������',	'���������',	'����������',	Current_TimeStamp,	'df8s96sdg76d'	),
('�����',		'78956423512',	'�������',	'���������',	'����������',	Current_TimeStamp,	'k234jhKJh342'	),
('a',			'76786592873',	'��������',	'�������',		'�����������',  Current_TimeStamp,	'as0b9cv7hj'	),
('b',			'79864521354',	'������',	'����������',	'���������',	Current_TimeStamp,	'odfiger9df'	),
('c',			'87907987986',	'��������',	'���������',	'���������',	Current_TimeStamp,	'D)(UdsgG*(&s9'	);

go

INSERT INTO StopWords(Word, priority) VALUES
('��������',			2),
('��������',			2),
('����������',			1),
('��������',			2),
('���������',			2),
('�� �� ��������',		4);

INSERT INTO ComradeMajor(Name, Lastname, Surname) VALUES
('�����','����������','����������'),
('����','�������','�������������'),
('�����','���������','����������'),
('����','�����������','��������'),
('�������','��������','���������'),
('���������','���������','��������');

SET IDENTITY_INSERT Timetable OFF		--��������� ������ ���� ID

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
(5,1),
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
(2,1,1),
(2,3,1),
(2,4,0)

--select * from contactbook 

--delete from ContactBook

SET IDENTITY_INSERT TextMessage OFF
go
INSERT INTO TextMessage VALUES
(1,'���� ����� ����', CURRENT_TIMESTAMP, 1,CURRENT_TIMESTAMP,0,NULL,0,0,NULL),
(2,'���������� ��������� �����������', CURRENT_TIMESTAMP+1,1, CURRENT_TIMESTAMP,1,CURRENT_TIMESTAMP+0.5,1,0,NULL),
(3,'���� ����� �� ����� ����������� ��������� � �������� ��������', CURRENT_TIMESTAMP+2, 0, NULL, 0,NULL,0,0,NULL)
  
  /*
  delete from messagesDialog
  delete from coincedence
  delete from TextMessage
  */
  --select * from textmessage

Select IDMessage, '�����' = StopWords.Word, IDMajor, CountInMessage 
from Coincedence
--JOIN Dictionary ON Dictionary.IDWord = Coincedence.IDWord
JOIN StopWords ON Coincedence.IDWord = StopWords.Id

INSERT INTO MessagesDialog VALUES
(1,1),
(1,2),
(2,3)

select * from MessagesDialog


--������� ����� ��������� �������� ������
SELECT  
ComradeMajor.ID,
'�����' = (ComradeMajor.Name +' '+ ComradeMajor.Lastname +' '+ ComradeMajor.Surname),
'����-�����' = StopWords.Word,
'���������' = StopWords.Priority
FROM Dictionary 
JOIN StopWords
ON Dictionary.IDWord = StopWords.ID
JOIN ComradeMajor
ON ComradeMajor.ID = Dictionary.IDMajor
JOIN TimeTable
ON TimeTable.IDMajor = ComradeMajor.ID
where TimeTable.WorkDay = Convert(Date, Current_TIMESTAMP) AND  Convert (Time, CURRENT_TIMESTAMP) BETWEEN TimeTable.TimeStart AND Timetable.TimeEnd 
--



SELECT * FROM Users

SELECT * FROM StopWords

SELECT * FROM Timetable

--������� ���������� �����
SELECT 
'��������'=(Users.Name +' '+Users.Lastname+' '+Users.Surname) ,
'��� �����' = Users.PhoneNumber, 
'�������'=(Users_2.Name +' '+Users_2.Lastname+' '+Users_2.Surname),
'�����' = Users_2.PhoneNumber
FROM ContactBook
JOIN Users				ON ContactBook.IDOwner = Users.ID
JOIN Users AS Users_2 ON ContactBook.IDContact = Users_2.ID

SELECT * FROM Timetable

select * from TextMessage

