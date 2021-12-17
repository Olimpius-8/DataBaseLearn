use Pelegram
go

/*1
Для каждого пользователя: 
Телефон, Никнейм, кол-во сообщений, кол-во стоп-слов в сообщениях, ФИО майора, который чаще всего получал совпадений
*/
select Users.PhoneNumber, 
Users.Nickname, 
count(distinct TextMessage.ID) as CountMessages,
count(distinct MessagesDialog.IDDialog) as CountPersons,
Counters.counts as CountStopWords,    --sum(Coincedence.CountInMessage)
(ComradeMajor.Lastname + ' ' + ComradeMajor.Name + ' '+ComradeMajor.Surname) as Major
-------
from Users 
left join TextMessage		on TextMessage.IDOwner = Users.ID 
left join MessagesDialog		on MessagesDialog.IDMessage = TextMessage.ID
left join Coincedence		on Coincedence.IDMessage = TextMessage.ID
-------
left join (select * from (
select row_number() over (partition by IDOwner order by counts desc) as rang, IDOwner, IDMajor, counts 
	from (select IDOwner,IDMajor, sum(CountInMessage) as counts 
			from Coincedence
			join TextMessage on Coincedence.IDMessage = TextMessage.ID
			group by IDMajor, IDOwner) as Temp
	) as Result
where rang = 1) as Counters on Counters.IDOwner = Users.ID

left join ComradeMajor on ComradeMajor.ID = Counters.IDMajor
group by PhoneNumber, Nickname, 
ComradeMajor.Name,ComradeMajor.Lastname,ComradeMajor.Surname,
Counters.counts

--test
/*
select * from (
select row_number() over (partition by IDOwner order by counts desc) as rang, IDOwner, IDMajor, counts 
from (select IDOwner,IDMajor, sum(CountInMessage) as counts 
			from Coincedence
			join TextMessage on Coincedence.IDMessage = TextMessage.ID
			group by IDMajor, IDOwner) as Temp
) as Result
where rang = 1 
--


with name_1 as (
select * from (
select row_number() over (partition by IDOwner order by counts desc) as rang, IDOwner, IDMajor, counts 
from Counters
) as Result
where rang = 1 )
select * from name_1*/
go
/*2
	По вертикали: 12 месяцев от текущего назад на год
	По горизонтали:    	
* Кол-во найденных случаев всеми майорами за месяц (случаев - не количество слов по сообщениям)
* Суммарная длина звонков
* Топ пользователь чата
*/
select * from (
  select * from 
  (
	--======================================
	select Layer1.monthstat as monthstat, CIM, TT, UserID from (	
	--111
		select monthstat,count (CIM) as CIM from --, UserID 	from 
			(select monthstat, count (CIM) as CIM from 
				(select 
				--format month--------------
					distinct 
					case	when month(TimeSending) >= 10 then concat(year(TimeSending),'.',month(TimeSending)) 
							else concat(year(TimeSending),'.0',month(TimeSending)) end as monthstat,
						count(CountInMessage) as CIM
						from  Coincedence
					left join TextMessage on Coincedence.IDMessage = TextMessage.ID
					where (TextMessage.TimeSending >= GETDATE() - 365) AND (TextMessage.TimeSending <= GETDATE())
					group by TextMessage.TimeSending
				)as Temp1
			group by monthstat 
			)as Result1
			group by monthstat
		) as Layer1
		--11111
		full join (
		--22222
		select * from (
			select distinct monthring as monthstat, sum(TT) as TT from (
				select case when month(Ring.TimeStart) >= 10 then concat(year(Ring.TimeStart),'.',month(Ring.TimeStart)) 
						else concat(year(Ring.TimeStart),'.0',month(Ring.TimeStart)) end as monthring,
						sum(Ring.Talktime) as TT
				from Ring
				group by Ring.TimeStart
				) as Prepare2
			group by monthring
			) as Result2
		)as Layer2
		----22222	
		on Layer1.monthstat = Layer2.monthstat
		full join (select TOP (12) UserID, monthdate from    
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
		on TopUser.monthdate = Layer1.monthstat
		--group by monthstat,UserID
		--order by monthstat
	--==========================================
	) as Total
	unpivot ( dd for DataForMonth in (CIM,TT, UserID)) as unpvt
) UnpivotTable
pivot 
(--[concat(YEAR(GETDATE()),'.', MONTH(GETDATE())-8)] не робит,
	avg(dd) for monthstat in (
	[2021.01],
	[2021.02],
	[2021.03],
	[2021.04],
	[2021.05],
	[2021.06],
	[2021.07],
	[2021.08],
	[2021.09],
	[2021.10],
	[2021.11],
	[2021.12])
) pvt

--print concat(YEAR(GETDATE()),'.', MONTH(GETDATE()))
go
/*3
По вертикали: 4 квартала
        По горизонтали: 
    * Средняя длина сообщения в квартале
    * Кол-во засветившихся пользователей
    * Кол-во вложений за квартал
	*/
-----------
	/*--CountAttachments   - подсчёт количества вложений в сообщении
create view CountAttachments
as 
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
go
*/

--------------

select * from (
	select * from (
		select Layer.QuarterYear, 
		count(IDU) as 'Количество пользователей', 
		sum(Layer.avglen) as 'Средняя длина сообщения',
		sum(Layer.Attachments) as 'Количество вложений' 
		from 
		(		--Пользователи по кварталу
				select QuarterYear,IDU, 0 as avglen, 0 as Attachments from (
					select datepart(quarter, TimeSending) as QuarterYear,
					Users.ID as IDU
					--,0 as statlen
					from TextMessage 
					join Users on Users.ID = TextMessage.IDOwner
					join Coincedence on Coincedence.IDMessage = TextMessage.ID
					group by DATEPART(quarter, TextMessage.TimeSending), Users.ID
				)AS TEMP1
				group by QuarterYear, idu
			union		-- JOIN
			--Средняя длина сообщения и вложения
				select QuarterYear,NULL as IDU, AVG(statlen) as avglen, sum(Attachments) as Attachments from (
					select datepart(quarter, TimeSending) as QuarterYear, 
					LEN(TextMessage.Txt) as statlen,
					Attachments			
					from TextMessage
					left join CountAttachments on TextMessage.ID = CountAttachments.IDMessage
					group by DATEPART(quarter, TextMessage.TimeSending), TextMessage.txt, Attachments
				)as Temp2
				group by QuarterYear
		)as Layer
		group by Layer.QuarterYear
	) as Total
	unpivot ( dd for DataForQuarter in (Total.[Количество пользователей],Total.[Средняя длина сообщения], Total.[Количество вложений])) as unpvt
) UnpivotTable
pivot 
(
	avg(dd) for QuarterYear in (
	[1],
	[2],
	[3],
	[4])
) as pvt

go
/*4
Для каждого майора: 
ФИО, ID, 
Кол-во найденных слов, Ранг по количеству найденных слов	
*/
select  ID, FIO  as 'ФИО', counts as 'Количество найденных слов', ROW_NUMBER() over (order by counts desc) as 'Ранг'
from (
select ComradeMajor.ID, Name+' '+Lastname+' '+Surname as FIO, sum(Coincedence.CountInMessage) as counts
from ComradeMajor
join Coincedence on Coincedence.IDMajor = ComradeMajor.ID
join TextMessage on TextMessage.ID = Coincedence.IDMessage
group by ComradeMajor.ID,Name+' '+Lastname+' '+Surname
) as Temp
order by ID

go
/*5
Для засветившихся пользователей (топ 30) вывести  кол-во засветов и одним атрибутом список контактов (ФИО, ... ФИО)
*/
select top 30  users.ID, 
count(Coincedence.CountInMessage) as 'Количество засветов',
Contacts.ListContact as 'Контакты'
from Users
join TextMessage on TextMessage.IDOwner = Users.ID
join Coincedence on Coincedence.IDMessage = TextMessage.ID
join (select IDOwner,
(select Users.name +' ' 
+ Users.Lastname 
+ (case when ((Users.Surname)is NULL) then '' else (concat(' ',Users.Surname))end)
+'; 'as 'data()' from ContactBook c2
join Users on Users.ID = c2.IDContact
where c2.IDOwner = c1.IDOwner for xml path('')
) as ListContact
from ContactBook c1
group by IDOwner
) as Contacts 
on Contacts.IDOwner = Users.ID
group by users.ID, ListContact
order by users.ID, 'Количество засветов' desc