IF DB_ID('Pelegram') IS NOT NULL
BEGIN
    use Pelegram
END
go

--SELECT * FROM Users
INSERT INTO Users(PhoneNumber,Name, Lastname, Surname, LastSession, EncriptionKey) VALUES
('Abraksas',	'77777777777',	'Абраксас',	'Кужугетов',	'Арсланович',	Current_TimeStamp,	'df8s96sdg76d'	),
('ЗЫЗЫА',		'78956423512',	'Тимофей',	'Покрышкин',	'Михайлович',	Current_TimeStamp,	'k234jhKJh342'	),
('a',			'76786592873',	'Афанасий',	'Малыкин',		'Ибрагимович',  Current_TimeStamp,	'as0b9cv7hj'	),
('b',			'79864521354',	'Андрей',	'Скоморохин',	'Тимурович',	Current_TimeStamp,	'odfiger9df'	),
('c',			'87907987986',	'Анатолий',	'Силиванов',	'Артурович',	Current_TimeStamp,	'D)(UdsgG*(&s9'	),
('Lopat',		'72342938598',	'Константин','Лебедев',		'Олегович',		CURRENT_TIMESTAMP,	'ao978f90 rtq9439'),
('Nomad',		'91348573495',	'Андрей',	'Никифоров',	'Степанович',	CURRENT_TIMESTAMP,	'aosdiuvcxocvij'),
('Valkyrie',	'12039857149',  'Ирина',	'Семенчук',		'Дмитриевна',	CURRENT_TIMESTAMP, 'aov-214'),
('Monty',		'49328574983',	'Геннадий',	'Бенедикт',		'Cергеев',		CURRENT_TIMESTAMP, '2039cb-xcb-09*&'),
('Smoke',		'89787676554',	'Владислав','Покрышин',		'Михайлович',	CURRENT_TIMESTAMP, '(*&kjvisu&^%$sdg');
go
set identity_INSERT Users ON
go
INSERT INTO Users(ID,Nickname,PhoneNumber,Name, Lastname, Surname, LastSession, EncriptionKey) VALUES
(11,'Kestrel',		'12345678912',	'John',		'Fucs',			'Eidar',		Current_TimeStamp,	'sl;dfigpsdok'	),
(12,'Thorn',		'22222222222',	'Бриана',	'Скехан',		NULL,	Current_TimeStamp,	'190238r7ns9dg8'	),
(13,'OSA',			'33333333333',	'Аня',		'Катарина',		'Янкович',  Current_TimeStamp,	'xcz-09n809m09b8'	),
(14,'Thunderbird',	'44444444444',	'Мина',		'Скай',			NUll,	Current_TimeStamp,	'kl1j2 #%L@K3j 5'	),
(15,'Oryx',		'55555555555',	'Саиф',		'аль-Хадид',	NULL,	Current_TimeStamp,	'AHxvnshrti76tru'	),
(16,'Flores',		'66666666666',	'Мигель',	'Сантьяго',		'Лусеро',		CURRENT_TIMESTAMP,	'q34TGDJ&IKYUTYK'),
(17,'Aruni',		'99999999999',	'Апха',		'Таванрунг',	NULL,	CURRENT_TIMESTAMP,	'ZFB6867kTGUYu8o'),
(18,'Zero',		'88888888888',  'Сэмюэл',	'Фишер',		'Лео',	CURRENT_TIMESTAMP,	'xcXZ(CB(dfbd09f78'),
(19,'Ace',			'01010101010',	'Ховард',	'Хаугаланн',	NULL,		CURRENT_TIMESTAMP,	'cvb%^Hr6ju6556'),
(20,'Iana',		'02020202020',	'Нинке',	'Мейер',		NULL,	CURRENT_TIMESTAMP,	'zxcRY^Rmyhuk&789'),

(21,'Wamai',		'03030303030',	'Нгучи',	'Мучоки',		'Фураха',	Current_TimeStamp,	'XZCturtgjRTURRT'	),
(22,'kali',		'04040404040',	'Калимохан','Джаймини',		'Шах',	Current_TimeStamp,	'sdgoi&(*R&Hsjdgj'	),
(23,'Amaru',		'05050505050',	'Росио',	'Асусена',		'Киспе',  Current_TimeStamp,	'fh5U%U45u4turtu'	),
(24,'melusi',		'06060606060',	'Тандиве',	'Ндлову',	NULL,	Current_TimeStamp,	'fo9h*&^Slgkjsd897'	),
(25,'Maestro',		'07070707070',	'Адрианно',	'Мартелло',	NULL,	Current_TimeStamp,	'^&ASf6s5d4g6d6s7g'	),
(26,'Alibi',		'08080808080',	'Ария','де Лука',		NULL,		CURRENT_TIMESTAMP,	'xc.bmsoiUOIRUYl;m'),
(27,'Lion',		'09090909090',	'Оливье',	'Фламан',	NULL,	CURRENT_TIMESTAMP,	'lKGRO*&(SE:LW><M'),
(28,'Vigil',		'16549084982',  'Хва',	'Кен',		'Чхоль',	CURRENT_TIMESTAMP, 'LDOAI(@#N_)MDS)'),
(29,'Dokkaebi',	'11111222222',	'Нам',	'Грейс',		NULL,		CURRENT_TIMESTAMP, 'XCLKB JPSORM)('),
(30,'Jackal',		'11122222222',	'Рамирес','аль-Хассар',		'Рияд',	CURRENT_TIMESTAMP, 'IRFGIIOIOdsfhrtndghU&'),

(31,'Ying',		'34343434343',	'Сю',	'Мей',	'Линь',	Current_TimeStamp,	'L: IE(*G S(DG SDU*G'	),
(32,'Goyo',		'35353535353',	'Руис',	'Сесар',	'Эрнандес',	Current_TimeStamp,	'sdalgkj9er8t7b 987 0w'	),
(33,'Lesion',		'36363636363',	'Лю',	'Цзе',		'Лун',  Current_TimeStamp,	'2o349r =09rt8 dogj pdjf'	),
(34,'Warden',		'37373737374',	'Колин',	'Маккинли',	NULL,	Current_TimeStamp,	'dfl akjd=908374 t897yerg'	),
(35,'Mozzie',		'78787878787',	'Макс',	'Гуус',	NULL,	Current_TimeStamp,	'asdfo978BOFHXLBKJ&*^'	),
(36,'Gridlock',	'40404040888',	'Тори','Фейрус',		'Тальо',		CURRENT_TIMESTAMP,	'f.h,m$%UY>RTZ'),
(37,'Mira',		'43845378965',	'Елена',	'Альварес',	'Мария',	CURRENT_TIMESTAMP,	'd/cVN<SR:TLji'),
(38,'Kaid',		'02468024680',  'Джаляль',	'эль-Фасси',		NULL,	CURRENT_TIMESTAMP, 'LKVJXCOIBNUIOSUET'),
(39,'Clash',		'01357975310',	'Мороуа',	'Эванс',		NULL,		CURRENT_TIMESTAMP, 'EOITUD()*&BNXC(HP<'),
(40,'Maverick',	'74185296302',	'Эрик','Торн',		NULL,	CURRENT_TIMESTAMP, 'KZH&^V%XCBO(XVIN');


INSERT INTO StopWords(Word, priority) VALUES
('Взорвать',			2),
('Похитить',			2),
('Уничтожить',			1),
('Взломать',			2),
('Устранить',			2),
('Не по телефону',		4);

insert into StopWords(Word, Priority) values
('Обезглавить',7)

INSERT INTO ComradeMajor(Name, Lastname, Surname) VALUES
('Антон','Бондаренко','Степанович'),
('Олег','Демидов','Александрович'),
('Борис','Овчаренко','Михайлович'),
('Артём','Сигизмундов','Игоревич'),
('Николай','Трофимов','Дамирович'),
('Владислав','Никифоров','Артёмович');

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
(1,'Надо найти и взорвать базу', CURRENT_TIMESTAMP, 1,CURRENT_TIMESTAMP,0,NULL,0,0,NULL),
(2,'Необходимо устранить конкурентов', CURRENT_TIMESTAMP+1,1, CURRENT_TIMESTAMP,1,CURRENT_TIMESTAMP+0.5,1,0,NULL),
(3,'Надо найти на карте оставленные документы и взорвать взорвать их', CURRENT_TIMESTAMP+2, 0, NULL, 0,NULL,0,0,NULL),
(2,'Необходимо обеспечить  и взорвать взорвать непрерывной поток данных',CURRENT_TIMESTAMP+1, 0, NULL, 0,NULL,0,0,NULL)
   
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
(1,'А что он нам предлагает?', CURRENT_TIMESTAMP, 1,CURRENT_TIMESTAMP,0,NULL,0,0,NULL),
(2,'Ну даже не знаю, может позже скажет', CURRENT_TIMESTAMP+1,1, CURRENT_TIMESTAMP,1,CURRENT_TIMESTAMP+0.5,1,0,NULL),
(3,'Это при том, что у нас его нету', CURRENT_TIMESTAMP+2, 0, NULL, 0,NULL,0,0,1),
(2,'И ему ещё нужно согласовать это',CURRENT_TIMESTAMP+1, 0, NULL, 0,NULL,0,0,NULL)

go

--select * from MessagesConference

--drop table mentions 
--select * from ring

insert into Ring Values
(1,3,'ноя 12 2021 4:22PM', 'ноя 12 2021 4:30PM',480),
(2,4,'ноя 12 2021 8:46PM', 'ноя 12 2021 9:02PM',960) 
go

--ring, word, major, time
insert into Mentions Values
(2,1,1,5),
(1,5,1,8),
(1,5,1,15),
(2,1,1,8)

--select * from Mentions

---------Статистика слов 1 процедура
/*select * from TextMessage
select * from Mentions 
select * from Coincedence order by IDWord

exec statistic
*/
go
-------------------------listusers
----------------------------------список пользователей 2 процедура
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
(1,'Нужно похитить премьера', CURRENT_TIMESTAMP, 1,CURRENT_TIMESTAMP,0,NULL,0,0,NULL),
(2,'Кого-то нужно ещё похитить?', CURRENT_TIMESTAMP,1, CURRENT_TIMESTAMP,1,CURRENT_TIMESTAMP+0.5,1,0,NULL),
(3,'Это нужно будет взорвать правительство, чтобы замести следы', CURRENT_TIMESTAMP, 0, NULL, 0,NULL,0,0,1),
(2,'И ещё уничтожить охрану',CURRENT_TIMESTAMP, 0, NULL, 0,NULL,0,0,NULL)

insert into MessagesDialog values 
(4,9),
(3,10),
(2,11),
(3,12)

insert into TextMessage values
(1,'Есть какие вопросы?',CURRENT_TIMESTAMP, 1,CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0,0,NULL),
(2,'каК ВСЁ взорвать?',CURRENT_TIMESTAMP, 1,CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0,0,NULL),
(3,'кого похитить?',CURRENT_TIMESTAMP, 1,CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0,0,NULL),
(4,'что нужно уничтожить?',CURRENT_TIMESTAMP, 1,CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0,0,NULL)

insert into MessagesConference values
(1,13),
(1,14),
(1,15),
(1,16)

------------

--day 3
insert into TextMessage values
(1,'Есть какие вопросы?',CURRENT_TIMESTAMP, 1,CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0,0,NULL),
(2,'что нужно уничтожить?',CURRENT_TIMESTAMP, 1,CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0,0,NULL),
(3,'Неу',CURRENT_TIMESTAMP, 1,CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0,0,NULL),
(4,'нету',CURRENT_TIMESTAMP, 1,CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0,0,NULL)

insert into MessagesDialog values 
(4,17),
(3,18),
(2,19),
(3,20)

--day 4 
insert into TextMessage values
(1,'Есть какие вопросы?',CURRENT_TIMESTAMP, 1,CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0,0,NULL),
(2,'что нужно уничтожить?',CURRENT_TIMESTAMP, 1,CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0,0,NULL),
(3,'кого обезглавить',CURRENT_TIMESTAMP, 1,CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0,0,NULL),
(4,'нету',CURRENT_TIMESTAMP, 1,CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0,0,NULL)

insert into MessagesDialog values 
(4,21),
(3,22),
(2,23),
(3,24)

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