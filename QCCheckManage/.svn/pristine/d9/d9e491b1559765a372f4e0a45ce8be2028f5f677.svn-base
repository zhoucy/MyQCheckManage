drop table QCCheckRecord
--生产记录详细表
    create table QCCheckRecord(
        "QCCheckProjectID" nvarchar(30) null,
        id int identity(1,1),
       parent_id int,
       "insertDate" datetime null,
   
    )
   
   alter table qc_fail_detail add
constraint FK_mian_failId foreign key(parent_id) references product_main(id);
--生产订单表   
create table product_main(
    id int not null primary key,
    	productDate date,
pono nvarchar(20),
model  nvarchar(20),
sumWorker int,
targetProduct int,
standardProduct int,
groupid nvarchar(20),
prodectType nvarchar(10))

--失败工时表
    create table "test"."dbo"."qc_fail_detail"(
        "id" int identity not null,
       "parent_id" int null,
       "failure_start_hour" nvarchar(10) null,
       "failure_end_hour" nvarchar(10) null,
       "failure_count_hours" numeric(10,2) null,
       "use_workers" int null,
       "use_sum_hours" numeric(10,2) null,
       "failure_reason" nvarchar(10) null,
       "lead_person" nvarchar(10) null,
       "solution" nvarchar(10) null
    )
go



    alter table "test"."dbo"."qc_fail_detail"  
        add constraint "FK_mian_failId" 
        foreign key ("parent_id") 
        references "test"."dbo"."product_main"("id")
go
    
go
--组别表
drop table QCGRoup
    create table "KEDB"."dbo"."QCGRoup"(
        "id" int not null,
       "name" nvarchar(20) not null
    )
go



--权限表
 create table qc_permission(
        "id" int identity(1,1) not null primary key ("id"),
       "name" nvarchar(20) null,
       "fatherid" int null,
       "url" nvarchar(50) not null
    )
    
 go
 --不良项表
    create table "KEDB"."dbo"."QCCheckProject"(
        "id" nvarchar(20) not null,
       "name" nvarchar(30) not null,
        constraint "QCCheckProjectPK" primary key ("id")
    )
    
   
    drop table QCUser
    --用户表
        create table "KEDB"."dbo"."QCUser"(
        "id" nvarchar(20) not null,
       "name" nvarchar(20) not null,
       "password" nvarchar(20) not null,
       "groupid" nvarchar(20) null,
       "level" int null,
        constraint "qcuserPK01" primary key ("id")
    )
    
    alter table qc_product_delay_code drop constraint PK__qc_produ__3213E83F27B92940 --删除唯一约束
    alter table qc_product_delay_code add constraint  PK__qc_produ__3213E83F27B92940 primary key (delay_code)--主键约束
    Alter table qc_product_delay_code alter column delay_code nvarchar(20) not null
    
    --生产延误表
    create table qc_product_delay_code(
    	id int identity(1,1) not null,
    	departmant nvarchar(20),
    	delay_code nvarchar(20)  not null primary key,
    	description nvarchar(50),
    	range nvarchar(150)
    
    )
    --员工调动表
    create table  qc_worker_detail(
   		 id int identity(1,1) not null,
   		 parent_id int not null,
    	hourPeriod nvarchar(10),
    	worker_amount int ,
    	get_workers int,
    	get_workers_group nvarchar(20),
    	borrow_workers int,
    	borrow_workers_group nvarchar(20)
    )
    alter table qc_worker_detail add get_workers_m int
    
    --生产计划表
    create table qc_plan_production (
	 id int identity(1,1) not null,
	 pono nvarchar(20) not null primary key,
	 model  nvarchar(20), 
	 product_specific nvarchar(20),
	 order_number int,
	 finish_number int,
	 pre_product_date date,
	 product_status nvarchar(10),
	)
	
	drop table qc_progress
	--工序表
	 create table qc_progress(
 "id" int identity not null primary key,
 progress_code  Integer	not null,
  progress_name nvarchar(20)	not null)--工序名称
 -- progress_minute int  --工序每人每件所消耗的分钟数 )
    select * from product_main where id>78
    
    --产品工序工时表
create table qc_progress_man_hour(
"id" int identity not null primary key,
 model nvarchar(20) not null ,
 progressid  int  not null,
 man_minute int not null, --单人单件需要的分钟数
 man_hour  numeric(10,2),--单人单件需要的小时数
 balance  numeric(10,2) --平衡系数

)

    
    --产品类别表
create table qc_product_type(
 "id" int identity not null primary key,
 product_no  nvarchar(20) not null,--产品类别编号
product_name nvarchar(20) not null ,--产品名称

)
--产品档案表
create table qc_product_record( 
"id" int identity not null primary key,
model  nvarchar(20) not null , --品名
product_specific nvarchar(20) not null, --规格型号

)

select * from qc_product_record
--标准工时表
create table  qc_standard_man_hour(

)
    
    
  ---生产日报视图  

drop view qc_date_ProductionsV
   create view qc_date_ProductionsV as 
 select row_number() over (order by groupid) as '序号' , b.groupid as '产线',pono as  '生产订单',model as '产品型号',a.[1],a.[2],a.[3],a.[4],
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
  group by  productDate ,groupid) as a on a.[产线]=b.groupid where productDate=Convert(varchar,getdate(),23)
  and b.id in(select max(id) from product_main group by groupid) 

  --主生产计划看板视图
drop view qc_plan_ProductionsV

select * from qc_plan_ProductionsV
   create view qc_plan_ProductionsV as
select row_number() over (order by id) as  '序号',pono '生产订单',model '品名',product_specific '规格', order_number '订单数量',
finish_number '完工数量',pre_product_date '预投产日期', product_status '状态' from qc_plan_production 
where pre_product_date between convert(varchar,getdate()-1,23) and convert(varchar,getdate()+6,23) or  product_status='在产'

select * from qc_plan_ProductionsV
 
 --新增订单表触发事件   
    if (object_id('tgr_classes_insert', 'tr') is not null)
    drop trigger tgr_classes_insert
go
create trigger tgr_product_main_insert
on product_main
    for insert --插入触发
as
	
    --定义变量
      declare @pono nvarchar(20);
     select  @pono = pono  from inserted;
    --在inserted表中查询已经插入记录信息
    update  qc_plan_production set product_status='在产' where pono=@pono
    
    print '更新陈宫！';
go
    
    --代码表
    
    insert into qc_product_delay_code values('生产','P-PD01','新人培训，学习曲线','产线新增人员，尚未达到熟练员工的标准')
    insert into qc_product_delay_code values('生产','P-PD02','人力不足','产线人力短缺（相对于IE提供的此产品的标准人力')
    insert into qc_product_delay_code values('生产','P-PD03','人力调配不当','对员工的人力调配不懂，将不会做此公务的人员安排做此工位')
    insert into qc_product_delay_code values('生产','P-PD04','换线','产品从一个机种切换到下一个机种造成的换线延误')
   --用户表 
insert into qcuser(id,name,password,groupid,level) values('5160001','周晨雨','zhoucy','A组','1')
insert into qcuser(id,name,password,groupid,level) values('5160002','小东 ','xiaodong','A组','2')
insert into qcuser(id,name,password,groupid,level) values('5160007','user ','user','A组','2')
insert into qcuser(id,name,password,groupid,level) values('5160003','小南','xiaonan','A组','2')
insert into qcuser(id,name,password,groupid,level) values('5160004','小西','xiaoxi','A组','2')
insert into qcuser(id,name,password,groupid,level) values('5160005','小北','xiaobei','A组','2')
--组别表
insert into QCGRoup(id,name) values(001,'A组')
insert into QCGRoup(id,name) values(002,'B组')
insert into QCGRoup(id,name) values(003,'C组')
insert into QCGRoup(id,name) values(004,'D组')


--角色对应功能表
insert into levelToQcFun(id,levelid,funid,quanxian) values(001,001,001,'用户管理')
insert into levelToQcFun(id,levelid,funid,quanxian) values(002,001,002,'不良项目管理')
insert into levelToQcFun(id,levelid,funid,quanxian) values(003,001,003,'Qc检查记录')
insert into levelToQcFun(id,levelid,funid,quanxian) values(004,001,004,'报表管理')
insert into levelToQcFun(id,levelid,funid,quanxian) values(005,002,003,'Qc检测记录')
insert into levelToQcFun(id,levelid,funid,quanxian) values(006,002,004,'报表管理')
insert into levelToQcFun(id,levelid,funid,quanxian) values(007,001,005,'生产延误代码')
insert into levelToQcFun(id,levelid,funid,quanxian) values(008,001,006,'生产计划')

alter table QCfun add constraint qcfun_pk primary key (id)-
delete  from levelToQcFun
--功能表
delete from QCfun

insert into qc_permission(name,url) values('Qc用户管理','/qc/QCUser.jsp')
insert into qc_permission(name,url) values('Qc不良项管理','/qc/QCProject.jsp')
insert into qc_permission(name,url) values('Qc检测记录','/qc/QCCheck.jsp')
insert into qc_permission(name,url) values('Qc报表管理','/qc/QCReport.jsp')
insert into qc_permission(name,url) values('Qc检测记录','/qc/QCProductCode.jsp')
insert into qc_permission(name,url) values('Qc报表管理','/qc/QCProductionPlan.jsp')
--角色表
insert into level values(001,'管理员',1)
insert into level values(001,'管理员',2)
insert into level values(001,'管理员',3)
insert into level values(001,'管理员',4)
insert into level values(002,'普通用户',3)
insert into level values(002,'普通用户',4)


--项目表

insert into QCCheckProject(id,name) values('D01','地面壳刮花')
insert into QCCheckProject(id,name) values('D02','扣位断裂')
insert into QCCheckProject(id,name) values('D03','插脚压伤')
insert into QCCheckProject(id,name) values('D04','漏打螺丝')
insert into QCCheckProject(id,name) values('D05','螺丝未到位')
insert into QCCheckProject(id,name) values('D06','螺丝头花')
insert into QCCheckProject(id,name) values('D07','打错螺丝')
insert into QCCheckProject(id,name) values('D08','压线')
insert into QCCheckProject(id,name) values('D09','漏打日期')
insert into QCCheckProject(id,name) values('D10','混色')
insert into QCCheckProject(id,name) values('D11','批锋')
insert into QCCheckProject(id,name) values('D12','缩水')
insert into QCCheckProject(id,name) values('D13','内有杂物')
insert into QCCheckProject(id,name) values('D14','污渍')
insert into QCCheckProject(id,name) values('D15','漏装卷筒')
insert into QCCheckProject(id,name) values('D16','漏打夹子')
insert into QCCheckProject(id,name) values('D17','插脚变形')

insert into QCCheckProject(id,name) values('D18','插脚紧')
insert into QCCheckProject(id,name) values('D19','卷筒刮花')
insert into QCCheckProject(id,name) values('D20','桶盖未压到位')
insert into QCCheckProject(id,name) values('D21','漏装红点')
insert into QCCheckProject(id,name) values('D22','红点装配不良')
insert into QCCheckProject(id,name) values('D23','卷筒装错颜色')

insert into QCCheckProject(id,name) values('S01','螺丝打花')
insert into QCCheckProject(id,name) values('S02','漏打螺丝.螺母')
insert into QCCheckProject(id,name) values('S03','丝印刮花')
insert into QCCheckProject(id,name) values('S04','手柄刮花')
insert into QCCheckProject(id,name) values('S05','发热板刮花.变形')
insert into QCCheckProject(id,name) values('S06','夹纸松脱')
insert into QCCheckProject(id,name) values('S07','混色')
insert into QCCheckProject(id,name) values('S08','手柄离缝')
insert into QCCheckProject(id,name) values('S09','漏打日期.日期打不良')
insert into QCCheckProject(id,name) values('S10','盖板.隔热板断裂')
insert into QCCheckProject(id,name) values('S11','底面壳刮花')
insert into QCCheckProject(id,name) values('S12','佛伦布烂')
insert into QCCheckProject(id,name) values('S13','变色胶装配不良')
insert into QCCheckProject(id,name) values('S14','锁扭紧')
insert into QCCheckProject(id,name) values('S15','锁扭有响声')
insert into QCCheckProject(id,name) values('S16','俩板锁合离缝.有声音')
insert into QCCheckProject(id,name) values('S17','锁制刮花')
insert into QCCheckProject(id,name) values('S18','机内有杂物')
insert into QCCheckProject(id,name) values('S19','密封圈外露.线头外露')
insert into QCCheckProject(id,name) values('S20','螺丝未打紧')
insert into QCCheckProject(id,name) values('S21','盖板打花')
insert into QCCheckProject(id,name) values('S22','盖板角高')
insert into QCCheckProject(id,name) values('S23','镜片刮花')
insert into QCCheckProject(id,name) values('S24','盖板用错')
insert into QCCheckProject(id,name) values('S25','底面壳用错')
insert into QCCheckProject(id,name) values('S26','夹线.夹胶纸')
insert into QCCheckProject(id,name) values('S27','尾帽爆裂.发白')

insert into QCCheckProject(id,name) values('P01','良品')
insert into QCCheckProject(id,name) values('P02','无电流')
insert into QCCheckProject(id,name) values('P03','功率高')
insert into QCCheckProject(id,name) values('P04','功率低')
insert into QCCheckProject(id,name) values('P05','短路')
insert into QCCheckProject(id,name) values('P06','开关接触不良')
insert into QCCheckProject(id,name) values('P07','转尾接触不良')
insert into QCCheckProject(id,name) values('P08','按键无ON或无OFF')
insert into QCCheckProject(id,name) values('P09','按键无弹性')
insert into QCCheckProject(id,name) values('P10','按键弹性不良')
insert into QCCheckProject(id,name) values('P11','有电流灯不亮')
insert into QCCheckProject(id,name) values('P12','无电流灯亮')
insert into QCCheckProject(id,name) values('P13','旋纽紧')
insert into QCCheckProject(id,name) values('P14','转尾紧')
insert into QCCheckProject(id,name) values('P15','灯暗/灯底')
insert into QCCheckProject(id,name) values('P16','未开机有电流')
insert into QCCheckProject(id,name) values('P17','旋钮不对位')
insert into QCCheckProject(id,name) values('P18','低档无电流')
insert into QCCheckProject(id,name) values('P19','死机(IE)')
insert into QCCheckProject(id,name) values('P20','自动开机')
insert into QCCheckProject(id,name) values('P21','显示不良')
insert into QCCheckProject(id,name) values('P22','振动接触不良')
insert into QCCheckProject(id,name) values('P23','无负离子')
insert into QCCheckProject(id,name) values('P24','负离子有异响')
insert into QCCheckProject(id,name) values('P25','蜂鸣器无声')
insert into QCCheckProject(id,name) values('P26','“+”“-”档次不能调节')
insert into QCCheckProject(id,name) values('P27','有电流负离子灯不亮')


insert into QCCheckProject(id,name) values('C01','丝印刮花')
insert into QCCheckProject(id,name) values('C02','漏打螺丝')
insert into QCCheckProject(id,name) values('C03','木咀松动')
insert into QCCheckProject(id,name) values('C04','支架变形')
insert into QCCheckProject(id,name) values('C05','用错支架')
insert into QCCheckProject(id,name) values('C06','漏装支架')
insert into QCCheckProject(id,name) values('C07','夹变形')
insert into QCCheckProject(id,name) values('C08','通刮花')
insert into QCCheckProject(id,name) values('C09','夹刮花')
insert into QCCheckProject(id,name) values('C10','手柄刮花')
insert into QCCheckProject(id,name) values('C11','木芯松动')
insert into QCCheckProject(id,name) values('C12','转尾响')
insert into QCCheckProject(id,name) values('C13','机内有杂物')
insert into QCCheckProject(id,name) values('C14','手柄离位')
insert into QCCheckProject(id,name) values('C15','电源线损伤')
insert into QCCheckProject(id,name) values('C16','漏装梳齿')
insert into QCCheckProject(id,name) values('C17','漏丝印')
insert into QCCheckProject(id,name) values('C18','漏装壁钉')
insert into QCCheckProject(id,name) values('C19','梳齿塑胶不全')
insert into QCCheckProject(id,name) values('C20','螺丝打花头')
insert into QCCheckProject(id,name) values('C21','夹纸松脱')
insert into QCCheckProject(id,name) values('C22','夹有异响')
insert into QCCheckProject(id,name) values('C23','用错旋钮')



--延误代码
insert into qc_product_delay_code (departmant,delay_code,description,range) values('生产','P-PD01','新人培训,学习曲线','产线新增人员,尚未达到熟练员工的标准.')
insert into qc_product_delay_code (departmant,delay_code,description,range) values('生产','P-PD02','人力不足','产线人力短缺(相对于IE提供的此产品的标准人力）')
insert into qc_product_delay_code (departmant,delay_code,description,range) values('生产','P-PD03','人力调配不当','对员工的人力调配不当,将不会做此工位的人员安排做此工位.')
insert into qc_product_delay_code (departmant,delay_code,description,range) values('生产','P-PD04','换线','产品从一个机种切换到下一个机种造成的换线延误')
insert into qc_product_delay_code (departmant,delay_code,description,range) values('生产','P-PD05','未依WI作业','员工未依照WI作业造成产线产品不良需返工造成的延误')
insert into qc_product_delay_code (departmant,delay_code,description,range) values('生产','P-PD06','未做过产品的第一次生产','此产品之前都在其他线或楼层生产,第一次排在本线别生产,致使员工对产品不熟悉造成的工时延误.')
insert into qc_product_delay_code (departmant,delay_code,description,range) values('生产','P-PD07','退修品','处理退修品导致的延误,客退不良品重工或者派员工至客户端处理不良品(客户付费）')
insert into qc_product_delay_code (departmant,delay_code,description,range) values('生产','P-PD99','其他','')
insert into qc_product_delay_code (departmant,delay_code,description,range) values('PE','P-PE01','测试程式/或WI错误','PE未依规定时间更新程式或WI')
insert into qc_product_delay_code (departmant,delay_code,description,range) values('PE','P-PE02','误测/漏测','因PE调试等问题造成测试项目误测,漏测')
insert into qc_product_delay_code (departmant,delay_code,description,range) values('PE','P-PE03','治工具/设备问题','测试治工具/设备故障,或因PE造成的电力和气压等故障')
insert into qc_product_delay_code (departmant,delay_code,description,range) values('PE','P-PE04','其他部门支援工时','其他部门支援PE之工时')
insert into qc_product_delay_code (departmant,delay_code,description,range) values('PE','P-PE05','换线延误','调换测试设备及测试程式不及时')
insert into qc_product_delay_code (departmant,delay_code,description,range) values('PE','P-PE99','其他','')
insert into qc_product_delay_code (departmant,delay_code,description,range) values('夹具房','P-ME01','设备/治工具/备品问题','责任归属为ME的设备、治工具以及备品问题所造成之延误')
insert into qc_product_delay_code (departmant,delay_code,description,range) values('夹具房','P-ME03','ME 换线不及时','换线过程中因ME原因所造成之延误(包含设备及治工具调整、切换治工具不及时等）')
insert into qc_product_delay_code (departmant,delay_code,description,range) values('夹具房','P-ME04','其他部们支援工时','其他部门支援ME之工时')
insert into qc_product_delay_code (departmant,delay_code,description,range) values('夹具房','P-ME99','其他','')
insert into qc_product_delay_code (departmant,delay_code,description,range) values('NPI','N-NPI01','新机种转接问题','未及时解决试产时的问题，新机种未转接好（包含制程编排不合理，缺治工具及测试程式等）
或PE,TE未及时到线上教线,(不包括工程,QC问题）')
insert into qc_product_delay_code (departmant,delay_code,description,range) values('NPI','N-NPI02','材料BOM漏列','BOM漏列材料,新机种首次量产归PE,反映后未改归IE WI问题.')
insert into qc_product_delay_code (departmant,delay_code,description,range) values('NPI','N-NPI03','其他部门支援工时','其他部门支援NPI工时,')
insert into qc_product_delay_code (departmant,delay_code,description,range) values('NPI','N-NPI99','其他','')
insert into qc_product_delay_code (departmant,delay_code,description,range) values('加工线','M-DM01','送料问题','加工线送料不及时')
insert into qc_product_delay_code (departmant,delay_code,description,range) values('加工线','M-DM02','零件加工问题','加工线零件加工不符合规格,造成产线生产困难.')
insert into qc_product_delay_code (departmant,delay_code,description,range) values('加工线','M-DM04','造成其他部门延误','其他部门需要加工线协助,但加工线未及时协助造成之延误.')
insert into qc_product_delay_code (departmant,delay_code,description,range) values('加工线','M-DM99','其他','')
insert into qc_product_delay_code (departmant,delay_code,description,range) values('研发工程','R-RD01','电器设计问题','工程设计中电器设计不良 ,包括生产规格电气部门错误,
设计变更BOM,技术规格书 等工程文件造成的的延误及重工,')
insert into qc_product_delay_code (departmant,delay_code,description,range) values('研发工程','R-RD02','机构设计问题','工程设计中机构设计不良,包括生产规格机构部门错误,
设计变更BOM,技术规格书等工程文件造成的延误工时及重工')
insert into qc_product_delay_code (departmant,delay_code,description,range) values('研发工程','R-RD03','工程变更材料不及时','资料中心未依规定时间签发工程变更资料（BOM,ECN等）错误
或漏发所造成之延误（不包括设计未发的变更文件或设计发文不及时造成之延误）')
insert into qc_product_delay_code (departmant,delay_code,description,range) values('研发工程','R-RD05','其他部门支援工时','其他部门支援工程工时,包含新机种试做等')
insert into qc_product_delay_code (departmant,delay_code,description,range) values('研发工程','R-RD99','其他','')
insert into qc_product_delay_code (departmant,delay_code,description,range) values('PMC','M-PC01','PMC未及时来货','依照生产排程产线已经开线,但PMC的物料还未到仓库或数量不够造成之延误')
insert into qc_product_delay_code (departmant,delay_code,description,range) values('PMC','M-PC02','PMC未依生产排程及时开提料单','PMC未及时开提料单,致使仓库有料但无法配送至生产线所造成之延误.')
insert into qc_product_delay_code (departmant,delay_code,description,range) values('PMC','M-PC03','其他','')
insert into qc_product_delay_code (departmant,delay_code,description,range) values('仓库','W-WH01','发料或送料不及时','产线依照生产计划已经准备生产,但仓库的物料还未送至生产线或配送不及时')
insert into qc_product_delay_code (departmant,delay_code,description,range) values('仓库','W-WH02','发错料','仓库发错料导致的产线返工造成的工时延误')
insert into qc_product_delay_code (departmant,delay_code,description,range) values('仓库','W-WH03','发错料','仓库发错料需更换发料造成的产线未及时开线造成的工时延误')
insert into qc_product_delay_code (departmant,delay_code,description,range) values('仓库','W-WH04','材料转合格仓不及时','IQC检验合格后未及时将材料转到合格仓造成的产线延误')
insert into qc_product_delay_code (departmant,delay_code,description,range) values('仓库','W-WH05','库存不足','有提料单但仓库材料无库存或库存不足造成的产线延误')
insert into qc_product_delay_code (departmant,delay_code,description,range) values('仓库','W-WH99','其他','')
insert into qc_product_delay_code (departmant,delay_code,description,range) values('品保','Q-QC-01','品管Check延误','品管Check对于异常状况未依规定时间判定等')
insert into qc_product_delay_code (departmant,delay_code,description,range) values('品保','Q-QC-02','品管误判','加工线/生产线材料品质问题误判')
insert into qc_product_delay_code (departmant,delay_code,description,range) values('品保','Q-QC-03','成品抽检重流','成品抽检后重新组合所造成之延误')
insert into qc_product_delay_code (departmant,delay_code,description,range) values('品保','Q-QC-05','制程品质管制','(1)生产线品质问题不良率超过管制目标未依规定时间反映处理
(2)制程中不良未依规定时间分析原因或者QC分析不出原因及对策')
insert into qc_product_delay_code (departmant,delay_code,description,range) values('品保','Q-QC-06','内部不浪品重工','因品管判断失误或者OQC判定整批性品质不良所造成的延误或重工.')
insert into qc_product_delay_code (departmant,delay_code,description,range) values('品保','Q-QC-07','等待支援或支援不及时','未配合生产线上班及加班,需要品管支援时品管不在工作岗位
(开会,培训,有提前通知但未交接清楚)所造成的延误')
insert into qc_product_delay_code (departmant,delay_code,description,range) values('品保','Q-QC-08','OQC','OQC所造成之延误')
insert into qc_product_delay_code (departmant,delay_code,description,range) values('品保','Q-QC-09','其他部门支援工时','其他部门支援品管工时')
insert into qc_product_delay_code (departmant,delay_code,description,range) values('品保','Q-QC-99','其他','')
insert into qc_product_delay_code (departmant,delay_code,description,range) values('重工工单','R-R01','客退品重工','R工单')
insert into qc_product_delay_code (departmant,delay_code,description,range) values('市场部','S-SA01','客户取消订单','已上线生产工单客户取消工单所产生的工时')
insert into qc_product_delay_code (departmant,delay_code,description,range) values('市场部','S-SA02','客户要求变更材料,生产方式等','量产时由于客户要求变更造成生产线重工,等待
(不包含工程规格要求修正的部份)')
insert into qc_product_delay_code (departmant,delay_code,description,range) values('市场部','S-SA03','客户资料错误','业务未及时提供已变更的客户资料或客户资料提供错误造成的产线返工')
insert into qc_product_delay_code (departmant,delay_code,description,range) values('市场部','S-SA04','其他部门支援工时','其他部门支援业务工时')
insert into qc_product_delay_code (departmant,delay_code,description,range) values('市场部','S-SA99','其他','')
insert into qc_product_delay_code (departmant,delay_code,description,range) values('IQC','Q-IQC01','原材料品质问题','(1)原材料品质问题,IQC未依规定时间处理或处理不当造成之延误(2)原材料混料(3)材料超出使用期限')
insert into qc_product_delay_code (departmant,delay_code,description,range) values('IQC','Q-IQC02','材料检验不及时','IQC未依规定时间检验材料所造成之延误')
insert into qc_product_delay_code (departmant,delay_code,description,range) values('IQC','Q-IQC03','其他部门支援工时','其他部们支援IQC之工时')
insert into qc_product_delay_code (departmant,delay_code,description,range) values('IQC','Q-IQC04','支援其他部门工时','IQC支援其他部们之工时')
insert into qc_product_delay_code (departmant,delay_code,description,range) values('IQC','Q-IQC99','其他','')

select productDate,QCCheckProjectID,c.name from  product_main left join QCCheckRecord on parent_id=product_main.id
 left join QCCheckProject c on QCCheckRecord.QCCheckProjectID=c.id
 where productDate='2016-06-20'and QCCheckProjectID<>'P01'order by priority desc


select groupid,pono,productDate, COUNT(*) allNum,sum(case when QCCheckProjectID<>'P01' then 1 else 0 end) badNum,QCCheckProjectID,c.name from  product_main left join QCCheckRecord on parent_id=product_main.id
 left join QCCheckProject c on QCCheckRecord.QCCheckProjectID=c.id
 where productDate=$P{PproductDate} and pono=$P{Ppono} and groupid=$P{Pgrouid}
 group by productDate,groupid,pono,QCCheckProjectID,c.name
 order by groupid

select * from QCCheckProject
delete from QCCheckProject where id like '%pc%'

select productDate,QCCheckProjectID,c.name from  product_main left join QCCheckRecord on parent_id=product_main.id
 left join QCCheckProject c on QCCheckRecord.QCCheckProjectID=c.id
 where productDate=$P{PproductDate}

 
 