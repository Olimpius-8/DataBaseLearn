IF DB_ID('Pelegram') IS NOT NULL
BEGIN
    use Pelegram
END
go

--SELECT * FROM Users
INSERT INTO Users(PhoneNumber,Name, Lastname, Surname, LastSession, EncriptionKey) VALUES
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
set identity_INSERT Users ON
go
INSERT INTO Users(ID,Nickname,PhoneNumber,Name, Lastname, Surname, LastSession, EncriptionKey) VALUES
(11,'Kestrel',		'12345678912',	'John',		'Fucs',			'Eidar',		Current_TimeStamp,	'sl;dfigpsdok'	),
(12,'Thorn',		'22222222222',	'������',	'������',		NULL,	Current_TimeStamp,	'190238r7ns9dg8'	),
(13,'OSA',			'33333333333',	'���',		'��������',		'�������',  Current_TimeStamp,	'xcz-09n809m09b8'	),
(14,'Thunderbird',	'44444444444',	'����',		'����',			NUll,	Current_TimeStamp,	'kl1j2 #%L@K3j 5'	),
(15,'Oryx',		'55555555555',	'����',		'���-�����',	NULL,	Current_TimeStamp,	'AHxvnshrti76tru'	),
(16,'Flores',		'66666666666',	'������',	'��������',		'������',		CURRENT_TIMESTAMP,	'q34TGDJ&IKYUTYK'),
(17,'Aruni',		'99999999999',	'����',		'���������',	NULL,	CURRENT_TIMESTAMP,	'ZFB6867kTGUYu8o'),
(18,'Zero',		'88888888888',  '������',	'�����',		'���',	CURRENT_TIMESTAMP,	'xcXZ(CB(dfbd09f78'),
(19,'Ace',			'01010101010',	'������',	'���������',	NULL,		CURRENT_TIMESTAMP,	'cvb%^Hr6ju6556'),
(20,'Iana',		'02020202020',	'�����',	'�����',		NULL,	CURRENT_TIMESTAMP,	'zxcRY^Rmyhuk&789'),

(21,'Wamai',		'03030303030',	'�����',	'������',		'������',	Current_TimeStamp,	'XZCturtgjRTURRT'	),
(22,'kali',		'04040404040',	'���������','��������',		'���',	Current_TimeStamp,	'sdgoi&(*R&Hsjdgj'	),
(23,'Amaru',		'05050505050',	'�����',	'�������',		'�����',  Current_TimeStamp,	'fh5U%U45u4turtu'	),
(24,'melusi',		'06060606060',	'�������',	'������',	NULL,	Current_TimeStamp,	'fo9h*&^Slgkjsd897'	),
(25,'Maestro',		'07070707070',	'��������',	'��������',	NULL,	Current_TimeStamp,	'^&ASf6s5d4g6d6s7g'	),
(26,'Alibi',		'08080808080',	'����','�� ����',		NULL,		CURRENT_TIMESTAMP,	'xc.bmsoiUOIRUYl;m'),
(27,'Lion',		'09090909090',	'������',	'������',	NULL,	CURRENT_TIMESTAMP,	'lKGRO*&(SE:LW><M'),
(28,'Vigil',		'16549084982',  '���',	'���',		'�����',	CURRENT_TIMESTAMP, 'LDOAI(@#N_)MDS)'),
(29,'Dokkaebi',	'11111222222',	'���',	'�����',		NULL,		CURRENT_TIMESTAMP, 'XCLKB JPSORM)('),
(30,'Jackal',		'11122222222',	'�������','���-������',		'����',	CURRENT_TIMESTAMP, 'IRFGIIOIOdsfhrtndghU&'),

(31,'Ying',		'34343434343',	'��',	'���',	'����',	Current_TimeStamp,	'L: IE(*G S(DG SDU*G'	),
(32,'Goyo',		'35353535353',	'����',	'�����',	'��������',	Current_TimeStamp,	'sdalgkj9er8t7b 987 0w'	),
(33,'Lesion',		'36363636363',	'��',	'���',		'���',  Current_TimeStamp,	'2o349r =09rt8 dogj pdjf'	),
(34,'Warden',		'37373737374',	'�����',	'��������',	NULL,	Current_TimeStamp,	'dfl akjd=908374 t897yerg'	),
(35,'Mozzie',		'78787878787',	'����',	'����',	NULL,	Current_TimeStamp,	'asdfo978BOFHXLBKJ&*^'	),
(36,'Gridlock',	'40404040888',	'����','������',		'�����',		CURRENT_TIMESTAMP,	'f.h,m$%UY>RTZ'),
(37,'Mira',		'43845378965',	'�����',	'��������',	'�����',	CURRENT_TIMESTAMP,	'd/cVN<SR:TLji'),
(38,'Kaid',		'02468024680',  '�������',	'���-�����',		NULL,	CURRENT_TIMESTAMP, 'LKVJXCOIBNUIOSUET'),
(39,'Clash',		'01357975310',	'������',	'�����',		NULL,		CURRENT_TIMESTAMP, 'EOITUD()*&BNXC(HP<'),
(40,'Maverick',	'74185296302',	'����','����',		NULL,	CURRENT_TIMESTAMP, 'KZH&^V%XCBO(XVIN');


INSERT INTO StopWords(Word, priority) VALUES
('��������',			2),
('��������',			2),
('����������',			1),
('��������',			2),
('���������',			2),
('�� �� ��������',		4);

insert into StopWords(Word, Priority) values
('�����������',7)

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
(5,GETDATE()+2,'07:30','15:30'),
(4,GETDATE()+3,'05:30','22:30');

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
(3,5),
(7,4)

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

--day 2
INSERT INTO TextMessage VALUES
(1,'����� �������� ��������', CURRENT_TIMESTAMP, 1,CURRENT_TIMESTAMP,0,NULL,0,0,NULL),
(2,'����-�� ����� ��� ��������?', CURRENT_TIMESTAMP,1, CURRENT_TIMESTAMP,1,CURRENT_TIMESTAMP+0.5,1,0,NULL),
(3,'��� ����� ����� �������� �������������, ����� ������� �����', CURRENT_TIMESTAMP, 0, NULL, 0,NULL,0,0,1),
(2,'� ��� ���������� ������',CURRENT_TIMESTAMP, 0, NULL, 0,NULL,0,0,NULL)

insert into MessagesDialog values 
(4,9),
(3,10),
(2,11),
(3,12)


insert into TextMessage values
(1,'���� ����� �������?',CURRENT_TIMESTAMP, 1,CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0,0,NULL),
(2,'��� �Ѩ ��������?',CURRENT_TIMESTAMP, 1,CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0,0,NULL),
(3,'���� ��������?',CURRENT_TIMESTAMP, 1,CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0,0,NULL),
(4,'��� ����� ����������?',CURRENT_TIMESTAMP, 1,CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0,0,NULL)

insert into MessagesConference values
(1,13),
(1,14),
(1,15),
(1,16)

------------

--day 3
insert into TextMessage values
(1,'���� ����� �������?',CURRENT_TIMESTAMP, 1,CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0,0,NULL),
(2,'��� ����� ����������?',CURRENT_TIMESTAMP, 1,CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0,0,NULL),
(3,'���',CURRENT_TIMESTAMP, 1,CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0,0,NULL),
(4,'����',CURRENT_TIMESTAMP, 1,CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0,0,NULL)

insert into MessagesDialog values 
(4,17),
(3,18),
(2,19),
(3,20)

--day 4 
insert into TextMessage values
(1,'���� ����� �������?',CURRENT_TIMESTAMP, 1,CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0,0,NULL),
(2,'��� ����� ����������?',CURRENT_TIMESTAMP, 1,CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0,0,NULL),
(3,'���� �����������',CURRENT_TIMESTAMP, 1,CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0,0,NULL),
(4,'����',CURRENT_TIMESTAMP, 1,CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0,0,NULL)

insert into MessagesDialog values 
(4,21),
(3,22),
(2,23),
(3,24)
-------------------------
insert into ContactBook(IDOwner, IDContact, BlacklistStatus) values
(5,2,1),
(5,4,0),
(5,6,0),
(5,8,0),
(5,9,1),
(5,10,0),

(6,7,1),
(6,8,0),
(6,3,1),
(6,11,1),
(6,13,0),
(6,15,0),

(7,8,0),
(7,9,0),
(7,13,0),
(7,12,0),

(8,9,0),
(8,10,0),
(8,11,0),
(8,12,0),
(8,13,1),

(9,10,0),
(9,11,0),
(9,12,0),
(9,13,0),
(9,14,0),
(9,15,1),

(10,11,0),
(10,12,0),
(10,13,1),
(10,14,1),
(10,15,0),

(11,12,0),
(11,13,0),
(11,14,0),
(11,15,0),
(11,16,0),
(11,17,0),
(11,18,0),

(12,13,0),
(12,16,1),
(12,17,0),
(12,18,0),
(12,19,0),
(12,20,1),

(13,4,1),
(13,18,1),
(13,20,0),
(13,23,0),

(14,15,1),

(15,18,1),
(15,22,0),
(15,23,0),
(15,25,0),

(16,18,1),

(17,19,0),

(19,21,0),
(19,22,1),

(20,21,0),
(20,22,0),
(20,23,0),
(20,26,1),
(20,28,1),

(21,22,0),
(21,26,0),
(21,28,0),

(22,23,0),
(22,24,0),
(22,25,1),
(22,26,1),
(22,27,0),
(22,28,0),

(23,26,1),

(24,25,0),
(24,26,0),
(24,27,0),

(25,26,0),
(25,27,0),

(26,27,0),
(26,28,0),
(26,29,0),

(27,28,0),
(27,29,0),
(27,30,0),
(27,1,0),

(28,30,0),
(28,1,0),
(28,2,0),

(29,28,0),
(29,30,0),
(29,1,0),
(29,2,0),

(30,1,0),
(30,2,0),
(30,3,0),
(30,4,0),
(30,5,0),
(30,6,0),
(30,7,0),
(30,8,0),

(31,30,1),
(31,32,0),
(31,33,0),
(31,35,0),
(31,36,0),

(32,33,0),
(32,35,0),
(32,39,0),

(33,34,0),
(33,35,0),
(33,37,0),
(33,38,0),

(34,36,0),
(34,38,0),
(34,37,0),
(34,39,0),

(35,34,0),
(35,36,0),
(35,37,0),
(35,38,0),
(35,40,0),

(36,37,0),
(36,38,0),

(37,40,0),

(38,39,0),
(38,40,0),

(39,40,1),

(40,1,0),
(40,2,0);

INSERT INTO Dialog(IDFirst, IDSecond, TimeCreate, LastMessage, LastAttachment) VALUES
(5,4,'20210102 18:00',NULL,NULL),
(5,6,'20210103 15:00',NULL,NULL),
(5,8,'20210105 12:00',NULL,NULL),
(5,10,'20210118 22:00',NULL,NULL),

(6,8,'20210202 03:00',NULL,NULL),
(6,13,'20210214 10:00',NULL,NULL),
(6,12,'20210223 13:35',NULL,NULL),
(6,30,'20210227 17:40',NULL,NULL),

(7,8,'20210305',NULL,NULL),
(7,9,'20210311',NULL,NULL),
(7,12,'20210322',NULL,NULL),
(7,13,'20210328',NULL,NULL),

(8,9,'20210402 22:23',NULL,NULL),
(8,12,'20210418 13:48',NULL,NULL),
(8,10,'20210427 19:47',NULL,NULL),

(9,10,'20210508 6:30',NULL,NULL),
(9,13,'20210517 13:45',NULL,NULL),
(9,14,'20210521 19:00',NULL,NULL),

(10,11,'20210608 18:11',NULL,NULL),
(10,12,'20210611 05:45',NULL,NULL),
(11,13,'20210622 16:34',NULL,NULL),

(12,13,'20210704 13:16',NULL,NULL),
(12,17,'20210715 15:28',NULL,NULL),

(13,20,'20210802 1:56',NULL,NULL),
(13,23,'20210809 22:28',NULL,NULL),

(15,22,'20210907 13:18',NULL,NULL),
(15,23,'20210915 17:34',NULL,NULL),

(17,19,'20211006',NULL,NULL),
(20,23,'20211018',NULL,NULL),

(21,26,'20211106',NULL,NULL),
(21,28,'20211118',NULL,NULL),
(29,30,'20211126',NULL,NULL),

(31,32,'20210118',NULL,NULL),
(31,33,'20210204',NULL,NULL),
(31,35,'20210325',NULL,NULL),
(31,36,'20210413',NULL,NULL),
(32,39,'20210514',NULL,NULL),
(33,37,'20210623',NULL,NULL),
(33,38,'20210720',NULL,NULL),
(34,38,'20210810',NULL,NULL),
(35,40,'20210902',NULL,NULL),
(36,37,'20211025',NULL,NULL),
(37,40,'20211108',NULL,NULL),
(38,39,'20211230',NULL,NULL)

INSERT INTO Timetable(IDMajor, WorkDay, TimeStart, TimeEnd) VALUES
(2,GETDATE()+1,'08:30','23:30'),
(5,GETDATE()+2,'07:30','23:30'),
(4,GETDATE()+3,'05:30','23:30');

SELECT * FROM TextMessage

--quarter 1 
INSERT INTO TextMessage VALUES
(1,'�������� ������'		, '20210102 16:37', 0,NULL,0,NULL,0,0,NULL),
(2,'�������� ���������'		, '20210104 14:31' ,0, NULL,0,NULL,0,0,NULL),
(3,'���������� �����'		, '20210105 11:08', 0, NULL, 0,NULL,0,0,NULL),
(4,'��������� ����������'	, '20210107 13:39', 0, NULL, 0,NULL,0,0,NULL),
(6,'����������� �����'		, '20210108 20:18', 0,NULL,0,NULL,0,0,NULL),
(7,'�������� ������'		, '20210110 21:24' ,0, NULL,0,NULL,0,0,NULL),
(8,'����������� ���������'	, '20210112 19:50', 0, NULL, 0,NULL,0,0,NULL),
(9,'���������� �����'		, '20210118 18:45', 0, NULL, 0,NULL,0,0,NULL),

(11,'��������� ����������'	, '20210202 19:40', 0,NULL,0,NULL,0,0,NULL),
(13,'�������� �����'		, '20210228 18:11' ,0, NULL,0,NULL,0,0,NULL),
(17,'��������� ����������'	, '20210226 15:18', 0, NULL, 0,NULL,0,0,NULL),
(21,'���������� ������'		, '20210214 16:15', 0, NULL, 0,NULL,0,0,NULL),
(40,'�������� ������������'	, '20210213 17:24', 0,NULL,0,NULL,0,0,NULL),
(33,'�������� ���������'	, '20210208 21:48' ,0, NULL,0,NULL,0,0,NULL),

(26,'��������� ����������'	, '20210305 11:36', 0, NULL, 0,NULL,0,0,NULL),
(15,'�������� ����?'		, '20210308 19:47', 0, NULL, 0,NULL,0,0,NULL),
(36,'���������� �����'		, '20210309 16:22', 0,NULL,0,NULL,0,0,NULL),
(28,'���������� �����'		, '20210314 13:39' ,0, NULL,0,NULL,0,0,NULL),
(19,'��������� ����������'	, '20210315 12:18', 0, NULL, 0,NULL,0,0,NULL),
(37,'�������� �������'		, '20210325 13:49', 0, NULL, 0,NULL,0,0,NULL)

INSERT INTO MessagesDialog VALUES
(1,25),
(3,26),
(2,27),
(4,28),
(6,29),
(16,30),
(12,31),
(17,32),

(26,33),
(13,34),
(30,35),
(37,36),
(48,37),
(41,38),

(37,39),
(33,40),
(43,41),
(38,42),
(35,43),
(45,44)

INSERT INTO Ring(IDInner, IDOuter, TimeStart,TimeEnd) VALUES 
(1,2,'20210103 16:23','20210103 16:25'),
(3,4,'20210108 15:48',NULL),
(2,3,'20210109 18:39',NULL),
(1,4,'20210122 17:31',NULL),

(5,4,'20210208 18:45',NULL),
(6,5,'20210214 12:18',NULL),
(8,10,'20210215 13:26',NULL),
(8,10,'20210226 17:34',NULL),

(8,11,'20210301 18:33',NULL),
(10,12,'20210304 16:19',NULL),
(1,12,'20210318 13:46',NULL),
(13,20,'20210322 15:43',NULL)

--quarter 2
INSERT INTO TextMessage VALUES
(5,'�������� ������'		, '20210403 15:26', 0,NULL,0,NULL,0,0,NULL),-----
(2,'�������� ������'		, '20210405 13:41' ,0, NULL,0,NULL,0,0,NULL),
(3,'���������� �����'		, '20210406 12:48', 0, NULL, 0,NULL,0,0,NULL),
(4,'��������� ��������� '	, '20210408 11:59', 0, NULL, 0,NULL,0,0,NULL),
(6,'����������� �����'		, '20210409 19:32', 0,NULL,0,NULL,0,0,NULL),
(10,'�������� ������'		, '20210411 20:34' ,0, NULL,0,NULL,0,0,NULL),-----
(8,'����������� ���������'	, '20210415 17:20', 0, NULL, 0,NULL,0,0,NULL),
(12,'���������� �����'		, '20210420 16:55', 0, NULL, 0,NULL,0,0,NULL),----

(11,'���������� ���������'	, '20210502 18:54', 0,NULL,0,NULL,0,0,NULL),
(13,'�������� �����'		, '20210528 16:31' ,0, NULL,0,NULL,0,0,NULL),
(15,'��������� ����������'	, '20210526 14:48', 0, NULL, 0,NULL,0,0,NULL),----
(21,'���������� ������'		, '20210514 15:25', 0, NULL, 0,NULL,0,0,NULL),
(28,'�������� ������������'	, '20210513 19:42', 0,NULL,0,NULL,0,0,NULL),----
(33,'�������� ���������'	, '20210508 20:38' ,0, NULL,0,NULL,0,0,NULL),

(26,'��������� ����������'	, '20210605 12:30', 0, NULL, 0,NULL,0,0,NULL),
(15,'�������� ����?'		, '20210608 18:27', 0, NULL, 0,NULL,0,0,NULL),----
(36,'���������� �����'		, '20210609 15:52', 0, NULL,0,NULL,0,0,NULL),
(28,'���� ����������'		, '20210614 14:19' ,0, NULL,0,NULL,0,0,NULL),
(26,'������ ����� ���������', '20210615 11:48', 0, NULL, 0,NULL,0,0,NULL),----
(37,'�������� �������'		, '20210625 15:26', 0, NULL, 0,NULL,0,0,NULL),
--=================================================================================
(2,'�������� c���'				, '20210405 13:41' ,0, NULL,0,NULL,0,0,NULL),
(3,'���������� �����'			, '20210406 12:48', 0, NULL, 0,NULL,0,0,NULL),
(4,'������������ ��������� '	, '20210408 11:59', 0, NULL, 0,NULL,0,0,NULL),
(6,'����������� �����'			, '20210409 19:32', 0,NULL,0,NULL,0,0,NULL),
(10,'�������� ���������'		, '20210411 20:34' ,0, NULL,0,NULL,0,0,NULL),
(8,'����������� ��������'		, '20210415 17:20', 0, NULL, 0,NULL,0,0,NULL),
(9,'���������� ��������'		, '20210420 16:55', 0, NULL, 0,NULL,0,0,NULL),

(11,'����� ���������'	,		 '20210502 18:54', 0,NULL,0,NULL,0,0,NULL),
(13,'�������� �����'			, '20210528 16:31' ,0, NULL,0,NULL,0,0,NULL),
(17,'��������� ����������'		, '20210526 14:48', 0, NULL, 0,NULL,0,0,NULL),
(21,'���������� ����'			, '20210514 15:25', 0, NULL, 0,NULL,0,0,NULL),
(40,'�������� ����� ������������'	, '20210513 19:42', 0,NULL,0,NULL,0,0,NULL),
(33,'�������� �������'			, '20210508 20:38' ,0, NULL,0,NULL,0,0,NULL),

(26,'��������� �����������'	, '20210605 12:30', 0, NULL, 0,NULL,0,0,NULL),
(15,'�������� �����?'		, '20210608 18:27', 0, NULL, 0,NULL,0,0,NULL),
(36,'������� ����������'	, '20210609 15:52', 0, NULL,0,NULL,0,0,NULL),
(28,'�������� ����������'	, '20210614 14:19' ,0, NULL,0,NULL,0,0,NULL),
(19,'������ ����� ���������', '20210615 11:48', 0, NULL, 0,NULL,0,0,NULL),
(37,'������� ��������'		, '20210625 15:26', 0, NULL, 0,NULL,0,0,NULL)

INSERT INTO MessagesDialog VALUES
(5,45),---
(3,46),
(2,47),
(4,48),
(6,49),
(8,50),---
(12,51),
(18,52),---

(26,53),
(13,54),
(33,55),---
(37,56),
(38,57),---
(41,58),

(37,59),
(34,60),---
(43,61),
(38,62),
(37,63),---
(45,64),
--------------------
(3,65),
(2,66),
(4,67),
(6,68),
(16,69),
(12,70),
(17,71),

(26,72),
(13,73),
(30,74),
(37,75),
(48,76),
(41,77),

(37,78),
(33,79),
(43,80),
(38,81),
(35,82),
(45,83)

INSERT INTO Ring(IDInner, IDOuter, TimeStart,TimeEnd) VALUES 
(1,2,'20210403 16:23','20210403 16:25'),
(3,4,'20210408 15:48','20210408 15:54'),
(2,3,'20210409 18:39','20210409 18:42'),
(1,4,'20210422 17:31','20210422 17:38'),
(5,4,'20210508 18:45','20210508 18:46'),
(6,5,'20210514 12:18','20210514 12:23'),
(8,10,'20210515 13:26','20210515 13:36'),
(8,10,'20210526 17:34','20210526 17:38'),
(8,11,'20210601 18:33','20210601 18:43'),
(10,12,'20210604 16:19','20210604 16:25'),
(1,12,'20210618 13:46','20210618 13:49'),
(13,20,'20210622 15:43','20210622 15:47'),
(13,20,'20210622 15:53','20210622 15:56'),
(13,20,'20210623 15:58','20210623 16:01')



--quarter 3

INSERT INTO TextMessage VALUES
(5,'���������� ������'		, '20210703 15:26', 0,NULL,0,NULL,0,0,NULL),-----
(2,'�������� ������'		, '20210705 13:41' ,0, NULL,0,NULL,0,0,NULL),
(3,'���������� �����'		, '20210706 12:48', 0, NULL, 0,NULL,0,0,NULL),
(4,'��������� ��������� '	, '20210708 11:59', 0, NULL, 0,NULL,0,0,NULL),
(6,'����������� �����'		, '20210709 19:32', 0,NULL,0,NULL,0,0,NULL),
(10,'�������� ������'		, '20210711 20:34' ,0, NULL,0,NULL,0,0,NULL),-----
(8,'����������� ���������'	, '20210715 17:20', 0, NULL, 0,NULL,0,0,NULL),
(12,'���������� �����'		, '20210720 16:55', 0, NULL, 0,NULL,0,0,NULL),----

(11,'���������� ���������'	, '20210802 18:54', 0,NULL,0,NULL,0,0,NULL),
(13,'�������� �����'		, '20210828 16:31' ,0, NULL,0,NULL,0,0,NULL),
(15,'��������� ����������'	, '20210826 14:48', 0, NULL, 0,NULL,0,0,NULL),----
(21,'���������� ������'		, '20210814 15:25', 0, NULL, 0,NULL,0,0,NULL),
(28,'�������� ������������'	, '20210813 19:42', 0,NULL,0,NULL,0,0,NULL),----
(33,'�������� ���������'	, '20210808 20:38' ,0, NULL,0,NULL,0,0,NULL),

(26,'��������� ����������'	, '20210905 12:30', 0, NULL, 0,NULL,0,0,NULL),
(15,'�������� ����?'		, '20210908 18:27', 0, NULL, 0,NULL,0,0,NULL),----
(36,'���������� �����'		, '20210909 15:52', 0, NULL,0,NULL,0,0,NULL),
(28,'���� ����������'		, '20210914 14:19' ,0, NULL,0,NULL,0,0,NULL),
(26,'������ ����� ���������', '20210915 11:48', 0, NULL, 0,NULL,0,0,NULL),----
(37,'�������� �������'		, '20210925 15:26', 0, NULL, 0,NULL,0,0,NULL),
--=================================================================================
(2,'�������� c���'				, '20210705 13:41' ,0, NULL,0,NULL,0,0,NULL),
(3,'���������� �����'			, '20210706 12:48', 0, NULL, 0,NULL,0,0,NULL),
(4,'������������ ��������� '	, '20210708 11:59', 0, NULL, 0,NULL,0,0,NULL),
(6,'����������� �����'			, '20210709 19:32', 0,NULL,0,NULL,0,0,NULL),
(10,'�������� ���������'		, '20210711 20:34' ,0, NULL,0,NULL,0,0,NULL),
(8,'����������� ��������'		, '20210715 17:20', 0, NULL, 0,NULL,0,0,NULL),
(9,'���������� ��������'		, '20210720 16:55', 0, NULL, 0,NULL,0,0,NULL),

(11,'����� ���������'			, '20210802 18:54', 0,NULL,0,NULL,0,0,NULL),
(13,'�������� �����'			, '20210828 16:31' ,0, NULL,0,NULL,0,0,NULL),
(17,'��������� ����������'		, '20210826 14:48', 0, NULL, 0,NULL,0,0,NULL),
(21,'���������� ����'			, '20210814 15:25', 0, NULL, 0,NULL,0,0,NULL),
(40,'�������� ����� ������������'	, '20210813 19:42', 0,NULL,0,NULL,0,0,NULL),
(33,'�������� �������'			, '20210808 20:38' ,0, NULL,0,NULL,0,0,NULL),

(26,'��������� �����������'	, '20210905 12:30', 0, NULL, 0,NULL,0,0,NULL),
(15,'�������� �����?'		, '20210908 18:27', 0, NULL, 0,NULL,0,0,NULL),
(36,'������� ����������'	, '20210909 15:52', 0, NULL,0,NULL,0,0,NULL),
(28,'�������� ����������'	, '20210914 14:19' ,0, NULL,0,NULL,0,0,NULL),
(19,'������ ����� ���������', '20210915 11:48', 0, NULL, 0,NULL,0,0,NULL),
(37,'������� ��������'		, '20210925 15:26', 0, NULL, 0,NULL,0,0,NULL)

INSERT INTO MessagesDialog VALUES
(5,84),---
(3,85),
(2,86),
(4,87),
(6,88),
(8,89),---
(12,90),
(18,91),---

(26,92),
(13,93),
(33,94),---
(37,95),
(38,96),---
(41,97),

(37,98),
(34,99),---
(43,100),
(38,101),
(37,102),---
(45,103),
--------------------
(3,104),
(2,105),
(4,106),
(6,107),
(16,108),
(12,109),
(17,110),

(26,111),
(13,112),
(30,113),
(37,114),
(48,115),
(41,116),

(37,117),
(33,118),
(43,119),
(38,120),
(35,121),
(45,122)

INSERT INTO Ring(IDInner, IDOuter, TimeStart,TimeEnd) VALUES 
(1,2,'20210703 16:23','20210703 16:25'),
(3,4,'20210708 15:48','20210708 15:54'),
(2,3,'20210709 18:39','20210709 18:42'),
(1,4,'20210722 17:31','20210722 17:38'),
(5,4,'20210808 18:45','20210808 18:46'),
(6,5,'20210814 12:18','20210814 12:23'),
(8,10,'20210815 13:26','20210815 13:36'),
(8,10,'20210826 17:34','20210826 17:38'),
(8,11,'20210901 18:33','20210901 18:43'),
(10,12,'20210904 16:19','20210904 16:25'),
(1,12,'20210918 13:46','20210918 13:49'),
(13,20,'20210922 15:43','20210922 15:47'),
(13,20,'20210922 15:53','20210922 15:56'),
(13,20,'20210923 15:58','20210923 16:01')


