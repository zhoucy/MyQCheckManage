<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<c:set var="ctx" value="${pageContext.request.contextPath }" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<jsp:include page="../inc.jsp"></jsp:include>
<meta charset="utf-8">
</head>
<body>
		<table id="dg" title="" class="easyui-datagrid" style="width:auto;height:auto"
			url="${ctx}/qc/getDataByDataType.do" toolbar="#searchtool" pageSize="20"
			pagination="true" fit="true"  striped="true" data-options="onDblClickRow:doubleClick"
			rownumbers="true" fitColumns="true" singleSelect="true">			
		<thead>
			<tr>
			    <th field="name">名称</th>
				<th field="type">类型</th>				
				<th field="create_date"  formatter="formatTimeByMillisecond">创建时间</th>
				<th field="modify_date"  formatter="formatTimeByMillisecond">最后一次修改时间</th>
			</tr>
		</thead>
	    </table>
	 <div id="searchtool" style="padding:5px">  
	    <table>
	        <tr><td>数据类型</td><td>
	             <select class="easyui-combobox" style="width:80px;"
                        data-options="onSelect:dataTypeSelect,panelHeight:'auto'" >
                        <option value="sys.tables" selected="true">表</option> 
                        <option value="sys.views">视图</option>                                             
                        <option value="sys.procedures">存储过程</option>
                        </select></td>
                 <td>显示原字段: <input id="isOriginal" type="checkbox"></td>
                 <td><a href="javascript:void(0)" class="easyui-linkbutton"  onclick="sqltest();">sql测试</a></td>
	        </tr>	    
	    </table>         
    <div> 
    <div id="dlg" class="easyui-dialog" style="left:500px;top:10px;width:1200px;height:600px;"closed="true" 
                   collapsible="true" resizable="true" maximizable="true">
    <table id="pg"></table></div>  
    <div id="sqltestdlg" class="easyui-dialog" style="left:550px;top:60px;width:1200px;height:600px;"closed="true" 
                   collapsible="true" resizable="true" maximizable="true" title="sql测试">
         <label>请输入sql:</label><input class="easyui-textbox" data-options="buttonIcon:'icon-search',buttonText:'测试',onClickButton:test"  style="width:50%">
         <label><span id="sqlmsg" style="color:red"></span></label>
         <table id="sqltestpg"></table>
    </div> 
<script type="text/javascript">
var dataType;
var startTime;
function dataTypeSelect(){
  dataType=$(this).combo('getValue');
  $("#dg").datagrid({queryParams: {dataType: dataType}});
}
function doubleClick(index,row){
  if(dataType=='sys.procedures'){
     alert("无法查看存储过程");
     return ;
  }
  var dataName=row.name;
  var firstPage=1;
  $.ajax({
     type:'post',
     url:'${ctx}/qc/getColumnsByDataName.do',
     data:{dataName:dataName},
     dataType:'json',
     success:function(data,dataType){
        showData(dataName,data,firstPage);
     }
  });
}
function getColumns(data){
    var columns=new Array();
    for(var i=0;i<data.length;i++){
      var column={};
      column["title"] = "" + data[i].name;
      column["field"] = "" + data[i].name; 
      column["align"] = "center"; 
      columns.push(column);
    }
    return columns;
}
function getTranslateColumns(dataName,data){
    var columns=new Array();
    var DD=getDD();
    for(var i=0;i<data.length;i++){
      var column={};
      var field=data[i].name;
      var title="<span style='color:red'>"+field+"</span>";
      if(DD.hasOwnProperty(dataName)){
         var DDD=DD[dataName];
         if(DDD.hasOwnProperty(field)){
            title=DDD[field];
         }
      }     
      column["title"] = "" + title;
      column["field"] = "" + field; 
      column["align"] = "center"; 
      columns.push(column);
    }
    return columns;
}
function showData(dataName,data,firstPage){
   var isOriginal=$("#isOriginal").is(":checked");
   var columns;
   if(isOriginal){
      columns=getColumns(data);
   }else{
      columns=getTranslateColumns(dataName,data);
   }   
   $('#dlg').dialog('open').dialog('setTitle','数据预览');
   $('#pg').datagrid({  
                 fit:true, 
                 pagination:true,
                 pageSize:20,
                 pageNumber:firstPage,
                 url:'${ctx}/qc/getDataDetails.do', 
                 queryParams:{dataName:dataName},                   
                 columns:[[{
                    colspan : columns.length,  
                    title : "表或者视图中的数据"
                 }],columns],
                 onBeforeLoad:function(param){
                    //param指的是提交表单时的参数
                    startTime=new Date();
                 },
                 onLoadSuccess:function(rows){
                     if(rows.total==0){
		                var body = $(this).data().datagrid.dc.body2;
                        body.find('table tbody').append(
                         '<div style="width:1200px;text-align:center;color:red">没有相关记录！</div>');
                        }
                        var endTime=new Date();
                        var p = $(this).datagrid('getPager');                       
                        var msg="<div>本次查询花费时间:<span style='color:red'>"+(endTime-startTime)+"</span>ms</div>";
                        p.pagination({'buttons':msg});
                 }
                 }); 
    
}
function formatTimeByMillisecond(value, row, index) {
	if (value != undefined) {
	    value = parseInt(value);
	    var temp = new Date(value);
	    var year=temp.getFullYear();
	    var month=temp.getMonth() < 9 ? "0" + (temp.getMonth()+1) : (temp.getMonth()+1);
	    var day=temp.getDate() < 10 ? "0" + temp.getDate() : temp.getDate();
	    var hour=temp.getHours()<10?"0"+temp.getHours():temp.getHours();
	    var minute=temp.getMinutes() < 10 ? "0"+temp.getMinutes():temp.getMinutes();
	    var second=temp.getSeconds()<10?"0"+temp.getSeconds():temp.getSeconds();
	    var time=year+"-"+month+"-"+day+" "+hour+":"+minute+":"+second;
	    return time;
	}
}
function sqltest(){
   $("#sqltestdlg").dialog('open');  
}
function test(){
  var sql=$(this).textbox("getText");
  var b1=sql.indexOf("delete")==0?false:true;
  var b2=sql.indexOf("update")==0?false:true;
  var b3=sql.indexOf("insert")==0?false:true;
  var b4=sql.indexOf("create")==0?false:true;
  var b5=sql.indexOf("alter")==0?false:true;
  var b6=sql.indexOf("drop")==0?false:true;
  if(b1&&b2&&b3&&b4&&b5&&b6){
     $.ajax({
       type:'post',
       url:'${ctx}/qc/getDataBySql.do',
       data:{sqlStr:sql},
       dataType:'json',
       success:function(data,dataType){
          showSqlTest(data);
       }
    });
  }else{
     alert("只能输入查询语句!");
  }
}
function showSqlTest(data){
   if(data.length==0){
       alert("查询结果为空,或者您输入的sql语句有错误");
   }else{
       var columns=new Array();
       var oneLine=data[0];
       for(var key in oneLine){
          var column={};
          column["title"] = "" + key;
          column["field"] = "" + key; 
          column["align"] = "center"; 
          columns.push(column);
       }
       $('#sqltestpg').datagrid({  
                 fit:true, 
                 rownumbers:true,                           
                 columns:[columns],
                 onBeforeLoad:function(param){
                    //param指的是提交表单时的参数
                    startTime=new Date();
                 },
                 onLoadSuccess:function(rows){
                        var endTime=new Date();
                        var msg='本次查询花费时间'+(endTime-startTime)+'ms';
                        $("#sqlmsg").text(msg);
                 }
                 }).datagrid("loadData", data);
   }
}
//数据字典:表名,字段,字段解释
function getDD(){
    //刷卡系统所需的6张表:dbo.CardInfo                自定义的table:swipedata
    //dbo.CmdInfo                                            swipecard
    //dbo.ErrorInfo                                          swipemachine
    //dbo.List
    //dbo.ListInfo
    //dbo.SystemLog
   var DD={
            CardInfo:{CID:"ID",CSN:"流水号",GID:"组号",DID:"机号",DataType:"数据类型",SerialDate:"日期",Info:"卡号"},//刷卡系统所需的表,刷卡数据信息表
            CmdInfo:{CID:"ID",IsDsp1:"是否显示第1行",IsDsp2:"是否显示第2行",IsDsp3:"是否显示第3行",IsDsp4:"是否显示第4行",Dsp1:"第一行内容",
                                             Dsp2:"第2行内容",Dsp3:"第3行内容",Dsp4:"第4行内容",Soundval:"发声次数"},//刷卡系统所需的表,命令信息表
            department:{id:"ID",code:"部门编号",name:"部门名称",leader:"leader",belong:"归属",remarks:"备注"},//部门表
            ErrorInfo:{EID:"EID",CSN:"流水号",GID:"组别ID",DrvSnr:"DrvSnr",CmdType:"cmd类型",Info:"信息",ErrorTime:"时间"},//刷卡系统所需的表,错误信息表
            List:{LID:"LID",CSN:"流水号",DID:"卡机号",CmdType:"cmd类型",CmdContent:"cmd内容",GID:"卡机组别"},//刷卡系统所需的表,
            ListInfo:{GID:"卡机组别",GName:"卡机组别名称",GWName:"GWName"},//刷卡系统所需的表,
            product_main:{id:"ID",productDate:"生成日期",pono:"订单号",model:"model",sumWorker:"人数",targetProduct:"目标产能/小时",standardProduct:"标准产能/小时",groupid:"组别id",prodectType:"产品类型",
                                             progress:"流程",productTime:"开始时间",endTime:"结束时间",productid:"产品类型id"},//生产信息表
            qc_date_temp:{month:"天数/月"},
            qc_employee:{id:"ID",employeeNo:"工号",employeeName:"雇员姓名",password:"密码",sex:"性别",birthday:"出生日期",identityNo:"身份证件号",address:"地址",mobile:"手机",QQ:"QQ",Email:"电子邮箱",
                                             positionId:"职位id",positionName:"职称",photoSrc:"图片",positionStatus:"状态",entryDate:"入职日期",leaveDate:"离职日期",isDel:"是否显示",deptId:"部门编号",
                                             company:"公司名称",isLogin:"允许登陆",others:"备注",leaveReason:"离职原因"},//雇员信息表
            qc_fail_detail:{id:"ID",parent_id:"parent_id",failure_start_hour:"开始时间",failure_end_hour:"结束时间",failure_count_hours:"分钟",use_workers:"人数",use_sum_hours:"工时",failure_reason:"原因",
                                             lead_person:"责任单位",solution:"解决办法",remark:"备注"},//失败工时
            qc_permission:{id:"ID",name:"名称",fatherid:"fatherid",url:"url"},//权限
            qc_plan_production:{id:"ID",pono:"订单号",model:"model",product_specific:"啥意思",order_number:"订单数量",finish_number:"完成数量",pre_product_date:"预定生成日期",product_status:"状态",
                                             pre_shipment_date:"出厂日期",product_id:"产品类型id",packbarcode:"包装条形码",boxbarcode:"箱条形码",lastUpUser:"最后一次操作用户"},
            qc_product_delay_code:{id:"ID",departmant:"责任划分",delay_code:"编码",description:"描述",range:"适用范围"},//生产计划
            qc_product_record:{id:"ID",model:"model",product_specific:"啥意思",product_type:"产品类型",material_code:"物料编码"},//产品型号
            qc_product_type:{id:"ID",product_no:"产品类型编码",product_name:"产品类型名称"},//产品类型
            qc_progress:{id:"ID",progress_code:"流程编码",progress_name:"流程名称"},//流程
            qc_progress_man_hour:{id:"ID",model:"model",progressid:"流程ID",man_minute:"分钟",man_hour:"小时",balance:"平衡",product_id:"产品类型ID"},
            qc_role:{id:"ID",name:"角色",permissionID:"权限ID"},//角色
            qc_worker_detail:{id:"ID",parent_id:"parent_id",hourPeriod:"小时",worker_amount:"人数",get_workers:"借入人数",get_workers_group:"借入组别",borrow_workers:"借出人数",borrow_workers_group:"借出组别",borrow_workers_m:"借出分钟",
                                             get_workers_m:"借入分钟",work_minute:"工作分钟",packageNum:"打包数",standardProduct:"标准产量"},//借入借出人员
            qc_worktime:{id:"ID",groupid:"部门id",belongid:"部门归属id",S1:"小时1起",S2:"小时2起",S3:"小时3起",S4:"小时4起",S5:"小时5起",S6:"小时6起",S7:"小时7起",S8:"小时8起",S9:"小时9起",S10:"小时10起",S11:"小时11起",S12:"小时12起",
                                             E1:"小时1止",E2:"小时2止",E3:"小时3止",E4:"小时4止",E5:"小时5止",E6:"小时6止",E7:"小时7止",E8:"小时8止",E9:"小时9止",E10:"小时10止",E11:"小时11止",E12:"小时12止"},//时间
            QCbadProduct:{productDate:"日期",pono:"订单号",model:"model",sumWorker:"人数",targetProduct:"目标产量",standardProduct:"标准产量",groupid:"组别",failure_start_time:"开始时间",failure_end_time:"结束时间",
                                             failure_count_times:"分钟数",use_workers:"人数",use_sum_times:"工时",failure_reason:"原因",lead_person:"拉长",solution:"解决方案",prodectType:"产品类型"},//失败记录
            QCCheckProject:{id:"ID",name:"坏项名称",priority:"优先级",barcodeimg:"条形码"},//坏项表
            QCCheckProjectTemp:{QCCheckProjectID:"QCCheckProjectID"},//坏项临时表
            QCCheckRecord:{QCCheckProjectID:"项目ID",id:"ID",parent_id:"parent_id",insertDate:"录入时间"},//qc记录时间
            QCGRoup:{id:"ID",name:"组别名称",line_supervisor:"组长?",group_lead:"拉长?"},//组别表
            QCUser:{id:"ID",name:"用户名",password:"用户密码",groupid:"部门id",departmentid:"部门id"},//部门表
            report_temp:{id:"ID",productDate:"日期",pono:"订单号",model:"model",sumWorker:"人数",targetProduct:"目标产量",standardProduct:"标准产量",groupid:"组别id",
                                            prodectType:"产品类型",progress:"流程",QCCheckProjectID:"项目编码",insertDate:"录入时间",productTime:"生产时间",endTime:"结束时间"},//qc记录时间与其关联的信息
            swipecard:{cnum:"卡号",cpono:"订单号",cposition:"下个工位",cserialnum:"序列号",cgroupid:"组别id",cgroupname:"组别名称",csequence:"顺序",cgid:"卡机组别"},//卡信息表
            swipedata:{dataid:"ID",serialnum:"序列号",groupid:"组别id",groupname:"组别名称",pono:"订单",position:"工位",swipetime:"刷卡时间",dbtime:"录入数据库的时间",swipedate:"刷卡时间",
                                            qcid:"qc结果",CSN:"流水号",GID:"组别id",DID:"DID",DataType:"数据类型",SerialDate:"时间",Info:"卡号",isprint:"是否打印"},//刷卡数据表
            swipemachine:{mgid:"卡机组别",mgroupid:"生产组别id",mgroupname:"组别名称",mpono:"订单号",msequence:"顺序",mprintip:"打印机IP",mprintname:"打印机名称"},//卡机与组别信息表
            SystemLog:{ID:"ID",MiddleWareCode:"MiddleWareCode",LogCsn:"错误日志编号",SystemLogType:"日志类型",EventType:"时间类型",CmdType:"cmd类型",StateValue:"状态值",ErrNo:"错误编号",
                                            ErrMsg:"错误信息",EventTime:"事件时间",GID:"卡机组别",DID:"卡机编号",ViewContent:"视图内容",CmdContent:"cmd内容"},//刷卡系统使用的表,系统日志
            testdata:{},//意义不明
            user_role:{id:"ID",user_id:"用户ID",role_id:"角色ID"},//用户角色中间表
            
             
   };
   return DD;
}
</script>
	<style type="text/css">
		#fm{
			margin:0;
			padding:10px 30px;
		}
		.ftitle{
			font-size:14px;
			font-weight:bold;
			padding:5px 0;
			margin-bottom:10px;
			border-bottom:1px solid #ccc;
		}
		.fitem{
			margin-bottom:5px;
		}
		.fitem label{
			display:inline-block;
			width:80px;
		}
		.fitem input{
			width:160px;
		}
.panel-body {
  border:0;
}
	</style>
</body>
</html>
