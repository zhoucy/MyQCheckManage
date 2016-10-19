
select * from qcgroup
alter table qcgroup add  line_supervisor nvarchar(20)
alter table qcgroup add  group_lead nvarchar(20)

select * from qcuser
insert into qcuser (id ,name ,password) values('a1','a1','a1')

 Alter table qcuser drop column level
 Alter table qcuser add  departmentid int
 
 
 drop table qcfun
insert into qc_permission(name,url) values('Qc用户管理','/qc/QCUser.jsp')
insert into qc_permission(name,url) values('Qc不良项管理','/qc/QCProject.jsp')
insert into qc_permission(name,url) values('Qc检测记录','/qc/QCCheck.jsp')
insert into qc_permission(name,url) values('Qc报表管理','/qc/QCReport.jsp')
insert into qc_permission(name,url) values('Qc检测记录','/qc/QCProductCode.jsp')
insert into qc_permission(name,url) values('Qc报表管理','/qc/QCProductionPlan.jsp')

 create table qc_permission(
        "id" int identity(1,1) not null primary key ("id"),
       "name" nvarchar(20) null,
       "fatherid" int null,
       "url" nvarchar(50) not null
    )
    
    select * from qcrole
 exec sp_rename 'QCfun','qc_permission'
 exec sp_rename 'qcrole.funid','permissionID','column';
 EXEC   sp_rename   'qcrole',   'qc_role'
 
 create table user_role(
	"id" int identity not null,
	user_id nvarchar(10),
	role_id int 
)
select * from qc_role

insert into  qc_role (id,name,permissionId) values(1,'管理员',1)
insert into  qc_role (id,name,permissionId) values(1,'管理员',2)
insert into  qc_role (id,name,permissionId) values(1,'管理员',3)
insert into  qc_role (id,name,permissionId) values(1,'管理员',4)
insert into  qc_role (id,name,permissionId) values(2,'普通用户',4)
insert into  qc_role (id,name,permissionId) values(2,'普通用户',5)
insert into  qc_role (id,name,permissionId) values(2,'普通用户',3)
select * from qcuser
delete from qcuser

insert into qcuser(id,name,password,groupid) values('5160008','a1','a1','A组')
insert into qcuser(id,name,password,groupid) values('5160009','b1','b1','B组')
insert into qcuser(id,name,password,groupid) values('5160010','c1','c1','C组')
insert into qcuser(id,name,password,groupid) values('5160011','d1','d1','D组')
insert into qcuser(id,name,password,groupid) values('5160012','e1','e1','E组')
insert into qcuser(id,name,password,groupid) values('5160013','f1','f1','F组')
insert into qcuser(id,name,password,groupid) values('5160014','g1','g1','G组')
insert into qcuser(id,name,password,groupid) values('5160015','h1','h1','H组')
go
delete from user_role
insert into user_role (user_id,role_id) values('5160004',1)
insert into user_role (user_id,role_id) values('5160006',1)
insert into user_role (user_id,role_id) values('a1',2)
insert into user_role (user_id,role_id) values('5160004',1)
insert into user_role (user_id,role_id) values('5160004',1)
go
create table  role_permission(
	"id" int identity not null,
	role_id int,
	permissionid int
)
select * from QCGroup

 Alter table product_main add  progress int 
 drop table progress
 go
 create table qc_progress(
 "id" int identity not null primary key,
  progress_name nvarchar(20)	not null)
  
  select  * from qc_worker_detail
 alter table qc_worker_detail add borrow_workers_m int --增加借出时间（分钟）
go
alter table qc_worker_detail add get_workers_m int   --增加借入工时 （分钟）
go
alter table QCCheckProject add priority int   --增加优先级 默认值0

 Alter table QCCheckProject drop column barcodeimg
select * from QCCheckProject

--新增部门表
  CREATE TABLE [dbo].[department](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [nvarchar](50) NULL,
	[name] [nvarchar](50) NULL,
	[leader] [nvarchar](50) NOT NULL,
	[belong] [nvarchar](50) NOT NULL,
	[remarks] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_department] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]



	--新增工序表
	 create table qc_progress(
 "id" int identity not null primary key,
 progress_code  Integer	not null,
  progress_name nvarchar(20)	not null)--工序名称
 -- progress_minute int  --工序每人每件所消耗的分钟数 )
    select * from product_main where id>78
    
    --新增产品工序工时表
create table qc_progress_man_hour(
"id" int identity not null primary key,
 model nvarchar(20) not null ,
 progressid  int  not null,
 man_minute int not null, --单人单件需要的分钟数
 man_hour  numeric(10,2),--单人单件需要的小时数
 balance  numeric(10,2) --平衡系数

)

--新增产品档案表
create table qc_product_record( 
"id" int identity not null primary key,
model  nvarchar(20) not null , --品名
product_specific nvarchar(20) not null ,--规格型号
product_type nvarchar(10) --产品类型
)
select* from product_main
 Alter table product_main  alter column model nvarchar(40)
 Alter table qc_product_record drop column product_type
 Alter table qc_product_record add  material_code nvarchar(20)--物料编码
--新增productTime字段并更新=最小的插入时间
 Alter table product_main add  productTime datetime
 update product_main set productTime = (select MIN(insertDate) from QCCheckRecord where parent_id=product_main.id)
 Alter table qc_worker_detail  add  work_minute  int --工作时间
 Alter table report_temp  alter  column model nvarchar(40)
 Alter table product_main add  endTime datetime
 Alter table qc_plan_production add  pre_shipment_date date   --2016-6-29 生产计划新增预计出货日期
 Alter table qc_plan_production add  product_id int           --2016-7-2 生存计划增加产品id外键
 Alter table qc_progress_man_hour add  product_id int         --2016-7-2 产品工时工序增加产品id外键
  Alter table qc_fail_detail add  remark  nvarchar(50)        --2016-07-02 失败工时添加 备注字段
  Alter table qc_worker_detail add  packageNum  int    --2016-07-08 人员调动添加包装数字段

  Alter table product_main add  productid  int      --2016-07-12 主订单表添加产品id
 
 
 select * from product_main


select * from department

select  *  from  QCUser

update QCUser set groupid=3  where groupid='A组'
update QCUser set groupid=4  where groupid='B组'
update QCUser set groupid=5  where groupid='C组'
update QCUser set groupid=6  where groupid='D组'
update QCUser set groupid=7  where groupid='E组'
update QCUser set groupid=8  where groupid='F组'
update QCUser set groupid=9  where groupid='G组'
update QCUser set groupid=11  where groupid='H组'

alter table QCUser alter column  groupid int

update product_main set groupid=3  where groupid='A组'
update product_main set groupid=4  where groupid='B组'
update product_main set groupid=5  where groupid='C组'
update product_main set groupid=6  where groupid='D组'
update product_main set groupid=7  where groupid='E组'
update product_main set groupid=8  where groupid='F组'
update product_main set groupid=9  where groupid='G组'
update product_main set groupid=11  where groupid='H组'

update product_main set groupid=3  where groupid='A组'
update product_main set groupid=4  where groupid='B组'
update product_main set groupid=5  where groupid='C组'
update product_main set groupid=6  where groupid='D组'
update product_main set groupid=7  where groupid='E组'
update product_main set groupid=8  where groupid='F组'
update product_main set groupid=9  where groupid='G组'
update product_main set groupid=11  where groupid='H组'


drop view  product_vw_goodbadnum


alter table product_main alter column  groupid int



  --修改 主生产计划视图
  drop view qc_date_ProductionsV
create view qc_date_ProductionsV as 
 select row_number() over (order by groupid) as '序号' , department.name  as '产线',pono as  '生产订单',model as '产品型号',a.[1],a.[2],a.[3],a.[4],
 a.[5],a.[6],a.[7],a.[8],a.[9],a.[10],a.[11],a.[合计]
  from product_main b left join
 (select  groupid as '产线'
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
  where productDate=Convert(varchar,getdate(),23)  and QCCheckProjectID='P01' 
  group by  productDate ,groupid) as a on a.[产线]=b.groupid
  left join department on department.id=b.groupid
   where productDate=Convert(varchar,getdate(),23)
  and b.id in(select max(id) from product_main  where productDate=Convert(varchar,getdate(),23) group by groupid) 


--更换报表
delete from report_temp
  insert into report_temp     select  pm.id,productDate,pono,model,sumWorker,targetProduct,standardProduct, department.name  groupid,
   prodectType,progress,QCCheckProjectID,insertDate ,productTime,endTime
     from product_main pm left join QCCheckRecord cr on cr.parent_id=pm.id
     left join department on department.id=pm.groupid
     
     select * from report_temp



create view [dbo].[qc_goodbad_ProductionV]       --2016-7-19　更新视图：包含隶属信息
  WITH SCHEMABINDING
  as
      select COUNT_BIG(*) total,
      sum(case when QCCheckProjectID='P01' then 1 else 0 end) good,
      sum(case when QCCheckProjectID!='P01' then 1 else 0 end) bad,
      productDate,groupid,dept.belong,prodectType
      from dbo.report_temp rt inner join dbo.department dept on rt.groupid=dept.id
      group by productDate,groupid,dept.belong,prodectType
GO
CREATE UNIQUE CLUSTERED INDEX [IDX_V1] ON [dbo].[qc_goodbad_ProductionV] 
(
	[productDate] ASC,
	[groupid] ASC,
	[belong] ASC,
	[prodectType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO


  
   --修改 主生产计划视图
  drop view qc_date_ProductionsV
  
  select * from qc_date_ProductionsV
create view qc_date_ProductionsV as 
 select row_number() over (order by department.name) as '序号' , department.name  as '产线',pono as  '生产订单',model as '产品型号',a.[1],a.[2],a.[3],a.[4],
 a.[5],a.[6],a.[7],a.[8],a.[9],a.[10],a.[11],a.[合计]
  from product_main b left join
 (select  pm.groupid as '产线',
		  sum(case when DATEDIFF(ss,pm.productDate,cr.insertDate) between s1 and e1 then 1 else 0 end) as '1',
		  sum(case when DATEDIFF(ss,pm.productDate,cr.insertDate) between s2 and e2 then 1 else 0 end) as '2',
		  sum(case when DATEDIFF(ss,pm.productDate,cr.insertDate) between s3 and e3 then 1 else 0 end) as '3',
		  sum(case when DATEDIFF(ss,pm.productDate,cr.insertDate) between s4 and e4 then 1 else 0 end) as '4',
		  sum(case when DATEDIFF(ss,pm.productDate,cr.insertDate) between s5 and e5 then 1 else 0 end) as '5',
		  sum(case when DATEDIFF(ss,pm.productDate,cr.insertDate) between s6 and e6 then 1 else 0 end) as '6',
		  sum(case when DATEDIFF(ss,pm.productDate,cr.insertDate) between s7 and e7 then 1 else 0 end) as '7',
		  sum(case when DATEDIFF(ss,pm.productDate,cr.insertDate) between s8 and e8 then 1 else 0 end) as '8',
		  sum(case when DATEDIFF(ss,pm.productDate,cr.insertDate) between s9 and e9 then 1 else 0 end) as '9',
		  sum(case when DATEDIFF(ss,pm.productDate,cr.insertDate) between s10 and e10 then 1 else 0 end) as '10',
		  sum(case when DATEDIFF(ss,pm.productDate,cr.insertDate) between s11 and e11 then 1 else 0 end) as '11'
		   ,count(*)as '合计'
		   from    product_main pm   left join QCCheckRecord cr on pm.id=parent_id
		   left join qc_worktime wt on pm.groupid=wt.groupid   
		  where productDate=Convert(varchar,getdate(),23)  and QCCheckProjectID='P01' 
		  group by  productDate ,pm.groupid) as a on a.[产线]=b.groupid
		  left join department on department.id=b.groupid
		   where productDate=Convert(varchar,getdate(),23)
		  and b.id in(select max(id) from product_main  where productDate=Convert(varchar,getdate(),23) group by groupid) 
  Alter table product_main add  productid  int  
  -更换报表
drop table report_temp




  Alter table qc_worker_detail add  standardProduct  int  添加可变标准产能 --zhoucy 2016-07-22
  Alter table qc_plan_production add  packbarcode   nvarchar(200)    --添加彩盒条形码 --zhoucy 2016-08-01
  Alter table qc_plan_production add  boxbarcode   nvarchar(200)    --添加箱子条形码 --zhoucy 2016-08-01
   Alter table qc_product_record  alter  column  material_code nvarchar(200)--修改物料编码  长度--zhoucy 2016-09-06
   Alter table qc_plan_production  add  column  lastUpUser nvarchar(200)--添加更新用户名--zhoucy 2016-09-13
 