--Check daily Tweet count
select
Telco
,convert(date,created) as Date
,count(text) as Tweet
from TestDB.dbo.Tweet_Data
where Telco =   'FreedomMobile' --'Rogers' --'FreedomMobile' --'Bell'and convert(date,created) >='2018-07-01'
group by Telco
,convert(date,created) 
--having count(text) > 100
order by Telco,Tweet desc,date desc

--update TestDB.dbo.Tweet_Data set Telco = REPLACE(Telco, CHAR(13), '')

--Export Tweet
select * 
from TestDB.dbo.Tweet_Data 
where Telco =   'Telus' --'Rogers' --'FreedomMobile' --'Bell'
and convert(date,created) >='2019-06-15'
order by created


select * 
from TestDB.dbo.Tweet_Data 
where Telco =   'Rogers' --'Rogers' --'FreedomMobile' --'Bell'
and convert(date,created) in ('2019-06-27','2019-06-10','2019-06-14','2019-07-03','2019-07-12','2019-07-17','2019-06-09','2019-06-29','2019-05-31')
order by created

select * 
from TestDB.dbo.Tweet_Data 
where Telco =   'Bell' --'Rogers' --'FreedomMobile' --'Bell'
and convert(date,created) in ('2019-06-10','2019-06-06','2019-07-16','2019-07-12','2019-07-17','2019-07-08','2019-06-15','2019-07-17')
order by created

select * 
from TestDB.dbo.Tweet_Data 
where Telco =   'FreedomMobile' --'Rogers' --'FreedomMobile' --'Bell'
and convert(date,created) >='2019-01-15'
order by created


select * from TestDB.dbo.Tweet_Data 
where replyToSID ='525308826082611200'
and SID ='532313880156848128'

select
Telco
,count(text) as Tweet
from TestDB.dbo.Tweet_Data
where --Telco = 'Bell' andconvert(date,created) >='2019-07-01'
group by Telco
order by Telco,Tweet desc

/*

delete from TestDB.dbo.Tweet_Data 
where Text in (
	select 
	Text	
	--,count(Text) as Total
	from TestDB.dbo.Tweet_Data 
	group by Text
	having count(Text) > 1
	--order by Total desc
)

*/

select 
Text
--,max(created) as DateTime
,count(Text) as Total
from TestDB.dbo.Tweet_Data 
group by Text
having count(Text) > 1
order by Total desc
