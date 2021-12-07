IF DB_ID('Pelegram') IS NOT NULL
BEGIN
    use Pelegram
END
go

--SELECT * FROM Users
INSERT INTO Users(Nickname,PhoneNumber,Name, Lastname, Surname, LastSession, EncriptionKey) VALUES
('Abraksas',	'77777777777',	'��������',	'���������',	'����������',	Current_TimeStamp,	'df8s96sdg76d'	),
('�����',		'78956423512',	'�������',	'���������',	'����������',	Current_TimeStamp,	'k234jhKJh342'	),
('a',			'76786592873',	'��������',	'�������',		'�����������',  Current_TimeStamp,	'as0b9cv7hj'	),
('b',			'79864521354',	'������',	'����������',	'���������',	Current_TimeStamp,	'odfiger9df'	),
('c',			'87907987986',	'��������',	'���������',	'���������',	Current_TimeStamp,	'D)(UdsgG*(&s9'	),
('Lopat',		'72342938598',	'����������','�������',		'��������',		CURRENT_TIMESTAMP,	'ao978f90 rtq9439'),
('Nomad',		'91348573495',	'������',	'���������',	'����������',	CURRENT_TIMESTAMP,	'aosdiuvcxocvij'),
('Valkyrie',	'12039857149',  '�����',	'��������',		'����������',	CURRENT_TIMESTAMP, 'aov-214'),
('Monty',		'49328574983',	'��������',	'��������',		'C������',		CURRENT_TIMESTAMP, '2039cb-xcb-09*&'),
('Smoke',		'89787676554',	'���������','��������',		'����������',	CURRENT_TIMESTAMP, '(*&kjvisu&^%$sdg');
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

SET IDENTITY_INSERT Timetable OFF		

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
(2,4,0),
(3,1,1),
(3,4,0),
(4,2,1),
(4,3,0)

SET IDENTITY_INSERT Conference Off
go
insert into Conference values 
(1,CURRENT_TIMESTAMP),
(2,CURRENT_TIMESTAMP+1),
(3,CURRENT_TIMESTAMP+2),
(4,CURRENT_TIMESTAMP+3)


go
SET IDENTITY_INSERT TextMessage OFF

go
INSERT INTO TextMessage VALUES
(1,'���� ����� � �������� ����', CURRENT_TIMESTAMP, 1,CURRENT_TIMESTAMP,0,NULL,0,0,NULL),
(2,'���������� ��������� �����������', CURRENT_TIMESTAMP+1,1, CURRENT_TIMESTAMP,1,CURRENT_TIMESTAMP+0.5,1,0,NULL),
(3,'���� ����� �� ����� ����������� ��������� � �������� �������� ��', CURRENT_TIMESTAMP+2, 0, NULL, 0,NULL,0,0,NULL),
(2,'���������� ����������  � �������� �������� ����������� ����� ������',CURRENT_TIMESTAMP+1, 0, NULL, 0,NULL,0,0,NULL)
   
  go

  delete from TextMessage

go
INSERT INTO MessagesDialog VALUES
(1,1),
(2,2),
(4,3),
(3,4)


Select * from Dialog
/*
delete from MessagesDialog
select * from MessagesDialog
*/
go
SET IDENTITY_INSERT TextMessage OFF

go
INSERT INTO TextMessage VALUES
(1,'� ��� �� ��� ����������?', CURRENT_TIMESTAMP, 1,CURRENT_TIMESTAMP,0,NULL,0,0,NULL),
(2,'�� ���� �� ����, ����� ����� ������', CURRENT_TIMESTAMP+1,1, CURRENT_TIMESTAMP,1,CURRENT_TIMESTAMP+0.5,1,0,NULL),
(3,'��� ��� ���, ��� � ��� ��� ����', CURRENT_TIMESTAMP+2, 0, NULL, 0,NULL,0,0,1),
(2,'� ��� ��� ����� ����������� ���',CURRENT_TIMESTAMP+1, 0, NULL, 0,NULL,0,0,NULL)

go

--select * from MessagesConference

--drop table mentions 
--select * from ring

insert into Ring Values
(1,3,'��� 12 2021 4:22PM', '��� 12 2021 4:30PM',480),
(2,4,'��� 12 2021 8:46PM', '��� 12 2021 9:02PM',960) 
go

--ring, word, major, time
insert into Mentions Values
(2,1,1,5),
(1,5,1,8),
(1,5,1,15),
(2,1,1,8)

--select * from Mentions

---------���������� ���� 1 ���������
/*select * from TextMessage
select * from Mentions 
select * from Coincedence order by IDWord

exec statistic
*/
go
-------------------------listusers
----------------------------------������ ������������� 2 ���������
/*declare @Users ListLIneItem
--SET IDENTITY_INSERT @Users Off
insert into @Users Values 
-- IDCONf, IDUser, chat, attachment
(1,2,1,1),
(1,3,1,1),
(1,NULL,0,0),

(2,1,1,1),
(2,3,1,0),
(2,4,1,1),

(3,1,1,1),
(3,4,1,0),

(4,2,1,0)
select * from @Users
exec CreateListUsers @LineItems = @Users

*/

--delete  ListUsers
exec CreateListUsers @values = '
1,2,1,1;
1,3,1,1;
1,4,NULL,0;

2,1,1,1;
2,NULL,1,0;
2,4,1,1;

3,1,1,1;
3,4,1,0;

4,2,1,0;'



insert into MessagesConference values
(1,5),
(1,6),
(1,7),
(1,8)




