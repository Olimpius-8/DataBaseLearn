use master
--DROP DATABASE if exists DB.Pelegram;

IF DB_ID('Pelegram') IS NOT NULL
BEGIN
    DROP DATABASE Pelegram
END

CREATE DATABASE Pelegram
go
USE Pelegram

/**/

go

--  Пользователь Е1
CREATE TABLE Users(
ID INT NOT NULL PRIMARY KEY IDENTITY(1,1),									--ID 
Nickname VARCHAR(100) NOT NULL UNIQUE,							--Никнейм
PhoneNumber CHAR(11) NOT NULL UNIQUE 
check (PhoneNumber like ('[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')),--'+7[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),			--Телефон ^7
Name VARCHAR(100) NOT NULL,										--Имя
Lastname VARCHAR(100) NOT NULL,									--Фамилия
Surname VARCHAR(100) NOT NULL,									--Отчество
LastSession DateTime Default Current_TimeStamp,					--Время последней сессии Date  --?TimeStamp
EncriptionKey VARCHAR(100) NOT NULL,							--Ключ шифрования
Deleted Bit default 0 NOT NULL									--Пользователь удален  или нет
);
--insert into Users values(1,' ','77777777777', ' ',' ',' ', Current_TimeStamp,'df',0);

-- Текстовое сообщение Е2
CREATE TABLE TextMessage(
ID int PRIMARY KEY IDENTITY(1,1),												--ID
IDOwner int foreign key references Users(ID) NOT NULL,			--ID ОТправителя
Txt VARCHAR(250),										--Текст сообщения
TimeSending DateTime Default Current_TimeStamp,					--Время отправления
StatusSend bit NOT NULL,										--Статус отправки
TimeRecieving DateTime,												--Время доставки
StatusRecieving bit NOT NULL,											--Статус доставки
TimeReading DateTime,												--Время прочтения
StatusReading bit NOT NULL,												--Статус прочтения
Deleted bit NOT NULL,											--Сообщение удалено или нет
FirstAttachment int)											--Номер первого вложения

-- Звонов Е3 
CREATE TABLE Ring(								
ID int PRIMARY KEY IDENTITY(1,1),												--ID
IDInner int foreign key references Users(ID) NOT NULL,			--ID исходящего абонента
IDOuter int foreign key references Users(ID) NOT NULL,			--ID входящего абонента
TimeStart DateTime Default Current_TimeStamp NOT NULL,			--Время начала звонка
TimeEnd DateTime,												--Время окончания звонка
Talktime int default 0)											--Разговорное время

-- Контактная книга Е4 
CREATE TABLE ContactBook(											
IDOwner int FOREIGN KEY REFERENCES Users(ID) NOT NULL,			--ID владельца книги
IDContact int FOREIGN KEY REFERENCES Users(ID) NOT NULL,		--ID контакта
BlacklistStatus BIT default 0 NOT NULL,							--Статус в чёрном списке
Constraint IDBook Primary key (IDOwner, IDContact))

-- Конференция Е5 
CREATE TABLE Conference(										
ID INT PRIMARY KEY IDENTITY(1,1),												--ID 
IDAdmin INT Foreign key references Users(ID) NOT NULL,			--ID создателя конференции
DateCreate DateTime Default Current_TimeStamp)					--Дата создания

-- Диалог Е6 
CREATE TABLE Dialog(	
ID int PRIMARY KEY IDENTITY(1,1),												--ID диалога
IDFirst int foreign key references Users(ID) NOT NULL,			--ID первого участника
IDSecond int foreign key references Users(ID) NOT NULL,			--ID второго участника
TimeCreate DateTime Default Current_TimeStamp,					--Время создания
LastMessage int,												--Номер последнего сообщения
LastAttachment int)												--Номер последнего вложения

-- Настройка Е7  
CREATE TABLE Settings(
ID INT PRIMARY KEY IDENTITY(1,1),												--
Setting VARCHAR(100) UNIQUE NOT NULL)							--Настройка

-- Вложение Е8 
create table Attachment (
ID int PRIMARY KEY IDENTITY(1,1),
IDMessage int foreign key references TextMessage(ID),			--ID сообщения
IDNext int foreign key references Attachment(ID),				--ID следующего вложения
NameFile VARCHAR(100) NOT NULL,									--Имя файла
Tip VARCHAR(100) NOT NULL,										--Тип файла
Extension VARCHAR(10) NOT NULL,									--Расширение
Size int NOT NULL check (Size >= 0)	)							--Размер

-- Товариц майор Е9
CREATE TABLE ComradeMajor(
ID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
Name VARCHAR(100) NOT NULL,										--Имя
Lastname VARCHAR(100) NOT NULL,									--Фамилия
Surname VARCHAR(100))											--Отчество

-- График Е10  
Create table Timetable(
ID int NOT NULL IDENTITY(1,1),
IDMajor int foreign key references ComradeMajor(ID) NOT NULL,	--ID майора
WorkDay Date Not null,											--Рабочий день   [дд-ММ-гггг]
TimeStart Time NOT NULL,												--Время начала работы
TimeEnd Time NOT NULL,													--Время окончания работы
Constraint TimeTableID primary key clustered (ID, IDMajor)
)													

-- Стоп слова Е11
CREATE TABLE StopWords(
ID INT NOT NULL PRIMARY KEY IDENTITY(1,1),						--
Word VARCHAR(100) NOT NULL,										--Слово
Priority INT default 1 NOT NULL,								--Приоритет важности
Active BIT default 1 NOT NULL)									--Активно в поиске или нет

--Словарь Е12
create table Dictionary(
--ID int primary key,				
IDWord int NOT NULL ,												--ID Слова
IDMajor int NOT NULL ,												--ID Майора
Constraint IDDictionary PRIMARY KEY CLUSTERED  (IDWord, IDMajor),
FOREIGN KEY (IDWord) references StopWords(ID) ,	
FOREIGN KEY (IDMajor) references ComradeMajor(ID)
)

-- Совпадения Е13
Create table Coincedence (
--ID int primary key,
IDMessage int foreign key references TextMessage(ID) NOT NULL,		--ID сообщения
IDWord int  NOT NULL,												--ID в слова
IDMajor int NOT NULL,												--ID майора
CountInMessage int default 1 NOT NULL ,								--Количество в данном сообщении
Constraint IDCoincedence PRIMARY KEY CLUSTERED (IDMessage, IDWord, IDMajor), --PRIMARY KEY CLUSTERED
foreign key (IDWord, IDMajor) references Dictionary(IDWord,IDMajor),
)

-- Упоминания Е14 
create table Mentions(
--ID int primary key,
IDRing int foreign key references Ring(ID)NOT NULL,				
IDWord int  NOT NULL,	
IDMajor int  NOT NULL,
TimeWithStartRing int default 0	NOT NULL								--Количество секунд с начала звонка
Constraint IDMention PRIMARY KEY CLUSTERED (IDRing, IDWord, IDMajor), --PRIMARY KEY CLUSTERED
foreign key (IDWord, IDMajor) references Dictionary(IDWord,IDMajor),
)

--  Сообщения диалога Е15  
Create table MessagesDialog(
-------ID int primary key,
IDDialog int foreign key references Dialog(ID) NOT NULL,
IDMessage int foreign key references TextMessage(ID) NOT NULL,
Constraint IDDialogMessage Primary key (IDDialog, IDMessage)
)

-- Список участников Е16 
create table ListUsers(
--ID int primary key,
IDConference int foreign key references Conference(ID) NOT NULL,
IDUser int foreign key references Users(ID) NOT NULL,
PermissionChat bit default 1 NOT NULL,									--Разрешение на отправку сообщений
PermissionAttachment bit default 1 NOT NULL,							--Разрешение на отправку вложений
DateInclusionOrExclusion Date NOT NULL,									--Дата включения или исключения
UserExclude bit default 0 NOT NULL,										--Участник удалён или нет
Constraint ConfUserID Primary key (IDConference, IDUser)
)

-- Сообщения конференции Е17 
Create table MessagesConference(
--ID int primary key,
IDConference int foreign key references Conference(ID) NOT NULL,
IDTextMessage int foreign key references TExtMessage(ID) NOT NULL,
Constraint ConfMessageID primary key (IDConference, IDTextMessage)
)

-- Разрешения Е18 
Create table Preferences(
--ID int primary key,
IDUser int foreign key references Users(ID) NOT NULL,			--Пользователь
IDSetting int foreign key references Settings(ID) NOT NULL,		--Настройка
Allowed bit	NOT NULL default 0,											--Разрешено или нет
Constraint PreferUserID primary key (IDUser, IDSetting)
)

/* Словарь майора Е12 OLD
create table Dictionary(
--ID int primary key,				
IDWord int NOT NULL ,						--ID Слова
IDMajor int NOT NULL,						--ID Майора
	
FOREIGN KEY (IDWord) references StopWords(ID) ,	
FOREIGN KEY (IDMajor) references ComradeMajor(ID),
--UNIQUE (IDWord, IDMajor),
constraint DictionaryPK primary key (IDWord, IDMajor)
)*/