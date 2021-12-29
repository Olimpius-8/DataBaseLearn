select IDOwner, 
sum(Coincedence.CountInMessage)as sumcoincedence
from Coincedence 
join TextMessage on TextMessage.ID = Coincedence.IDMessage
group by IDOwner

select  iDOwner, count(distinct ID)
from 
TextMessage
group by IDOwner

select * from Dialog
 where Dialog.IDFirst = 3
OR Dialog.IDSecond = 3
------на удаление отключить триггер временно и обновить ID
declare @maxid int = (select max(ID) from Attachment)
dbcc checkident('Attachment',reseed,@maxid)
alter table TextMessage enable trigger MessageDelete 
select * from  textMessage
---------
select Dialog.ID as IDDialog, Dialog.IDFirst, Dialog.IDSecond,MessagesDialog.IDMessage from MessagesDialog
join Dialog  on Dialog.ID = MessagesDialog.IDDialog

select Conference.ID, MessagesConference.IDTextMessage from MessagesConference
join Conference  on Conference.ID = MessagesConference.IDConference

exec printMajorsDictionary
exec printContactBook
exec printCurrentMajorDictionary

select IDOwner, count(distinct MessagesDialog.IDDialog) as countMD from TextMessage
join MessagesDialog on MessagesDialog.IDMessage = TextMessage.ID
join Coincedence on MessagesDialog.IDMessage = Coincedence.IDMessage
group by IDOwner

select * from Timetable

select * from MessagesDialog
select * from Dialog
select * from Coincedence

exec printContactBook

declare @id int =35
select ID,IDFirst, IDSecond from Dialog
where IDFirst = @id OR IDSecond = @id

--declare @id int = 38
select IDOwner, IDContact, CASE  
WHEN BlacklistStatus = 0 then ''
else 'Заблокирован'
end as BlacklistStatus
from ContactBook
where IDOwner = @id OR IDContact = @id

select * from Users
select * from Ring
select * from Coincedence

select  * from (
	select row_number() over (partition by /*UserID,*/  monthstat order by counts desc ) as rang, monthstat, UserID , counts
	from (select distinct Users.ID as UserID, month(TimeSending) as monthstat ,count(TextMessage.ID)as counts 
			from Users
			join TextMessage on Users.ID = TextMessage.IDOwner
			group by Users.ID, TimeSending 
	) as Temp
) as Result where rang = 1
-----
order by  monthstat,rang , UserID 
go
/* 12 месяцев и топ пользователь по каждому*/
(select TOP (12) UserID, monthdate from    
				(select row_number() over (partition by /*UserID,*/  monthdate order by counts desc ) as rang, monthdate, UserID , counts
					from (
						select distinct Users.ID as UserID, 
						case	when month(TimeSending) >= 10 then concat(year(TimeSending),'.',month(TimeSending)) 
						else concat(year(TimeSending),'.0',month(TimeSending)) end as  monthdate ,
						count(TextMessage.ID) as counts 
						from Users
						join TextMessage on Users.ID = TextMessage.IDOwner
						group by Users.ID, TimeSending 
					) as Temp
				) as Result where rang = 1 
			) as TopUser


			--=====================
select distinct case	when month(TimeSending) >= 10 then concat(year(TimeSending),'.',month(TimeSending)) 
							else concat(year(TimeSending),'.0',month(TimeSending)) end as monthstat,
				-----------------------
					count(CountInMessage) as CIM,
					sum(Ring.Talktime) as TT
						--UserID as ActiveUser
						------------------------
					from Ring, Coincedence
				--------------------------
					join TextMessage on Coincedence.IDMessage = TextMessage.ID
					where (TextMessage.TimeSending >= GETDATE() - 365-DAY(GETDATE())) AND (TextMessage.TimeSending <= GETDATE()-DAY(GETDATE()))
					group by TextMessage.TimeSending

/*
DECLARE @Data TABLE (
  ID INTEGER PRIMARY KEY
  , ParentID INTEGER
  , Text VARCHAR(32)
  , Price INTEGER
)

INSERT INTO @Data
  SELECT 1, Null, 'Root', NULL
  UNION ALL SELECT 2, 1, 'Flowers', NULL
  UNION ALL SELECT 3, 1, 'Electro', NULL
  UNION ALL SELECT 4, 2, 'Rose', 10
  UNION ALL SELECT 5, 2, 'Violet', 5
  UNION ALL SELECT 6, 4, 'Red Rose', 12
  UNION ALL SELECT 7, 3, 'Television', 100
  UNION ALL SELECT 8, 3, 'Radio', 70
  UNION ALL SELECT 9, 8, 'Webradio', 90;
--select RootID = ID, ID from @Data

with ChildrenCTE as (
	select RootID = ID, ID
	from @Data
	union all
	select cte.rootID, d.ID
	from ChildrenCTE cte
		inner join @Data d on d.parentID = cte.ID
)
select d.ID, d.ParentID, d.Text, d.Price, cnt.Children
from @Data d
        INNER JOIN (
          SELECT  ID = RootID, Children = COUNT(*) - 1
          FROM    ChildrenCTE
          GROUP BY RootID
        ) cnt ON cnt.ID = d.ID
go--=========================================*/
go
with AttachmentCTE as (
	select RootID = ID, IDnext
	from Attachment
	union all
	select cte.rootID, d.IDnext
	from AttachmentCTE cte
		inner join Attachment d on d.ID = cte.IDNext
)

select d.IDMessage, cnt.Children as Attachments
from Attachment d 
	inner join (
		select ID = RootID, Children = Count(*)		--Count(*)-1 - количество дочерних вложений по отношению к первому
		from AttachmentCTE
		group by RootID
		)cnt on cnt.ID = d.ID
where d.IDMessage is not null
------------------

select IDOwner,
(select Users.name +' ' 
+ Users.Lastname 
+ (case when ((Users.Surname)is NULL) then '' else (concat(' ',Users.Surname))end)
+'; 'as 'data()' from ContactBook c2
join Users on Users.ID = c2.IDContact
where c2.IDOwner = c1.IDOwner for xml path('')
) as Contacts
from ContactBook c1
group by IDOwner

exec printCurrentMajorDictionary

select * from Coincedence
--1
insert into timetable values (
4,CURRENT_TIMESTAMP,'00:00','23:59')

insert into TextMessage values 
(23,' взорвать взорвать',CURRENT_TIMESTAMP,0,Null,0,NUll,0,0,NULL)

--2
select * from TextMessage
insert into Ring (IDInner, IDOuter, TimeStart,TimeEnd)values
--(3,5,'20211217 19:36','20211217 20:15')
(3,5,'20210217 20:36','20210217 20:48')

insert into TextMessage values 
(18,'взорвать взорвать устранить устранить устранить устранить устранить','20210317 19:36',0,Null,0,NUll,0,0,NULL)

set identity_insert  Attachment off
insert into Attachment(IDMessage,IDNext,NameFile,Tip,Extension,Size) values 
(210	,NULL		,'213','textfile','txt',20)



select distinct IDMessage from Coincedence
left join TextMessage on Coincedence.IDMessage = TextMessage.ID
where month(TextMessage.TimeSending)=10

select * from TextMessage
where IDOwner = 23

print ( GETDATE() - 365+1  )