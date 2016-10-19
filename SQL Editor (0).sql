
select * from qc_progress
create table QCCheckProject(
 id int not null,
 name nvarchar(50) not null
)
insert into  qc_worker_detail  ( parent_id , hourPeriod, worker_amount,get_workers,get_workers_group,borrow_workers,borrow_workers_group )
  values(23,0,0,'null',
0,'null')
delete from QCCheckProject
select * from  qc_permission

select  * from qc_role
delete from qc_worker_detail where id not in( select  max(id) from qc_worker_detail  group by hourPeriod)

select ID,11,11,[B(Number1)],[B(Number2)]
from
(select ID,Item1+'('+c+')' 'c',v
 from
 (select ID,Item1,sum(Number1) 'Number1',sum(Number2) 'Number2'
  from ch
  group by ID,Item1) a
 unpivot(v for c in(11,22)) u) b
pivot(max(v) for c in(11,22,33,44)) p
select sum(case when QCCheckProjectID='P01' THEN 1 ELSE 0 END) as goodNum,
sum(case when QCCheckProjectID='P01' THEN 0 ELSE 1 END)as  badNum from QCCheckRecord  
where 1=1  and parent_id='18'

delete from product_main where productdate='2016-06-02'
delete from QCCheckRecord where convert(varchar,insertDate,23)='2016-06-02'

select * from product_main
select * from QCCheckRecord where parent_id = 21
select * from  product_main  where 1=1 and id like '%004%'
SELECT year as 年份, Q1 as 一季度, Q2 as 二季度, Q3 as 三季度, Q4 as 四季度 
FROM SalesByQuarter PIVOT (SUM (amount) FOR quarter IN (Q1, Q2, Q3, Q4) ) AS P 
PIVOT (SUM (hello) FOR quarter IN (Q1, Q2, Q3, Q4) ) AS b  ORDER BY YEAR DESC
delete from qc_worker_detail where parent_id='46'
order by id asc

'1' ,'2' ,three,four,five ,six ,seven ,eigth,nine,ten,elevent
select '1','2','3','4','5','6','7','8','9','10','11'
from qc_worker_detail PIVOT(sum(worker_amount) for hourPeriod in (1,'2','3','4','5','6','7','8','9','10','11'))as a  
  
        SELECT year as 年份
        , sum (case when quarter = 'Q1' then amount else 0 end) 一季度
        , sum (case when quarter = 'Q2' then amount else 0 end) 二季度
        , sum (case when quarter = 'Q3' then amount else 0 end) 三季度
        , sum (case when quarter = 'Q4' then amount else 0 end) 四季度
    FROM SalesByQuarter GROUP BY year ORDER BY year DESC
select   sum(case when  hourPeriod=1 then worker_amount else  0 end ) as '1'
		,sum(case when  hourPeriod=2 then worker_amount else  0 end ) as '2'
		,sum(case when  hourPeriod=8 then worker_amount else  0 end ) as '8'
		,sum(case when  hourPeriod=4 then worker_amount else  0 end  )as '4'
		from qc_worker_detail  where parent_id=29 group by hourPeriod \
		
		select *  from qc_worker_detail  where parent_id=29 
select hourPeriod  ,get_workers_group,get_Workers,borrow_workers,borrow_workers_group from qc_worker_detail
select * from qc_worker_detail
delete from qcuser where id='5160005'
select * from qcuser  set groupid='A组' where name='a1'
insert into qcuser(id,name,password,groupid) values('5160008','a1','a1','A组')
insert into qcuser(id,name,password,groupid) values('5160009','b1','b1','B组')
insert into qcuser(id,name,password,groupid) values('5160010','c1','c1','C组')
insert into qcuser(id,name,password,groupid) values('5160011','d1','d1','D组')
insert into qcuser(id,name,password,groupid) values('5160012','e1','e1','E组')
insert into qcuser(id,name,password,groupid) values('5160011','f1','f1','F组')
insert into qcuser(id,name,password,groupid) values('5160012','g1','g1','G组')
insert into qcuser(id,name,password,groupid) values('5160012','h1','h1','H组')
 alter table qcuser add constraint qcuserPK01 primary key(id)
select * from product_main
ALTER TABLE 表名 RENAME COLUMN 当前列名 TO 新列名
alter table qcuser   rename  column   name  to username
select u.username, u.password, u.id u_id,l.id l_id,l.name l_name
		from QCUser u 
		left join level l on u.level=l.id 
select * from product_main
exec sp_rename 'qcuser.username','name','column';
 Alter table QCCheckRecord drop column barcodeimg
alter table QCCheckRecord add   barcodeimg nvarchar(30)
create table QCGRoup(
 id int not null,
 name nvarchar(50) not null
)
select url from levelToQcFun a left join QCfun b on  a.funid=b.id where levelid='1'

select * from qcfun

create table  level(
id int not null,
 name nvarchar(20) not null
)
select * from level
insert into level values(001,'管理员',1)
insert into level values(001,'管理员',2)
insert into level values(001,'管理员',3)
insert into level values(001,'管理员',4)
insert into level values(002,'普通用户',3)
insert into level values(002,'普通用户',4)
insert into level(id,name,permissionID) values(001,'管理员','002')
insert into level(id,name,permissionID) values(002,'普通用户','001')

update qcuser set level=1 where id='5160004'

select a.*,b.* from qcuser a,level b where a.level=b.id

create table  QCfun(
id int not null,
name  nvarchar(20),
fatherid int ,
url nvarchar(50)
select url from levelToQcFun a left join QCfun b on  a.funid=b.id where levelid=2
)
select * from qc_permission

select * from qcuser

select * from  qc_role
select * from user_role


select r.name r_name,r.id r_id,p.id p_id,p.name p_name ,fatherid,url
		from qc_role r 
		left join qc_permission p   on r.permissionID=p.id 
		where r.id=1
insert into user_role (user_id,role_id) values('5160004',1)
create table user_role(
	"id" int identity not null,
	user_id nvarchar(10),
	role_id int 
)
select  * from  qccheckrecord  where parent_id=43
select  * from  product_main 



EXEC   sp_rename   'qcrole',   'qc_role'

exec sp_rename 'qcrole.funid','permissionID','column';
delete from qcfun
insert into QCfun(id,name,url) values(001,'Qc用户管理','/qc/QCUser.jsp')
insert into QCfun(id,name,url) values(002,'Qc不良项管理','/qc/QCProject.jsp')
insert into QCfun(id,name,url) values(003,'Qc检测记录','/qc/QCCheck.jsp')
insert into QCfun(id,name,url) values(004,'Qc报表管理','/qc/QCReport.jsp')
insert into levelToQcFun(id,levelid,funid,quanxian) values(001,001,001,'用户管理')
insert into levelToQcFun(id,levelid,funid,quanxian) values(002,001,002,'不良项目管理')
insert into levelToQcFun(id,levelid,funid,quanxian) values(003,001,003,'Qc检查记录')
insert into levelToQcFun(id,levelid,funid,quanxian) values(004,001,004,'报表管理')
insert into levelToQcFun(id,levelid,funid,quanxian) values(005,002,003,'Qc检测记录')
insert into levelToQcFun(id,levelid,funid,quanxian) values(006,002,004,'报表管理')

select * from levelToQcFun

update qcfun set name='报表管理'  where id=4 ='报表管理' and   levelid=2 and quanxian='Qc不良项管理'
Create table levelToQcFun(
id  int not null,
levelid int ,
funid int,
quanxian nvarchar(20)
)
update QCCheckProject set name='sb' where id='15'
select * from QCCheckProject
insert into QCGRoup(id,name) values(001,'A组')
insert into QCGRoup(id,name) values(002,'B组')
insert into QCGRoup(id,name) values(003,'C组')
insert into QCGRoup(id,name) values(004,'D组')
insert into QCGRoup(id,name) values(005,'E组')
insert into QCGRoup(id,name) values(006,'F组')
insert into QCGRoup(id,name) values(007,'G组')
insert into QCGRoup(id,name) values(008,'H组')
insert into QCGRoup(id,name) values(001,'A组')
insert into QCGRoup(id,name) values(002,'B组')
insert into QCGRoup(id,name) values(003,'C组')
insert into QCGRoup(id,name) values(004,'D组')

insert into qcuser(id,name,password,groupid,level) values('5160001','周晨雨','zhoucy','A组','1')
insert into qcuser(id,name,password,groupid,level) values('5160002','小东 ','xiaodong','A组','2')
insert into qcuser(id,name,password,groupid,level) values('5160006','admin ','admin','A组','1')
insert into qcuser(id,name,password,groupid,level) values('5160003','小南','xiaonan','A组','2')
insert into qcuser(id,name,password,groupid,level) values('5160004','小西','xiaoxi','A组','2')
insert into qcuser(id,name,password,groupid,level) values('5160005','小北','xiaobei','A组','2')
insert into qcuser(id,name,password,groupid,level) values('5160007','a1','a1','A组','2')

   Alter table QCCheckProject alter column id nvarchar(30) not null
   alter table QCCheckProject drop constraint QCCheckProjectPK
alter table QCCheckProject add constraint QCCheckProjectPK primary key(id)
drop table QCCheckProject
insert into QCCheckProject(id,name) values(001,'无电流')
insert into QCCheckProject(id,name) values(002,'良品')
insert into QCCheckProject(id,name) values(003,'功率高')
insert into QCCheckProject(id,name) values(004,'功率低')
insert into QCCheckProject(id,name) values(005,'开关接触不良')
insert into QCCheckProject(id,name) values(006,'按键弹性不良')
insert into QCCheckProject(id,name) values(007,'死机')
insert into QCCheckProject(id,name) values(008,'自动开机')
insert into QCCheckProject(id,name) values(009,'短路')

delete from QCCheckProject
insert into QCCheckProject(id,name) values(10,'絲印刮花')
insert into QCCheckProject(id,name) values(11,'漏打螺絲')
insert into QCCheckProject(id,name) values(12,'木咀松動')
insert into QCCheckProject(id,name) values(13,'支架變形')
insert into QCCheckProject(id,name) values(14,'用錯支架')
insert into QCCheckProject(id,name) values(15,'漏裝支架')
insert into QCCheckProject(id,name) values(16,'夾變形')
insert into QCCheckProject(id,name) values(17,'通刮花')
insert into QCCheckProject(id,name) values(18,'夾刮花')
insert into QCCheckProject(id,name) values(19,'手柄刮花')
insert into QCCheckProject(id,name) values(20,'木芯松動')
insert into QCCheckProject(id,name) values(21,'轉尾响/紧')
insert into QCCheckProject(id,name) values(22,'机内有杂物')
insert into QCCheckProject(id,name) values(23,'手柄离位')
insert into QCCheckProject(id,name) values(24,'电源线损伤')
insert into QCCheckProject(id,name) values(25,'漏装梳齿')
insert into QCCheckProject(id,name) values(26,'漏丝印')
insert into QCCheckProject(id,name) values(27,'漏装壁钉')
insert into QCCheckProject(id,name) values(28,'梳齿塑胶不全')
insert into QCCheckProject(id,name) values(29,'螺絲打花頭')
insert into QCCheckProject(id,name) values(30,'夾紙松脫')
insert into QCCheckProject(id,name) values(31,'夾有異響')
insert into QCCheckProject(id,name) values(32,'用錯旋鈕')
drop table QCCheckProject

insert into QCCheckProject(id,name) values('P01','良品')
insert into QCCheckProject(id,name) values('P02','無電流')
insert into QCCheckProject(id,name) values('P03','功率高')
insert into QCCheckProject(id,name) values('P04','功率低')
insert into QCCheckProject(id,name) values('P05','短路')
insert into QCCheckProject(id,name) values('P06','開關接觸不良')
insert into QCCheckProject(id,name) values('P07','轉尾接觸不良')
insert into QCCheckProject(id,name) values('P08','按鍵無NO或無OFF')
insert into QCCheckProject(id,name) values('P09','按鍵無彈性')
insert into QCCheckProject(id,name) values('P10','按鍵彈性不良')
insert into QCCheckProject(id,name) values('P11','有電流燈不亮')
insert into QCCheckProject(id,name) values('P12','無電流燈亮')
insert into QCCheckProject(id,name) values('P13','旋紐緊/刮線')
insert into QCCheckProject(id,name) values('P14','轉尾緊/有聲音')
insert into QCCheckProject(id,name) values('P15','燈暗/燈底')
insert into QCCheckProject(id,name) values('P16','未開機有電流')
insert into QCCheckProject(id,name) values('P17','旋鈕不對位/緊')
insert into QCCheckProject(id,name) values('P18','低檔無電流')
insert into QCCheckProject(id,name) values('P19','死機(IE)')
insert into QCCheckProject(id,name) values('P20','自動開機')
insert into QCCheckProject(id,name) values('P21','顯示不良')
insert into QCCheckProject(id,name) values('P22','振動接觸不良')
insert into QCCheckProject(id,name) values('P23','無負離子/負離子小於1.5')
insert into QCCheckProject(id,name) values('P24','負離子有异响/声音大')
insert into QCCheckProject(id,name) values('P25','蜂鸣器无声/小声')
insert into QCCheckProject(id,name) values('P26','“+”“-”档次不能调节')
insert into QCCheckProject(id,name) values('P27','有电流负离子灯不亮')

insert into QCCheckProject(id,name) values('H01','良品')
insert into QCCheckProject(id,name) values('H02','引線漏焊')
insert into QCCheckProject(id,name) values('H03','引線焊錯位')
insert into QCCheckProject(id,name) values('H04','引線損傷')
insert into QCCheckProject(id,name) values('H05','引線假焊')
insert into QCCheckProject(id,name) values('H06','引線松脫')
insert into QCCheckProject(id,name) values('H07','底板錫點短路')
insert into QCCheckProject(id,name) values('H08','飛線')
insert into QCCheckProject(id,name) values('H09','線耳松脫')
insert into QCCheckProject(id,name) values('H10','螺絲未打緊')
insert into QCCheckProject(id,name) values('H11','電位器裝不到位')
insert into QCCheckProject(id,name) values('H12','引線焊不到位')
insert into QCCheckProject(id,name) values('H13','漏裝纖維通')
insert into QCCheckProject(id,name) values('H14','發熱板裝配不良')
insert into QCCheckProject(id,name) values('H15','用錯零件')
insert into QCCheckProject(id,name) values('H16','電源線損傷')
insert into QCCheckProject(id,name) values('H17','漏裝彈簧')
insert into QCCheckProject(id,name) values('H18','零火線焊錯位')
insert into QCCheckProject(id,name) values('H19','機內有雜物')
insert into QCCheckProject(id,name) values('H20','漏打螺絲')
insert into QCCheckProject(id,name) values('H21','元件假焊')
insert into QCCheckProject(id,name) values('H22','漏裝熱縮通')
insert into QCCheckProject(id,name) values('H23','漏裝電阻')
insert into QCCheckProject(id,name) values('H24','漏裝電容')
insert into QCCheckProject(id,name) values('H25','開關裝反')

insert into QCCheckProject(id,name) values('P01','良品')
insert into QCCheckProject(id,name) values('P02','無電流')
insert into QCCheckProject(id,name) values('P03','功率高')
insert into QCCheckProject(id,name) values('P04','功率低')
insert into QCCheckProject(id,name) values('P05','短路')
insert into QCCheckProject(id,name) values('P06','開關接觸不良')
insert into QCCheckProject(id,name) values('P07','轉尾接觸不良')
insert into QCCheckProject(id,name) values('P08','按鍵無NO或無OFF')
insert into QCCheckProject(id,name) values('P09','按鍵無彈性')
insert into QCCheckProject(id,name) values('P10','按鍵彈性不良')
insert into QCCheckProject(id,name) values('P11','有電流燈不亮')
insert into QCCheckProject(id,name) values('P12','無電流燈亮')
insert into QCCheckProject(id,name) values('P13','旋紐緊/刮線')
insert into QCCheckProject(id,name) values('P14','轉尾緊/有聲音')
insert into QCCheckProject(id,name) values('P15','燈暗/燈底')
insert into QCCheckProject(id,name) values('P16','未開機有電流')
insert into QCCheckProject(id,name) values('P17','旋鈕不對位/緊')
insert into QCCheckProject(id,name) values('P18','低檔無電流')
insert into QCCheckProject(id,name) values('P19','死機(IE)')
insert into QCCheckProject(id,name) values('P20','自動開機')
insert into QCCheckProject(id,name) values('P21','顯示不良')
insert into QCCheckProject(id,name) values('P22','振動接觸不良')
insert into QCCheckProject(id,name) values('P23','無負離子/負離子小於1.5')
insert into QCCheckProject(id,name) values('P24','負離子有异响/声音大')
insert into QCCheckProject(id,name) values('P25','蜂鸣器无声/小声')
insert into QCCheckProject(id,name) values('P26','“+”“-”档次不能调节')
insert into QCCheckProject(id,name) values('P27','有电流负离子灯不亮')



delete from QCCheckProject where id in('30','26','27',28,29)
select * from QCCheckProject
select * from QCCheckRecord
select * from QCuser
select 0;
create table  QCCheckRecord(
QCCheckProjectID int ,--项目编号
PONO int,--pono
model nvarchar(30),--规格型号
groupid nvarchar(20),--组别
nowDate date,--当前日期
insertDate DATETIME,--插入日期
prodecttype int --成品 半成品
)
   Alter table QCCheckRecord alter column QCCheckProjectID nvarchar(30)
exec sp_rename 'QCCheckRecord.prodect_type','prodectType','column';
alter table QCCheckRecord rename column PO_NO to pono
select count(*) as abc from QCCheckRecord where QCCheckProjectID=2 group by QCCheckProjectID union all
select count(*) as abc  from QCCheckRecord 

insert into QCCheckRecord values(001,123,'附近的开发阶段','fdfd', '2016-04-06', '2016-04-06 23:13.33',0)
select * from QCCheckProject
alter table QCCheckProject alter column  barcodeimg nvarchar(100)

select * FROM QCCheckRecord   
WHERE CASE WHEN QCCheckProjectID=2 THEN 0 ELSE 1 END=1

select  QCCheckProjectID,case when DateDiff(mi,'2005-07-20','2005-7-25 22:56:32') from 
QCCheckRecord
 where  pono='11'
 and  groupid='11'
 and  model='11'
 and  prodectType='11'
 and  nowDate='2016-04-06'
 
 select datepart(minute,getdate()) 
 select a.*,b.* from QCCheckProject as  a left join 
(select pono,groupid,model,prodectType, QCCheckProjectID,nowDate,sum(case when DATEPART(hour, insertDate) =8 then 1 else 0 end) as '8-9'
,sum(case when DATEPART(hour, insertDate) =9   then 1 else 0 end) as '9-10'
,sum(case when DATEPART(hour, insertDate) =10   then 1 else 0 end) as '10-11'
,sum(case when DATEPART(hour, insertDate) =11  then 1 else 0 end) as '11-12'
,sum(case when DateDiff(ss,nowDAte,insertDate)>=48600 and  DateDiff(ss,nowDAte,insertDate) <52200  then 1 else 0 end) as '1.30-2.30'
,sum(case when DateDiff(ss,nowDAte,insertDate)>=52200 and  DateDiff(ss,nowDAte,insertDate) <55800 then 1 else 0 end) as '2.30-3.30'
,sum(case when DateDiff(ss,nowDAte,insertDate)>=55800 and  DateDiff(ss,nowDAte,insertDate) <59400 then 1 else 0 end) as '3.30-4.30'
,sum(case when DateDiff(ss,nowDAte,insertDate)>=59400 and  DateDiff(ss,nowDAte,insertDate) <63000 then 1 else 0 end) as '4.30-5.30'
,sum(case when DateDiff(ss,nowDAte,insertDate)>=66600 and  DateDiff(ss,nowDAte,insertDate) <70200 then 1 else 0 end) as '6.30-7.30'
,sum(case when DateDiff(ss,nowDAte,insertDate)>=70200 and  DateDiff(ss,nowDAte,insertDate) <73800 then 1 else 0 end) as '7.30-8.30'
,sum(case when DateDiff(ss,nowDAte,insertDate)>=73800 and  DateDiff(ss,nowDAte,insertDate) <77400 then 1 else 0 end) as '8.30-9.30'
 from   QCCheckRecord 
   where  pono='2001'
 and  groupid='B组'
 and  model='2001'
 and  prodectType='HB'
 and  nowDate='2016-04-21'
 group by QCCheckProjectID,nowDate ,pono,groupid,model,prodectType ) as b on a.id=b.QCCheckProjectID
   Alter table QCbadProduct add  prodectType nvarchar(10)
 create table tb(时间 datetime , 金额 int)  
insert into tb values('2007-1-1 10:00:23' ,          8 )  
insert into tb values('2007-1-1 10:01:24' ,          4 )  
insert into tb values('2007-1-1 10:05:00' ,          2 )    
insert into tb values('2007-1-1 10:06:12' ,          3 )  
insert into tb values('2007-1-1 10:08:00' ,          1 )  
insert into tb values('2007-1-1 10:12:11' ,          5 )  
go  

create table QCbadProduct (
productDate date,
pono nvarchar(20),
model  nvarchar(20),
sumWorker int,
targetProduct int,
standardProduct int,
groupid nvarchar(20),
failure_start_time int,
failure_end_time int,
failure_count_times int,
use_workers int,
use_sum_times int,
failure_reason nvarchar(50),
lead_person nvarchar(20),
solution nvarchar(50),
prodectType nvarchar(10))
select max(id) from  product_main
insert into QCbadProduct values(getDate(),'HS16-0739','S-9960 F',20,700,80,'A组',7,10,3,10,30,'','','')
insert into QCbadProduct values(getDate(),'HS16-0739','S-9960 F',20,700,80,'A组',14,16,2,10,20,'11','11','11')
insert into QCbadProduct values('2016-04-26','HS16-0739','S-9960 F',20,700,80,'A组',7,10,3,10,30,'33','33','33','H')
insert into QCbadProduct values('2016-04-26','HS16-0739','S-9960 F',20,700,80,'A组',7,10,3,10,30,'33','33','33','H')
insert into QCbadProduct values(getDate(),'HS16-0739','S-9960 F',20,700,80,'A组',7,10,3,10,30,'','','')


select a.*,b.* from QCCheckProject as  a left join
(select pono,groupid,model, (case when prodectType='P' then '成品' else '半成品' end ) prodectType ,QCCheckProjectID,productDate,sum(case when DATEPART(hour, insertDate) =8 then 1 else 0 end) as '8-9'
,sum(case when DATEPART(hour, insertDate) =9   then 1 else 0 end) as '9-10'
,sum(case when DATEPART(hour, insertDate) =10   then 1 else 0 end) as '10-11'
,sum(case when DATEPART(hour, insertDate) =11  then 1 else 0 end) as '11-12'
,sum(case when DateDiff(ss,productDate,insertDate)>=48600 and  DateDiff(ss,productDate,insertDate) <52200  then 1 else 0 end) as '1.30-2.30'
,sum(case when DateDiff(ss,productDate,insertDate)>=52200 and  DateDiff(ss,productDate,insertDate) <55800 then 1 else 0 end) as '2.30-3.30'
,sum(case when DateDiff(ss,productDate,insertDate)>=55800 and  DateDiff(ss,productDate,insertDate) <59400 then 1 else 0 end) as '3.30-4.30'
,sum(case when DateDiff(ss,productDate,insertDate)>=59400 and  DateDiff(ss,productDate,insertDate) <63000 then 1 else 0 end) as '4.30-5.30'
,sum(case when DateDiff(ss,productDate,insertDate)>=66600 and  DateDiff(ss,productDate,insertDate) <70200 then 1 else 0 end) as '6.30-7.30'
,sum(case when DateDiff(ss,productDate,insertDate)>=70200 and  DateDiff(ss,productDate,insertDate) <73800 then 1 else 0 end) as '7.30-8.30'
,sum(case when DateDiff(ss,productDate,insertDate)>=73800 and  DateDiff(ss,productDate,insertDate) <77400 then 1 else 0 end) as '8.30-9.30'
 from   QCCheckRecord left join product_main on product_main.id=parent_id
 where pono=$P{pono}
and  model=$P{model}
and  prodectType=$P{prodectType}
and  nowDate=$P{nowDate}
and  groupid=$P{groupid}
 group by QCCheckProjectID,productDate ,pono,groupid,model,prodectType
 ) as b on a.id=b.QCCheckProjectID
where a.id  like '%'+$P{prodectType}+'%'
order by a.id asc
select * from QCCheckRecord
delete from QCCheckRecord where id=1

select id,name, pono,groupid,model, (case when prodectType='P' then '成品' else '半成品' end ) prodectType ,QCCheckProjectID,nowDate,sum(case when DATEPART(hour, insertDate) =8 then 1 else 0 end) as '8-9'
,sum(case when DATEPART(hour, insertDate) =9   then 1 else 0 end) as '9-10'
,sum(case when DATEPART(hour, insertDate) =10   then 1 else 0 end) as '10-11'
,sum(case when DATEPART(hour, insertDate) =11  then 1 else 0 end) as '11-12'
,sum(case when DateDiff(ss,nowDAte,insertDate)>=48600 and  DateDiff(ss,nowDAte,insertDate) <52200  then 1 else 0 end) as '1.30-2.30'
,sum(case when DateDiff(ss,nowDAte,insertDate)>=52200 and  DateDiff(ss,nowDAte,insertDate) <55800 then 1 else 0 end) as '2.30-3.30'
,sum(case when DateDiff(ss,nowDAte,insertDate)>=55800 and  DateDiff(ss,nowDAte,insertDate) <59400 then 1 else 0 end) as '3.30-4.30'
,sum(case when DateDiff(ss,nowDAte,insertDate)>=59400 and  DateDiff(ss,nowDAte,insertDate) <63000 then 1 else 0 end) as '4.30-5.30'
,sum(case when DateDiff(ss,nowDAte,insertDate)>=66600 and  DateDiff(ss,nowDAte,insertDate) <70200 then 1 else 0 end) as '6.30-7.30'
,sum(case when DateDiff(ss,nowDAte,insertDate)>=70200 and  DateDiff(ss,nowDAte,insertDate) <73800 then 1 else 0 end) as '7.30-8.30'
,sum(case when DateDiff(ss,nowDAte,insertDate)>=73800 and  DateDiff(ss,nowDAte,insertDate) <77400 then 1 else 0 end) as '8.30-9.30'
 from   QCCheckRecord left join QCCheckProject  on id=QCCheckProjectID
    where  pono='HS16-0739'
 and  groupid='A组'
 and  model='S-9960 F'
 and  prodectType='H'
 and  nowDate='2016-04-26'
 
 group by QCCheckProjectID,nowDate ,pono,groupid,model,prodectType,id,name
 
 
select a.*,b.* from QCCheckProject as  a left join
(select pono,groupid,model, (case when prodectType='P' then '成品' else '半成品' end ) prodectType ,QCCheckProjectID,nowDate,sum(case when DATEPART(hour, insertDate) =8 then 1 else 0 end) as '8-9'
,sum(case when DATEPART(hour, insertDate) =9   then 1 else 0 end) as '9-10'
,sum(case when DATEPART(hour, insertDate) =10   then 1 else 0 end) as '10-11'
,sum(case when DATEPART(hour, insertDate) =11  then 1 else 0 end) as '11-12'
,sum(case when DateDiff(ss,nowDAte,insertDate)>=48600 and  DateDiff(ss,nowDAte,insertDate) <52200  then 1 else 0 end) as '1.30-2.30'
,sum(case when DateDiff(ss,nowDAte,insertDate)>=52200 and  DateDiff(ss,nowDAte,insertDate) <55800 then 1 else 0 end) as '2.30-3.30'
,sum(case when DateDiff(ss,nowDAte,insertDate)>=55800 and  DateDiff(ss,nowDAte,insertDate) <59400 then 1 else 0 end) as '3.30-4.30'
,sum(case when DateDiff(ss,nowDAte,insertDate)>=59400 and  DateDiff(ss,nowDAte,insertDate) <63000 then 1 else 0 end) as '4.30-5.30'
,sum(case when DateDiff(ss,nowDAte,insertDate)>=66600 and  DateDiff(ss,nowDAte,insertDate) <70200 then 1 else 0 end) as '6.30-7.30'
,sum(case when DateDiff(ss,nowDAte,insertDate)>=70200 and  DateDiff(ss,nowDAte,insertDate) <73800 then 1 else 0 end) as '7.30-8.30'
,sum(case when DateDiff(ss,nowDAte,insertDate)>=73800 and  DateDiff(ss,nowDAte,insertDate) <77400 then 1 else 0 end) as '8.30-9.30'
 from   QCCheckRecord

 group by QCCheckProjectID,nowDate ,pono,groupid,model,prodectType
 ) as b on a.id=b.QCCheckProjectID

order by a.id asc

select * from QCCheckRecord where 1=1 (case when pono is not null then (and pono='HS16-0739')   end)

select  pono,model,groupid,nowDate,prodectType from QCCheckRecord
group by pono,model,groupid,nowDate,prodectType

delete from QCCheckRecord
select  pono,model,groupid,nowDate,prodectType from QCCheckRecord
Where 1=1 and  ($P{pono}=''or (pono=$P{pono}) and
($P{model} is null) or (model=$P{model}) and
($P{nowDate} is null) or (nowDate=$P{nowDate}) and
($P{prodectType} is null) or (prodectType=$P{prodectType}) and
($P{groupid} is null) or (groupid=$P{groupid})

group by pono,model,groupid,nowDate,prodectType


select  pono,model,groupid,nowDate,prodectType from QCCheckRecord
Where 1=1 and  ($P{pono}=''or pono=$P{pono}) and
($P{model}='' or model=$P{model}) and
($P{nowDate}='' or nowDate=$P{nowDate}) and
($P{prodectType='' or prodectType=$P{prodectType}) and
($P{groupid}='' or groupid=$P{groupid})

group by pono,model,groupid,nowDate,prodectType

select * from usertable where 1=1 and (name=@name or @name='') and (page=@page and @page='')


select id,productDate,pono
,model 
,groupid 
,case when prodectType='P' then '成品' when prodectType='H' then '半成品' end prodectType  
,sumWorker 
,targetProduct 
,standardProduct 
 from  product_main 
where 1=1and groupid='B组'
and prodectType like '%P%'
and productDate ='2016-05-25' 

select a.*,b.* from QCCheckProject as  a left join
(select pono,groupid,model, (case when  prodectType='S' then '直发器检查' when prodectType='C' then '卷发器检查'   end ) prodectType ,QCCheckProjectID,productDate,sum(case when DATEPART(hour, insertDate) =8 then 1 else 0 end) as '8-9'
,sum(case when DATEPART(hour, insertDate) =9   then 1 else 0 end) as '9-10'
,sum(case when DATEPART(hour, insertDate) =10   then 1 else 0 end) as '10-11'
,sum(case when DATEPART(hour, insertDate) =11  then 1 else 0 end) as '11-12'
,sum(case when DateDiff(ss,productDate,insertDate)>=48600 and  DateDiff(ss,productDate,insertDate) <52200  then 1 else 0 end) as '1.30-2.30'
,sum(case when DateDiff(ss,productDate,insertDate)>=52200 and  DateDiff(ss,productDate,insertDate) <55800 then 1 else 0 end) as '2.30-3.30'
,sum(case when DateDiff(ss,productDate,insertDate)>=55800 and  DateDiff(ss,productDate,insertDate) <59400 then 1 else 0 end) as '3.30-4.30'
,sum(case when DateDiff(ss,productDate,insertDate)>=59400 and  DateDiff(ss,productDate,insertDate) <63000 then 1 else 0 end) as '4.30-5.30'
,sum(case when DateDiff(ss,productDate,insertDate)>=66600 and  DateDiff(ss,productDate,insertDate) <70200 then 1 else 0 end) as '6.30-7.30'
,sum(case when DateDiff(ss,productDate,insertDate)>=70200 and  DateDiff(ss,productDate,insertDate) <73800 then 1 else 0 end) as '7.30-8.30'
,sum(case when DateDiff(ss,productDate,insertDate)>=73800 and  DateDiff(ss,productDate,insertDate) <77400 then 1 else 0 end) as '8.30-9.30'
 from   QCCheckRecord left join product_main on product_main.id=parent_id
 where pono=$P{pono}
and  model=$P{model}
and  prodectType=$P{prodectType}
and  productDate=$P{nowDate}
and  groupid=$P{groupid}
 group by QCCheckProjectID,productDate ,pono,groupid,model,prodectType
 ) as b on a.id=b.QCCheckProjectID
where a.id  like '%'+$P{prodectType}+'%'
order by a.id asc


select a.*,b.* from QCCheckProject as  a left join
(select QCCheckProjectID ,productDate ,pono,groupid,model, prodectType,sum(case when DATEPART(hour, insertDate) =8 then 1 else 0 end) as '8-9'
,sum(case when DATEPART(hour, insertDate) =9   then 1 else 0 end) as '9-10'
,sum(case when DATEPART(hour, insertDate) =10   then 1 else 0 end) as '10-11'
,sum(case when DATEPART(hour, insertDate) =11  then 1 else 0 end) as '11-12'
,sum(case when DateDiff(ss,productDate,insertDate)>=48600 and  DateDiff(ss,productDate,insertDate) <52200  then 1 else 0 end) as '1.30-2.30'
,sum(case when DateDiff(ss,productDate,insertDate)>=52200 and  DateDiff(ss,productDate,insertDate) <55800 then 1 else 0 end) as '2.30-3.30'
,sum(case when DateDiff(ss,productDate,insertDate)>=55800 and  DateDiff(ss,productDate,insertDate) <59400 then 1 else 0 end) as '3.30-4.30'
,sum(case when DateDiff(ss,productDate,insertDate)>=59400 and  DateDiff(ss,productDate,insertDate) <63000 then 1 else 0 end) as '4.30-5.30'
,sum(case when DateDiff(ss,productDate,insertDate)>=66600 and  DateDiff(ss,productDate,insertDate) <70200 then 1 else 0 end) as '6.30-7.30'
,sum(case when DateDiff(ss,productDate,insertDate)>=70200 and  DateDiff(ss,productDate,insertDate) <73800 then 1 else 0 end) as '7.30-8.30'
,sum(case when DateDiff(ss,productDate,insertDate)>=73800 and  DateDiff(ss,productDate,insertDate) <77400 then 1 else 0 end) as '8.30-9.30'
 from   QCCheckRecord left join product_main on product_main.id=parent_id
 group by QCCheckProjectID,prodectType,productDate ,pono,groupid,model
 ) as b on a.id=b.QCCheckProjectID
where  a.id like '%P01%'  or a.id  like '%S%'
order by a.id asc


select a.*,b.* from QCCheckProject as  a left join
(select QCCheckProjectID ,productDate ,pono,groupid,model, prodectType from   QCCheckProject left join product_main on product_main.id=parent_id
 group by QCCheckProjectID,prodectType,productDate ,pono,groupid,model
 ) as b on a.id=b.QCCheckProjectID
where charindex('S',a.id)>0
order by a.id asc

select LEFT(prodectType,1) from product_main

select * from  QCCheckProject
order by id desc

select p.name ,b.* from QCCheckProject p left join (
select productDate ,pono,groupid,model, prodectType, count(*) as qcnum, sum(case when QCCheckProjectID='P01' then 1 else 0 end ) as goodNum,
sum(case when QCCheckProjectID='P01' then 0 else 1  end ) as badNumb
 from product_main m left join  QCCheckRecord c
 on  m.id=c.parent_id
 group by  productDate ,pono,groupid,model, prodectType
 
 on p.id=b.QCCheckProjectID
where  p.id like '%P%'
group by parent_id,QCCheckProjectID,p.name

select p.*,b.* from QCCheckProject p  left join  (
select count(*) as qcnum,  QCCheckProjectID ,productDate ,pono,groupid,model, prodectType from product_main  m 
left join  QCCheckRecord c  on m.id=c.parent_id
group by QCCheckProjectID ,productDate ,pono,groupid,model, prodectType) as b
on p.id=b.QCCheckProjectID
where  p.id like '%p%'  or a.id  like '%S%'

delete  from qccheckrecord where parent_id=17 and insertDate=(select max(insertDate) from qccheckrecord where parent_id=17)


select a.id,productDate,pono,model,groupid,prodectType,sumWorker,targetProduct,standardProduct,b.* from product_main a left join qc_fail_detail b on a.id=b.parent_id
where 1=1 and (''='' or pono='') 
and  ('2016-05-06'=''or productDate='2016-05-06')
 and (''='' or model='')
 and (''='' or groupid='')
 and ('P'='' or prodectType='P')
 
 
 select a.*,b.* from QCCheckProject as  a left join
(select QCCheckProjectID , (case when  prodectType='S' then '直发器检查' when prodectType='C' then '卷发器检查'  when prodectType='P' then '功能检查'    end ) prodectType,sum(case when DATEPART(hour, insertDate) =8 then 1 else 0 end) as '8-9'
,sum(case when DATEPART(hour, insertDate) =9   then 1 else 0 end) as '9-10'
,sum(case when DATEPART(hour, insertDate) =10   then 1 else 0 end) as '10-11'
,sum(case when DATEPART(hour, insertDate) =11  then 1 else 0 end) as '11-12'
,sum(case when DateDiff(ss,productDate,insertDate)>=48600 and  DateDiff(ss,productDate,insertDate) <52200  then 1 else 0 end) as '1.30-2.30'
,sum(case when DateDiff(ss,productDate,insertDate)>=52200 and  DateDiff(ss,productDate,insertDate) <55800 then 1 else 0 end) as '2.30-3.30'
,sum(case when DateDiff(ss,productDate,insertDate)>=55800 and  DateDiff(ss,productDate,insertDate) <59400 then 1 else 0 end) as '3.30-4.30'
,sum(case when DateDiff(ss,productDate,insertDate)>=59400 and  DateDiff(ss,productDate,insertDate) <63000 then 1 else 0 end) as '4.30-5.30'
,sum(case when DateDiff(ss,productDate,insertDate)>=66600 and  DateDiff(ss,productDate,insertDate) <70200 then 1 else 0 end) as '6.30-7.30'
,sum(case when DateDiff(ss,productDate,insertDate)>=70200 and  DateDiff(ss,productDate,insertDate) <73800 then 1 else 0 end) as '7.30-8.30'
,sum(case when DateDiff(ss,productDate,insertDate)>=73800 and  DateDiff(ss,productDate,insertDate) <77400 then 1 else 0 end) as '8.30-9.30'
 from   QCCheckRecord left join product_main on product_main.id=parent_id
where parent_id=7
 group by QCCheckProjectID,prodectType,productDate ,pono,groupid,model,left(QCCheckProjectID,1)
 ) as b on a.id=b.QCCheckProjectID

order by a.id asc
 case when  QCCheckProjectID='P01' then '良品' else  '不良品' end as aa

select prodectType,productDate ,pono,groupid,model,
sum(one) firstHour,sum(two) secondHour ,sum(three) thirdHour, 
sum(four) fourthHour,sum(five)  fifthHour,sum(six) sixthHour , 
sum(seven) seventhHour,sum(eight) eighthHour ,sum(nine) ninthHour ,
sum(ten) tenthHour ,sum(eleven) eleventhHour,parent_id ,QCCheckProjectID from 
select a.*,b.* from (
select  
 parent_id,
sum(case when DATEPART(hour, insertDate) =8 then 1 else 0 end) as one
,sum(case when DATEPART(hour, insertDate) =9   then 1 else 0 end) as two
,sum(case when DATEPART(hour, insertDate) =10   then 1 else 0 end) as three
,sum(case when DATEPART(hour, insertDate) =11  then 1 else 0 end) as four
,sum(case when DateDiff(ss,productDate,insertDate)>=48600 and  DateDiff(ss,productDate,insertDate) <52200  then 1 else 0 end) as five
,sum(case when DateDiff(ss,productDate,insertDate)>=52200 and  DateDiff(ss,productDate,insertDate) <55800 then 1 else 0 end) as six
,sum(case when DateDiff(ss,productDate,insertDate)>=55800 and  DateDiff(ss,productDate,insertDate) <59400 then 1 else 0 end) as seven
,sum(case when DateDiff(ss,productDate,insertDate)>=59400 and  DateDiff(ss,productDate,insertDate) <63000 then 1 else 0 end) as eight
,sum(case when DateDiff(ss,productDate,insertDate)>=66600 and  DateDiff(ss,productDate,insertDate) <70200 then 1 else 0 end) as nine
,sum(case when DateDiff(ss,productDate,insertDate)>=70200 and  DateDiff(ss,productDate,insertDate) <73800 then 1 else 0 end) as ten
,sum(case when DateDiff(ss,productDate,insertDate)>=73800 and  DateDiff(ss,productDate,insertDate) <77400 then 1 else 0 end) as eleven

 from   QCCheckRecord left join product_main on product_main.id=parent_id
left join QCCheckProject on QCCheckProject.id=QCCheckRecord.QCCheckProjectID
 group by parent_id

) as a left join 
(

create table QCCheckProjectTemp(
QCCheckProjectID nvarchar(10)
)
insert into QCCheckProjectTemp values('良品')
insert into QCCheckProjectTemp values('不良品')

select  a.QCCheckProjectID,one,two,three,four,five,six,seven,eight,nine,ten,eleven  from  QCCheckProjectTemp a  left join(
select  case when  QCCheckProjectID='P01' then '良品' else  '不良品' end qcid , 
sum(case when DATEPART(hour, insertDate) =8 then 1 else 0 end) as one
,sum(case when DATEPART(hour, insertDate) =9   then 1 else 0 end) as two
,sum(case when DATEPART(hour, insertDate) =10   then 1 else 0 end) as three
,sum(case when DATEPART(hour, insertDate) =11  then 1 else 0 end) as four
,sum(case when DateDiff(ss,productDate,insertDate)>=48600 and  DateDiff(ss,productDate,insertDate) <52200  then 1 else 0 end) as five
,sum(case when DateDiff(ss,productDate,insertDate)>=52200 and  DateDiff(ss,productDate,insertDate) <55800 then 1 else 0 end) as six
,sum(case when DateDiff(ss,productDate,insertDate)>=55800 and  DateDiff(ss,productDate,insertDate) <59400 then 1 else 0 end) as seven
,sum(case when DateDiff(ss,productDate,insertDate)>=59400 and  DateDiff(ss,productDate,insertDate) <63000 then 1 else 0 end) as eight
,sum(case when DateDiff(ss,productDate,insertDate)>=66600 and  DateDiff(ss,productDate,insertDate) <70200 then 1 else 0 end) as nine
,sum(case when DateDiff(ss,productDate,insertDate)>=70200 and  DateDiff(ss,productDate,insertDate) <73800 then 1 else 0 end) as ten
,sum(case when DateDiff(ss,productDate,insertDate)>=73800 and  DateDiff(ss,productDate,insertDate) <77400 then 1 else 0 end) as eleven
 from   QCCheckRecord left join product_main on product_main.id=parent_id
where  productDate ='2016-05-18' 
  and  groupid='A组'
 group by case when  QCCheckProjectID='P01' then '良品' else  '不良品' end )as b  on a.QCCheckProjectID=b.qcid
 order by QCCheckProjectID
 group by  case when  a.id='P01' then '良品' else  '不良品' end ,parent_id,qcid
 
 on  a.parent_id=b.parent_id

 select count(*) from QCCheckRecord  group by parent_id,case when  QCCheckProjectID='P01' then '良品' else  '不良品' end
 
 group by QCCheckProjectID,parent_id, prodectType,productDate ,pono,groupid,model
 
 select * from product_main where productDate<'2016-05-11'
delete from QCCheckRecord where parent_id<7

delete from qc_fail_detail
 drop view qc_date_ProductionsV
order by  QCCheckProject.id asc
create view qc_date_ProductionsV as 
select   row_number() over (order by pono) as '序号' ,groupid as '产线',pono as  '生产订单',model as '产品型号',
sum(case when DATEPART(hour, insertDate) =8 then 1 else 0 end) as '1'
,sum(case when DATEPART(hour, insertDate) =9   then 1 else 0 end) as '2'
,sum(case when DATEPART(hour, insertDate) =10   then 1 else 0 end) as '3'
,sum(case when DATEPART(hour, insertDate) =11  then 1 else 0 end) as '4'
,sum(case when DateDiff(ss,productDate,insertDate)>=48600 and  DateDiff(ss,productDate,insertDate) <52200  then 1 else 0 end) as '5'
,sum(case when DateDiff(ss,productDate,insertDate)>=52200 and  DateDiff(ss,productDate,insertDate) <55800 then 1 else 0 end) as '6'
,sum(case when DateDiff(ss,productDate,insertDate)>=55800 and  DateDiff(ss,productDate,insertDate) <59400 then 1 else 0 end) as '7'
,sum(case when DateDiff(ss,productDate,insertDate)>=59400 and  DateDiff(ss,productDate,insertDate) <63000 then 1 else 0 end) as '8'
,sum(case when DateDiff(ss,productDate,insertDate)>=66600 and  DateDiff(ss,productDate,insertDate) <70200 then 1 else 0 end) as '9'
,sum(case when DateDiff(ss,productDate,insertDate)>=70200 and  DateDiff(ss,productDate,insertDate) <73800 then 1 else 0 end) as '10'
,sum(case when DateDiff(ss,productDate,insertDate)>=73800 and  DateDiff(ss,productDate,insertDate) <77400 then 1 else 0 end) as '11'
 ,count(insertDate)as '总产能' from   QCCheckRecord left join product_main on product_main.id=parent_id
 where productDate=Convert(varchar,getdate(),23) 
 group by  productDate, prodectType ,pono,groupid,model
 
 select * from qc_date_ProductionsV
select * from  QCCheckRecord where parent_id=14 and DATEPART(hour, insertDate) =13

select getdate();

select m.id,productDate ,pono,groupid,model, prodectType, c.* 
 from product_main m left join  QCCheckRecord c
 on  m.id=c.parent_id

where 1=1 
and   productDate='2016-05-17'

and prodectType='S'
 group by  productDate ,pono,groupid,model, prodectType,m.id
 
 
 select a.*,b.* from QCCheckProject as  a left join
(select QCCheckProjectID , (case when  prodectType='S' then '直发器检查' when prodectType='C' then '卷发器检查'   end ) prodectType,sum(case when DATEPART(hour, insertDate) <=8 then 1 else 0 end) as '8-9'
,sum(case when DATEPART(hour, insertDate) =9   then 1 else 0 end) as '9-10'
,sum(case when DATEPART(hour, insertDate) =10   then 1 else 0 end) as '10-11'
,sum(case when DateDiff(ss,productDate,insertDate)>=39600  and   DateDiff(ss,productDate,insertDate)<=43000  then 1 else 0 end) as '11-12'
,sum(case when DateDiff(ss,productDate,insertDate)>=48480 and  DateDiff(ss,productDate,insertDate) <52200  then 1 else 0 end) as '1.30-2.30'
,sum(case when DateDiff(ss,productDate,insertDate)>=52200 and  DateDiff(ss,productDate,insertDate) <55800 then 1 else 0 end) as '2.30-3.30'
,sum(case when DateDiff(ss,productDate,insertDate)>=55800 and  DateDiff(ss,productDate,insertDate) <59400 then 1 else 0 end) as '3.30-4.30'
,sum(case when DateDiff(ss,productDate,insertDate)>=59400 and  DateDiff(ss,productDate,insertDate) <63120 then 1 else 0 end) as '4.30-5.30'
,sum(case when DateDiff(ss,productDate,insertDate)>=66600 and  DateDiff(ss,productDate,insertDate) <70200 then 1 else 0 end) as '6.30-7.30'
,sum(case when DateDiff(ss,productDate,insertDate)>=70200 and  DateDiff(ss,productDate,insertDate) <73800 then 1 else 0 end) as '7.30-8.30'
,sum(case when DateDiff(ss,productDate,insertDate)>=73800 and  DateDiff(ss,productDate,insertDate) <77400 then 1 else 0 end) as '8.30-9.30'
 from   QCCheckRecord left join product_main on product_main.id=parent_id
where parent_id=14
 group by QCCheckProjectID,prodectType,productDate ,pono,groupid,model,left(QCCheckProjectID,1)
 ) as b  on a.id=b.QCCheckProjectID
where  a.id  like '%S%' or a.id like '%P%'
order by a.id asc


select id,productDate,pono
,model 
,groupid 
,case when prodectType='P' then '成品功能' when prodectType='C' then '卷发器'  when prodectType='S' then '直发器' end prodectType  
,sumWorker 
,targetProduct 
,standardProduct 
 from  product_main a
where 1=1 and  id in (select max(id) from product_main  where id=a.id)
and productDate='2016-05-12'
group by prodectType,productDate ,pono,groupid,model,sumWorker 
,targetProduct 
,standardProduct 

select  case when  QCCheckProjectID='P01' then '良品' else  '不良品' end QCCheckProjectID , sum(case when DATEPART(hour, insertDate) =8 then 1 else 0 end) as one,sum(case when DATEPART(hour, insertDate) =9   then 1 else 0 end) as two,sum(case when DATEPART(hour, insertDate) =10   then 1 else 0 end) as three,sum(case when DATEPART(hour, insertDate) =11  then 1 else 0 end) as four,sum(case when DateDiff(ss,productDate,insertDate)>=48600 and  DateDiff(ss,productDate,insertDate) <52200  then 1 else 0 end) as five,sum(case when DateDiff(ss,productDate,insertDate)>=52200 and  DateDiff(ss,productDate,insertDate) <55800 then 1 else 0 end) as six,sum(case when DateDiff(ss,productDate,insertDate)>=55800 and  DateDiff(ss,productDate,insertDate) <59400 then 1 else 0 end) as seven,sum(case when DateDiff(ss,productDate,insertDate)>=59400 and  DateDiff(ss,productDate,insertDate) <63000 then 1 else 0 end) as eight,sum(case when DateDiff(ss,productDate,insertDate)>=66600 and  DateDiff(ss,productDate,insertDate) <70200 then 1 else 0 end) as nine,sum(case when DateDiff(ss,productDate,insertDate)>=70200 and  DateDiff(ss,productDate,insertDate) <73800 then 1 else 0 end) as ten,sum(case when DateDiff(ss,productDate,insertDate)>=73800 and  DateDiff(ss,productDate,insertDate) <77400 then 1 else 0 end) as eleven from   QCCheckRecord left join product_main on product_main.id=parent_id left join QCCheckProject on QCCheckProject.id=QCCheckRecord.QCCheckProjectID where  productDate ='2016-05-17'  group by case when  QCCheckProjectID='P01' then '良品' else  '不良品' end
insert into  qc_fail_detail  ( parent_id ,failure_start_hour,failure_end_hour,failure_count_hours ,use_workers,use_sum_hours,failure_reason,lead_person,solution)  values(14,1,2,1,1,1,'2','1','1')
delete from qc_fail_detail
select  case when  QCCheckProjectID='P01' then '良品' else  '不良品' end QCCheckProjectID , sum(case when DATEPART(hour, insertDate) =8 then 1 else 0 end) as one,sum(case when DATEPART(hour, insertDate) =9   then 1 else 0 end) as two,sum(case when DATEPART(hour, insertDate) =10   then 1 else 0 end) as three,sum(case when DATEPART(hour, insertDate) =11  then 1 else 0 end) as four,sum(case when DateDiff(ss,productDate,insertDate)>=48600 and  DateDiff(ss,productDate,insertDate) <52200  then 1 else 0 end) as five,sum(case when DateDiff(ss,productDate,insertDate)>=52200 and  DateDiff(ss,productDate,insertDate) <55800 then 1 else 0 end) as six,sum(case when DateDiff(ss,productDate,insertDate)>=55800 and  DateDiff(ss,productDate,insertDate) <59400 then 1 else 0 end) as seven,sum(case when DateDiff(ss,productDate,insertDate)>=59400 and  DateDiff(ss,productDate,insertDate) <63000 then 1 else 0 end) as eight,sum(case when DateDiff(ss,productDate,insertDate)>=66600 and  DateDiff(ss,productDate,insertDate) <70200 then 1 else 0 end) as nine,sum(case when DateDiff(ss,productDate,insertDate)>=70200 and  DateDiff(ss,productDate,insertDate) <73800 then 1 else 0 end) as ten,sum(case when DateDiff(ss,productDate,insertDate)>=73800 and  DateDiff(ss,productDate,insertDate) <77400 then 1 else 0 end) as eleven from   QCCheckRecord left join product_main on product_main.id=parent_id left join QCCheckProject on QCCheckProject.id=QCCheckRecord.QCCheckProjectID where  productDate ='2016-05-18' and  groupid='A组' group by case when  QCCheckProjectID='P01' then '良品' else  '不良品' end

select * from QCCheckRecord  where  QCCheckProjectID!='P01'

select hourPeriod 
 ,worker_amount 
 ,get_workers 
 , get_workers_group
  ,borrow_workers
  ,borrow_workers_group
   from qc_worker_detail 
   
delete from qc_worker_detail
   delete from qc_worker_detail
   update qc_worker_detail  
 set  worker_amount=1  
 ,  hourPeriod=1  
 ,  get_workers=1  
 ,  get_workers_group='A组  '
 ,  borrow_workers=''  
 ,  borrow_workers_group=''
  where parent_id=null and  hourPeriod='1'
   where parent_id = 23
   
   select * from qcuser
   insert into  qc_worker_detail  
( parent_id ,   worker_amount,hourPeriod,get_workers,get_workers_group,borrow_workers,borrow_workers_group )
  values(13,12,'0',0,'',0,'')
  
  insert into  qc_fail_detail 
 ( parent_id ,failure_start_hour,failure_end_hour,failure_count_hours ,
 use_workers,use_sum_hours,failure_reason,lead_person,solution)
  values(15,'12:00','13:00',60.0,
1,60.0,'1','','')
delete from qc_fail_detail where id=40

select *  from product_main where parent_id=28
order by id asc

create table qc_plan_production (
	int id

)
select * from qcuser


select QCCheckProjectID ,sum(case when DATEPART(hour, insertDate) <=8 then 1 else 0 end) as '8-9'
,sum(case when DATEPART(hour, insertDate) =9   then 1 else 0 end) as '9-10'
,sum(case when DATEPART(hour, insertDate) =10   then 1 else 0 end) as '10-11'
,sum(case when DateDiff(ss,productDate,insertDate)>=39600  and   DateDiff(ss,productDate,insertDate)<=43000  then 1 else 0 end) as '11-12'
,sum(case when DateDiff(ss,productDate,insertDate)>=48480 and  DateDiff(ss,productDate,insertDate) <52200  then 1 else 0 end) as '1.30-2.30'
,sum(case when DateDiff(ss,productDate,insertDate)>=52200 and  DateDiff(ss,productDate,insertDate) <55800 then 1 else 0 end) as '2.30-3.30'
,sum(case when DateDiff(ss,productDate,insertDate)>=55800 and  DateDiff(ss,productDate,insertDate) <59400 then 1 else 0 end) as '3.30-4.30'
,sum(case when DateDiff(ss,productDate,insertDate)>=59400 and  DateDiff(ss,productDate,insertDate) <63120 then 1 else 0 end) as '4.30-5.30'
,sum(case when DateDiff(ss,productDate,insertDate)>=66600 and  DateDiff(ss,productDate,insertDate) <70200 then 1 else 0 end) as '6.30-7.30'
,sum(case when DateDiff(ss,productDate,insertDate)>=70200 and  DateDiff(ss,productDate,insertDate) <73800 then 1 else 0 end) as '7.30-8.30'
,sum(case when DateDiff(ss,productDate,insertDate)>=73800 and  DateDiff(ss,productDate,insertDate) <77400 then 1 else 0 end) as '8.30-9.30'
 from   QCCheckRecord left join product_main on product_main.id=parent_id
  group by QCCheckProjectID,prodectType,productDate ,pono,groupid,model,left(QCCheckProjectID,1)
where parent_id=14
drop view qc_date_ProductionsV
create view qc_date_ProductionsV as 
select   row_number() over (order by pono) as '序号' ,groupid as '产线',pono as  '生产订单',model as '产品型号',
sum(case when DATEPART(hour, insertDate) <=8 then 1 else 0 end) as '1'
,sum(case when DATEPART(hour, insertDate) =9   then 1 else 0 end) as '2'
,sum(case when DATEPART(hour, insertDate) =10   then 1 else 0 end) as '3'
,sum(case when DATEPART(hour, insertDate) =11  then 1 else 0 end) as '4'
,sum(case when DateDiff(ss,productDate,insertDate)>=48480 and  DateDiff(ss,productDate,insertDate) <52200  then 1 else 0 end) as '5'
,sum(case when DateDiff(ss,productDate,insertDate)>=52200 and  DateDiff(ss,productDate,insertDate) <55800 then 1 else 0 end) as '6'
,sum(case when DateDiff(ss,productDate,insertDate)>=55800 and  DateDiff(ss,productDate,insertDate) <59400 then 1 else 0 end) as '7'
,sum(case when DateDiff(ss,productDate,insertDate)>=59400 and  DateDiff(ss,productDate,insertDate) <63000 then 1 else 0 end) as '8'
,sum(case when DateDiff(ss,productDate,insertDate)>=66600 and  DateDiff(ss,productDate,insertDate) <70200 then 1 else 0 end) as '9'
,sum(case when DateDiff(ss,productDate,insertDate)>=70200 and  DateDiff(ss,productDate,insertDate) <73800 then 1 else 0 end) as '10'
,sum(case when DateDiff(ss,productDate,insertDate)>=73800 and  DateDiff(ss,productDate,insertDate) <77600 then 1 else 0 end) as '11'
 ,count(*)as '合计' from   QCCheckRecord left join product_main on product_main.id=parent_id
 where productDate=Convert(varchar,getdate(),23)  and QCCheckProjectID='P01'
 group by  productDate, prodectType ,pono,groupid,model
 
 drop view qc_date_ProductionsV
 create view qc_date_ProductionsV as 
 select row_number() over (order by pono) as '序号' ,groupid as '产线',pono as  '生产订单',model as '产品型号'
, sum(case when DATEPART(hour, insertDate) <=8 then 1 else 0 end) as '1'
,sum(case when DATEPART(hour, insertDate) =9   then 1 else 0 end) as '2'
,sum(case when DATEPART(hour, insertDate) =10   then 1 else 0 end) as '3'
,sum(case when DATEPART(hour, insertDate) =11  then 1 else 0 end) as '4'
,sum(case when DateDiff(ss,productDate,insertDate)>=48480 and  DateDiff(ss,productDate,insertDate) <52200  then 1 else 0 end) as '5'
,sum(case when DateDiff(ss,productDate,insertDate)>=52200 and  DateDiff(ss,productDate,insertDate) <55800 then 1 else 0 end) as '6'
,sum(case when DateDiff(ss,productDate,insertDate)>=55800 and  DateDiff(ss,productDate,insertDate) <59400 then 1 else 0 end) as '7'
,sum(case when DateDiff(ss,productDate,insertDate)>=59400 and  DateDiff(ss,productDate,insertDate) <63000 then 1 else 0 end) as '8'
,sum(case when DateDiff(ss,productDate,insertDate)>=66600 and  DateDiff(ss,productDate,insertDate) <70200 then 1 else 0 end) as '9'
,sum(case when DateDiff(ss,productDate,insertDate)>=70200 and  DateDiff(ss,productDate,insertDate) <73800 then 1 else 0 end) as '10'
,sum(case when DateDiff(ss,productDate,insertDate)>=73800 and  DateDiff(ss,productDate,insertDate) <77600 then 1 else 0 end) as '11'
  ,count(*)as '合计' from product_main 
 left join  QCCheckRecord on productDate=Convert(varchar,insertDate,23) 
  where productDate=Convert(varchar,getdate(),23)  and QCCheckProjectID='P01' and product_main.id =(select max(id) from product_main)
  group by  productDate, prodectType ,pono,groupid,model
 
 select * from qc_date_ProductionsV 
 update QCCheckRecord set  parent_id=34 where parent_id=35
 update qc_plan_production set finish_number 
 
  select row_number() over (order by id) as rowNumber  ,* from  qcuser where  rowNumber>0
 
 select * from product_main
 ---更新完工数量
 1、创建临时表#temp_1
SELECT count(*) as 'sum' ,pono  
FROM  product_main left join  QCCheckRecord on product_main.id=parent_id  
where QCCheckProjectID='P01' group by pono 
go
2、更新表pos_t_vip_info记录
UPDATE qc_plan_production
SET qc_plan_production.finish_number = #tmp_1.sum

from qc_plan_production left join  #tmp_1 on qc_plan_production.pono=#tmp_1.pono



go
select * from qc_plan_production
update a 
set a.value=b.value 
from tb a 
inner join excel b on a.id=b.id
3、删除临时表
DROP TABLE #tmp_1




update qc_plan_production set product_status='在产'  where  order_number<= finish_number

select * from qc_plan_production  where  order_number<= finish_number
go
select count(*) ,pono from product_main left join  QCCheckRecord on product_main.id=parent_id  where QCCheckProjectID='P01' group by pono  
select * from QCCheckRecord where parent_id=35

CREATE TABLE mon(
    NAME varchar(25),
    mon int       
)
INSERT INTO mon VALUES('z3',201501);
INSERT INTO mon VALUES('z3',201502);
INSERT INTO mon VALUES('z3',201505);
INSERT INTO mon VALUES('z3',201506);
INSERT INTO mon VALUES('z3',201507);
INSERT INTO mon VALUES('l4',201601);
INSERT INTO mon VALUES('l4',201602);

select  name ,max(mon),min(mon) from mon group by name
select  *  from product_main  where  datediff(week,productDate,getdate())=0
select convert(varchar(10),dateadd(dd,number,convert(varchar(8),getdate(),120)+'01'),120) as dt
from master..spt_values 
where type='P' 
and dateadd(dd,number,convert(varchar(8),getdate(),120)+'01')<=dateadd(dd,-1,convert(varchar(8),dateadd(mm,1,getdate()),120)+'01')

 create view qc_plan_ProductionsV as
select id '序号',pono '生产订单',mo0del '品名',product_specific '规格', order_number '订单数量',finish_number '完工数量',pre_product_date '预投产日期', product_status '状态' from qc_plan_production where pre_product_date between convert(varchar,getdate()-1,23) and convert(varchar,getdate()+6,23) or  product_status='在产'
select * from qc_plan_ProductionsV

SELECT count(*) as 'sum' ,pono  
FROM  product_main left join  QCCheckRecord on product_main.id=parent_id  



	select  * from qcuser
	   where  id=5
where QCCheckProjectID='P01' group by pono 
delete from QCCheckRecord where parent_id=78
DROP TABLE #tmp_1
select * from product_main where id=45
delete from product_main where id=78
select * from QCCheckRecord where parent_id=46 
update QCCheckRecord set parent_id=45 where parent_id=46

select id from QCCheckRecord where id='46'
 select  top 3 *
    from QCUser as user1  where id  not in ( select top 2 id  from  QCUser as user2) and  name like '%小%'
	 select            id, name, password, groupid, departmentid         from qcuser     where 1=1     and   id like '%"004"%'    
select * ,max(id) from product_main where 1=1    
and  productDate='2016-06-06'
and groupid='A组'
select  top 0           id, name, password, groupid, departmentid          from QCUser as user1  where id  not in ( select top 10 id  from  QCUser as wh1)


select *   from product_main where productDate='2016-06-06'
delete from  QCCheckRecord where parent_id>29
 select * from qc_worker_detail where parent_id=36
 select * from product_main
  (select ROW_NUMBER() over (order by departmant asc,id )as RowNum,* from [test].[dbo].[qc_product_delay_code] where 1=1) as temp
  where RowNum between 1 and 20
  
  select u.name ,u.password, u.id u_id,user_id,role_id
		from QCUser u left join User_Role  on u.id=user_id 
	   where u.name='admin' and u.password='admin'
	   select * from User_Role 
	   
	   
	    select top 10 *,u.id u_id,r.id r_id
    from QCUser as u left join User_Role r on u.id=user_id  
     where u.id  not in ( select top 0 id  from  QCUser as user2
    where 1=1 )
 delete  from User_Role where  id>5 
    
    select r.id r_id,name,ur.id ur_id
		from User_Role ur 
		left join qc_role r   on r.id=role_id 
		where r.id=2
		group by r.id ,name,ur.id 
		
		select * from product_main
		select datepart(month,insertDate) as 月份,count(*) as 合计,groupid  from QCCheckRecord left join product_main on parent_id=product_main.id  group by  datepart(month,insertDate) ,groupid
		select convert(varchar,insertDate,23) as 日期,count(*) as 合计,groupid  
		from QCCheckRecord left join product_main on parent_id=product_main.id  group by  convert(varchar,insertDate,23) ,groupid
		
 select row_number() over (order by groupid) as '序号' ,b.prodecttype, b.groupid as '产线',pono as  '生产订单',model as '产品型号',a.[1],a.[2],a.[3],a.[4],
 a.[5],a.[6],a.[7],a.[8],a.[9],a.[10],a.[11],a.[合计]
  from product_main b left join
 (select  groupid as '产线',prodecttype
, sum(case when DATEPART(hour, insertDate) <=8 then 1 else 0 end) as '1'
,sum(case when DATEPART(hour, insertDate) =9   then 1 else 0 end) as '2'
,sum(case when DATEPART(hour, insertDate) =10   then 1 else 0 end) as '3'
,sum(case when DATEPART(hour, insertDate) =11  then 1 else 0 end) as '4'
,sum(case when DateDiff(ss,productDate,insertDate)>=48480 and  DateDiff(ss,productDate,insertDate) <52200  then 1 else 0 end) as '5'
,sum(case when DateDiff(ss,productDate,insertDate)>=52200 and  DateDiff(ss,productDate,insertDate) <55800 then 1 else 0 end) as '6'
,sum(case when DateDiff(ss,productDate,insertDate)>=55800 and  DateDiff(ss,productDate,insertDate) <59400 then 1 else 0 end) as '7'
,sum(case when DateDiff(ss,productDate,insertDate)>=59400 and  DateDiff(ss,productDate,insertDate) <63000 then 1 else 0 end) as '8'
,sum(case when DateDiff(ss,productDate,insertDate)>=66600 and  DateDiff(ss,productDate,insertDate) <70200 then 1 else 0 end) as '9'
,sum(case when DateDiff(ss,productDate,insertDate)>=70200 and  DateDiff(ss,productDate,insertDate) <73800 then 1 else 0 end) as '10'
,sum(case when DateDiff(ss,productDate,insertDate)>=73800 and  DateDiff(ss,productDate,insertDate) <77600 then 1 else 0 end) as '11'
  ,count(*)as '合计' from product_main 
  left join  QCCheckRecord on parent_id=product_main.id
  where productDate=Convert(varchar,getdate(),23)  
  group by  productDate ,groupid,prodectType) as a on a.[产线]=b.groupid where productDate=Convert(varchar,getdate(),23)
  and b.id in(select max(id) from product_main group by groupid) order by groupid
		
	select * from product_main	
	
	select * from QCCheckRecord where parent_id=42
	
	 select sum(case when QCCheckProjectID='P01' THEN 1 ELSE 0 END) as goodNum,
  sum(case when QCCheckProjectID='P01' THEN 0 ELSE 1 END)as  badNum from QCCheckRecord  
  where 1=1
  and parent_id=42
		
		
		select a.*,b.* from QCCheckProject as  a left join
(select QCCheckProjectID , (case when  prodectType='S' then '直发器检查' when prodectType='C' then '卷发器检查'   end ) prodectType,sum(case when DATEPART(hour, insertDate) <=8 then 1 else 0 end) as '8-9'
,sum(case when DATEPART(hour, insertDate) =9   then 1 else 0 end) as '9-10'
,sum(case when DATEPART(hour, insertDate) =10   then 1 else 0 end) as '10-11'
,sum(case when DateDiff(ss,productDate,insertDate)>=39600  and   DateDiff(ss,productDate,insertDate)<=43000  then 1 else 0 end) as '11-12'
,sum(case when DateDiff(ss,productDate,insertDate)>=48480 and  DateDiff(ss,productDate,insertDate) <52200  then 1 else 0 end) as '1.30-2.30'
,sum(case when DateDiff(ss,productDate,insertDate)>=52200 and  DateDiff(ss,productDate,insertDate) <55800 then 1 else 0 end) as '2.30-3.30'
,sum(case when DateDiff(ss,productDate,insertDate)>=55800 and  DateDiff(ss,productDate,insertDate) <59400 then 1 else 0 end) as '3.30-4.30'
,sum(case when DateDiff(ss,productDate,insertDate)>=59400 and  DateDiff(ss,productDate,insertDate) <63120 then 1 else 0 end) as '4.30-5.30'
,sum(case when DateDiff(ss,productDate,insertDate)>=66400 and  DateDiff(ss,productDate,insertDate) <70200 then 1 else 0 end) as '6.30-7.30'
,sum(case when DateDiff(ss,productDate,insertDate)>=70200 and  DateDiff(ss,productDate,insertDate) <73800 then 1 else 0 end) as '7.30-8.30'
,sum(case when DateDiff(ss,productDate,insertDate)>=73800 and  DateDiff(ss,productDate,insertDate) <77600 then 1 else 0 end) as '8.30-9.30'
 from   QCCheckRecord left join product_main on product_main.id=parent_id
where parent_id=42
 group by QCCheckProjectID,prodectType,productDate ,pono,groupid,model,left(QCCheckProjectID,1)

 ) as b  on a.id=b.QCCheckProjectID
where  a.id  like '%D%' or a.id like '%P%'
order by a.id asc

select u.name ,u.password, u.id u_id,user_id,role_id,*
		from QCUser u left join User_Role  on u.id=user_id 
	   where u.name = #{name} and  password=#{password};
	select * from product_main	
		
		select    id, productDate, pono, model, sumWorker, targetProduct,
		 standardProduct, groupid, 
		  case when prodectType='D' then '定型器' when prodectType='C' then '卷发器'  when prodectType='S' then '直发器' end prodectType,  
		  case when progress=1 then '组装' when progress=2 then '包装' when progress=12 then '组装+包装' when progress=3 then '加工'  end progress  
		        from product_main     where 1=1              and  productDate = ?                     and  pono = ?                       and  groupid = ?                        and  prodectType = ?                       and  progress=  ?,



select * from
        (select ROW_NUMBER() over (order by 
       
         p.id) as RowNum,  p.id p_id,p.model p_mode,pp.id pp_id,pp.model pp_model,progressid,
         product_specific
		from qc_product_record  p
		left join qc_progress_man_hour pp   on p.model=pp.model
		where 1=1 
       
        ) as temp
      
        where RowNum between 1 and 10
        </if>
 delete  from QCCheckRecord where parent_id=108
       select * from qc_worker_detail where parent_id=108
       
       delete from qc_worker_detail   where id>977 and id<989
      delete from product_main   where id=108		        
		        select count(*) from QCCheckRecord left join product_main on product_main.id=parent_id where parent_id='79'