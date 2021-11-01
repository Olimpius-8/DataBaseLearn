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

--  ������������ �1
CREATE TABLE Users(
ID INT NOT NULL PRIMARY KEY IDENTITY(1,1),									--ID 
Nickname VARCHAR(100) NOT NULL UNIQUE,							--�������
PhoneNumber CHAR(11) NOT NULL UNIQUE 
check (PhoneNumber like ('[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')),--'+7[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),			--������� ^7
Name VARCHAR(100) NOT NULL,										--���
Lastname VARCHAR(100) NOT NULL,									--�������
Surname VARCHAR(100) NOT NULL,									--��������
LastSession DateTime Default Current_TimeStamp,					--����� ��������� ������ Date  --?TimeStamp
EncriptionKey VARCHAR(100) NOT NULL,							--���� ����������
Deleted Bit default 0 NOT NULL									--������������ ������  ��� ���
);
--insert into Users values(1,' ','77777777777', ' ',' ',' ', Current_TimeStamp,'df',0);

-- ��������� ��������� �2
CREATE TABLE TextMessage(
ID int PRIMARY KEY IDENTITY(1,1),												--ID
IDOwner int foreign key references Users(ID) NOT NULL,			--ID �����������
Txt VARCHAR(250),										--����� ���������
TimeSending DateTime Default Current_TimeStamp,					--����� �����������
StatusSend bit NOT NULL,										--������ ��������
TimeRecieving DateTime,												--����� ��������
StatusRecieving bit NOT NULL,											--������ ��������
TimeReading DateTime,												--����� ���������
StatusReading bit NOT NULL,												--������ ���������
Deleted bit NOT NULL,											--��������� ������� ��� ���
FirstAttachment int)											--����� ������� ��������

-- ������ �3 
CREATE TABLE Ring(								
ID int PRIMARY KEY IDENTITY(1,1),												--ID
IDInner int foreign key references Users(ID) NOT NULL,			--ID ���������� ��������
IDOuter int foreign key references Users(ID) NOT NULL,			--ID ��������� ��������
TimeStart DateTime Default Current_TimeStamp NOT NULL,			--����� ������ ������
TimeEnd DateTime,												--����� ��������� ������
Talktime int default 0)											--����������� �����

-- ���������� ����� �4 
CREATE TABLE ContactBook(											
IDOwner int FOREIGN KEY REFERENCES Users(ID) NOT NULL,			--ID ��������� �����
IDContact int FOREIGN KEY REFERENCES Users(ID) NOT NULL,		--ID ��������
BlacklistStatus BIT default 0 NOT NULL,							--������ � ������ ������
Constraint IDBook Primary key (IDOwner, IDContact))

-- ����������� �5 
CREATE TABLE Conference(										
ID INT PRIMARY KEY IDENTITY(1,1),												--ID 
IDAdmin INT Foreign key references Users(ID) NOT NULL,			--ID ��������� �����������
DateCreate DateTime Default Current_TimeStamp)					--���� ��������

-- ������ �6 
CREATE TABLE Dialog(	
ID int PRIMARY KEY IDENTITY(1,1),												--ID �������
IDFirst int foreign key references Users(ID) NOT NULL,			--ID ������� ���������
IDSecond int foreign key references Users(ID) NOT NULL,			--ID ������� ���������
TimeCreate DateTime Default Current_TimeStamp,					--����� ��������
LastMessage int,												--����� ���������� ���������
LastAttachment int,												--����� ���������� ��������
UNIQUE (IDFirst, IDSecond)
)

-- ��������� �7  
CREATE TABLE Settings(
ID INT PRIMARY KEY IDENTITY(1,1),												--
Setting VARCHAR(100) UNIQUE NOT NULL)							--���������

-- �������� �8 
create table Attachment (
ID int PRIMARY KEY IDENTITY(1,1),
IDMessage int foreign key references TextMessage(ID),			--ID ���������
IDNext int foreign key references Attachment(ID),				--ID ���������� ��������
NameFile VARCHAR(100) NOT NULL,									--��� �����
Tip VARCHAR(100) NOT NULL,										--��� �����
Extension VARCHAR(10) NOT NULL,									--����������
Size int NOT NULL check (Size >= 0)	)							--������

-- ������� ����� �9
CREATE TABLE ComradeMajor(
ID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
Name VARCHAR(100) NOT NULL,										--���
Lastname VARCHAR(100) NOT NULL,									--�������
Surname VARCHAR(100))											--��������

-- ������ �10  
Create table Timetable(
ID int NOT NULL IDENTITY(1,1),
IDMajor int foreign key references ComradeMajor(ID) NOT NULL,	--ID ������
WorkDay Date Not null,											--������� ����   [��-��-����]
TimeStart Time NOT NULL,												--����� ������ ������
TimeEnd Time NOT NULL,													--����� ��������� ������
Constraint TimeTableID primary key clustered (ID, IDMajor)
)													

-- ���� ����� �11
CREATE TABLE StopWords(
ID INT NOT NULL PRIMARY KEY IDENTITY(1,1),						--
Word VARCHAR(100) NOT NULL,										--�����
Priority INT default 1 NOT NULL,								--��������� ��������
Active BIT default 1 NOT NULL)									--������� � ������ ��� ���

--������� �12
create table Dictionary(
--ID int primary key,				
IDWord int NOT NULL ,												--ID �����
IDMajor int NOT NULL ,												--ID ������
Constraint IDDictionary PRIMARY KEY CLUSTERED  (IDWord, IDMajor),
FOREIGN KEY (IDWord) references StopWords(ID) ,	
FOREIGN KEY (IDMajor) references ComradeMajor(ID)
)

-- ���������� �13
Create table Coincedence (
--ID int primary key,
IDMessage int foreign key references TextMessage(ID) NOT NULL,		--ID ���������
IDWord int  NOT NULL,												--ID � �����
IDMajor int NOT NULL,												--ID ������
CountInMessage int default 1 NOT NULL ,								--���������� � ������ ���������
Constraint IDCoincedence PRIMARY KEY CLUSTERED (IDMessage, IDWord, IDMajor), --PRIMARY KEY CLUSTERED
foreign key (IDWord, IDMajor) references Dictionary(IDWord,IDMajor),
)

-- ���������� �14 
create table Mentions(
--ID int primary key,
IDRing int foreign key references Ring(ID)NOT NULL,				
IDWord int  NOT NULL,	
IDMajor int  NOT NULL,
TimeWithStartRing int default 0	NOT NULL								--���������� ������ � ������ ������
Constraint IDMention PRIMARY KEY CLUSTERED (IDRing, IDWord, IDMajor), --PRIMARY KEY CLUSTERED
foreign key (IDWord, IDMajor) references Dictionary(IDWord,IDMajor),
)

--  ��������� ������� �15  
Create table MessagesDialog(
-------ID int primary key,
IDDialog int foreign key references Dialog(ID) NOT NULL,
IDMessage int foreign key references TextMessage(ID) NOT NULL,
Constraint IDDialogMessage Primary key (IDDialog, IDMessage)
)

-- ������ ���������� �16 
create table ListUsers(
--ID int primary key,
IDConference int foreign key references Conference(ID) NOT NULL,
IDUser int foreign key references Users(ID) NOT NULL,
PermissionChat bit default 1 NOT NULL,									--���������� �� �������� ���������
PermissionAttachment bit default 1 NOT NULL,							--���������� �� �������� ��������
DateInclusionOrExclusion Date NOT NULL,									--���� ��������� ��� ����������
UserExclude bit default 0 NOT NULL,										--�������� ����� ��� ���
Constraint ConfUserID Primary key (IDConference, IDUser)
)

-- ��������� ����������� �17 
Create table MessagesConference(
--ID int primary key,
IDConference int foreign key references Conference(ID) NOT NULL,
IDTextMessage int foreign key references TExtMessage(ID) NOT NULL,
Constraint ConfMessageID primary key (IDConference, IDTextMessage)
)

-- ���������� �18 
Create table Preferences(
--ID int primary key,
IDUser int foreign key references Users(ID) NOT NULL,			--������������
IDSetting int foreign key references Settings(ID) NOT NULL,		--���������
Allowed bit	NOT NULL default 0,											--��������� ��� ���
Constraint PreferUserID primary key (IDUser, IDSetting)
)

/* ������� ������ �12 OLD
create table Dictionary(
--ID int primary key,				
IDWord int NOT NULL ,						--ID �����
IDMajor int NOT NULL,						--ID ������
	
FOREIGN KEY (IDWord) references StopWords(ID) ,	
FOREIGN KEY (IDMajor) references ComradeMajor(ID),
--UNIQUE (IDWord, IDMajor),
constraint DictionaryPK primary key (IDWord, IDMajor)
)*/