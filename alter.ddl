
select * from qcgroup
alter table qcgroup add  line_supervisor nvarchar(20)
alter table qcgroup add  group_lead nvarchar(20)

select * from qcuser
insert into qcuser (id ,name ,password) values('a1','a1','a1')

 Alter table qcuser drop column level
 Alter table qcuser add  departmentid int
 
 
 drop table qcfun
insert into qc_permission(name,url) values('Qc�û�����','/qc/QCUser.jsp')
insert into qc_permission(name,url) values('Qc���������','/qc/QCProject.jsp')
insert into qc_permission(name,url) values('Qc����¼','/qc/QCCheck.jsp')
insert into qc_permission(name,url) values('Qc�������','/qc/QCReport.jsp')
insert into qc_permission(name,url) values('Qc����¼','/qc/QCProductCode.jsp')
insert into qc_permission(name,url) values('Qc�������','/qc/QCProductionPlan.jsp')

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

insert into  qc_role (id,name,permissionId) values(1,'����Ա',1)
insert into  qc_role (id,name,permissionId) values(1,'����Ա',2)
insert into  qc_role (id,name,permissionId) values(1,'����Ա',3)
insert into  qc_role (id,name,permissionId) values(1,'����Ա',4)
insert into  qc_role (id,name,permissionId) values(2,'��ͨ�û�',4)
insert into  qc_role (id,name,permissionId) values(2,'��ͨ�û�',5)
insert into  qc_role (id,name,permissionId) values(2,'��ͨ�û�',3)
select * from qcuser
delete from qcuser

insert into qcuser(id,name,password,groupid) values('5160008','a1','a1','A��')
insert into qcuser(id,name,password,groupid) values('5160009','b1','b1','B��')
insert into qcuser(id,name,password,groupid) values('5160010','c1','c1','C��')
insert into qcuser(id,name,password,groupid) values('5160011','d1','d1','D��')
insert into qcuser(id,name,password,groupid) values('5160012','e1','e1','E��')
insert into qcuser(id,name,password,groupid) values('5160013','f1','f1','F��')
insert into qcuser(id,name,password,groupid) values('5160014','g1','g1','G��')
insert into qcuser(id,name,password,groupid) values('5160015','h1','h1','H��')
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
 alter table qc_worker_detail add borrow_workers_m int --���ӽ��ʱ�䣨���ӣ�
go
alter table qc_worker_detail add get_workers_m int   --���ӽ��빤ʱ �����ӣ�
go
alter table QCCheckProject add priority int   --�������ȼ� Ĭ��ֵ0

 Alter table QCCheckProject drop column barcodeimg
select * from QCCheckProject

--�������ű�
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



	--���������
	 create table qc_progress(
 "id" int identity not null primary key,
 progress_code  Integer	not null,
  progress_name nvarchar(20)	not null)--��������
 -- progress_minute int  --����ÿ��ÿ�������ĵķ����� )
    select * from product_main where id>78
    
    --������Ʒ����ʱ��
create table qc_progress_man_hour(
"id" int identity not null primary key,
 model nvarchar(20) not null ,
 progressid  int  not null,
 man_minute int not null, --���˵�����Ҫ�ķ�����
 man_hour  numeric(10,2),--���˵�����Ҫ��Сʱ��
 balance  numeric(10,2) --ƽ��ϵ��

)

--������Ʒ������
create table qc_product_record( 
"id" int identity not null primary key,
model  nvarchar(20) not null , --Ʒ��
product_specific nvarchar(20) not null ,--����ͺ�
product_type nvarchar(10) --��Ʒ����
)
select* from product_main
 Alter table product_main  alter column model nvarchar(40)
 Alter table qc_product_record drop column product_type
 Alter table qc_product_record add  material_code nvarchar(20)--���ϱ���
--����productTime�ֶβ�����=��С�Ĳ���ʱ��
 Alter table product_main add  productTime datetime
 update product_main set productTime = (select MIN(insertDate) from QCCheckRecord where parent_id=product_main.id)
 Alter table qc_worker_detail  add  work_minute  int --����ʱ��
 Alter table report_temp  alter  column model nvarchar(40)
 Alter table product_main add  endTime datetime
 Alter table qc_plan_production add  pre_shipment_date date   --2016-6-29 �����ƻ�����Ԥ�Ƴ�������
 Alter table qc_plan_production add  product_id int           --2016-7-2 ����ƻ����Ӳ�Ʒid���
 Alter table qc_progress_man_hour add  product_id int         --2016-7-2 ��Ʒ��ʱ�������Ӳ�Ʒid���
  Alter table qc_fail_detail add  remark  nvarchar(50)        --2016-07-02 ʧ�ܹ�ʱ��� ��ע�ֶ�
  Alter table qc_worker_detail add  packageNum  int    --2016-07-08 ��Ա������Ӱ�װ���ֶ�

  Alter table product_main add  productid  int      --2016-07-12 ����������Ӳ�Ʒid
 
 
 select * from product_main


select * from department

select  *  from  QCUser

update QCUser set groupid=3  where groupid='A��'
update QCUser set groupid=4  where groupid='B��'
update QCUser set groupid=5  where groupid='C��'
update QCUser set groupid=6  where groupid='D��'
update QCUser set groupid=7  where groupid='E��'
update QCUser set groupid=8  where groupid='F��'
update QCUser set groupid=9  where groupid='G��'
update QCUser set groupid=11  where groupid='H��'

alter table QCUser alter column  groupid int

update product_main set groupid=3  where groupid='A��'
update product_main set groupid=4  where groupid='B��'
update product_main set groupid=5  where groupid='C��'
update product_main set groupid=6  where groupid='D��'
update product_main set groupid=7  where groupid='E��'
update product_main set groupid=8  where groupid='F��'
update product_main set groupid=9  where groupid='G��'
update product_main set groupid=11  where groupid='H��'

update product_main set groupid=3  where groupid='A��'
update product_main set groupid=4  where groupid='B��'
update product_main set groupid=5  where groupid='C��'
update product_main set groupid=6  where groupid='D��'
update product_main set groupid=7  where groupid='E��'
update product_main set groupid=8  where groupid='F��'
update product_main set groupid=9  where groupid='G��'
update product_main set groupid=11  where groupid='H��'


drop view  product_vw_goodbadnum


alter table product_main alter column  groupid int



  --�޸� �������ƻ���ͼ
  drop view qc_date_ProductionsV
create view qc_date_ProductionsV as 
 select row_number() over (order by groupid) as '���' , department.name  as '����',pono as  '��������',model as '��Ʒ�ͺ�',a.[1],a.[2],a.[3],a.[4],
 a.[5],a.[6],a.[7],a.[8],a.[9],a.[10],a.[11],a.[�ϼ�]
  from product_main b left join
 (select  groupid as '����'
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
  ,count(*)as '�ϼ�' from product_main 
  left join  QCCheckRecord on parent_id=product_main.id
  where productDate=Convert(varchar,getdate(),23)  and QCCheckProjectID='P01' 
  group by  productDate ,groupid) as a on a.[����]=b.groupid
  left join department on department.id=b.groupid
   where productDate=Convert(varchar,getdate(),23)
  and b.id in(select max(id) from product_main  where productDate=Convert(varchar,getdate(),23) group by groupid) 


--��������
delete from report_temp
  insert into report_temp     select  pm.id,productDate,pono,model,sumWorker,targetProduct,standardProduct, department.name  groupid,
   prodectType,progress,QCCheckProjectID,insertDate ,productTime,endTime
     from product_main pm left join QCCheckRecord cr on cr.parent_id=pm.id
     left join department on department.id=pm.groupid
     
     select * from report_temp



create view [dbo].[qc_goodbad_ProductionV]       --2016-7-19��������ͼ������������Ϣ
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


  
   --�޸� �������ƻ���ͼ
  drop view qc_date_ProductionsV
  
  select * from qc_date_ProductionsV
create view qc_date_ProductionsV as 
 select row_number() over (order by department.name) as '���' , department.name  as '����',pono as  '��������',model as '��Ʒ�ͺ�',a.[1],a.[2],a.[3],a.[4],
 a.[5],a.[6],a.[7],a.[8],a.[9],a.[10],a.[11],a.[�ϼ�]
  from product_main b left join
 (select  pm.groupid as '����',
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
		   ,count(*)as '�ϼ�'
		   from    product_main pm   left join QCCheckRecord cr on pm.id=parent_id
		   left join qc_worktime wt on pm.groupid=wt.groupid   
		  where productDate=Convert(varchar,getdate(),23)  and QCCheckProjectID='P01' 
		  group by  productDate ,pm.groupid) as a on a.[����]=b.groupid
		  left join department on department.id=b.groupid
		   where productDate=Convert(varchar,getdate(),23)
		  and b.id in(select max(id) from product_main  where productDate=Convert(varchar,getdate(),23) group by groupid) 
  Alter table product_main add  productid  int  
  -��������
drop table report_temp




  Alter table qc_worker_detail add  standardProduct  int  ��ӿɱ��׼���� --zhoucy 2016-07-22
  Alter table qc_plan_production add  packbarcode   nvarchar(200)    --��Ӳʺ������� --zhoucy 2016-08-01
  Alter table qc_plan_production add  boxbarcode   nvarchar(200)    --������������� --zhoucy 2016-08-01
   Alter table qc_product_record  alter  column  material_code nvarchar(200)--�޸����ϱ���  ����--zhoucy 2016-09-06
   Alter table qc_plan_production  add  column  lastUpUser nvarchar(200)--��Ӹ����û���--zhoucy 2016-09-13
 