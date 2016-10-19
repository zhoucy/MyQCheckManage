<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta charset="utf-8">
<title>QC报表管理</title>
<link href="${ctx}/css/main.css" rel="stylesheet" type="text/css">
<link href="${ctx}/css/style.css" rel="stylesheet" type="text/css">
<link href="${ctx}/css/qccheck.css" rel="stylesheet" type="text/css">
<link href="${ctx}/css/Third-party-configuration.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="${ctx}/css/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="${ctx}/css/jquery.multiselect.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/css/jquery.ptTimeSelect.css" />

<script src="${ctx}/js/jquery.js"></script>
<script src="${ctx}/js/jquery-ui.js"></script>
<script src="${ctx}/js/jquery.ui.widget.js"></script> 
<script src="${ctx}/js/jquery.multiselect.js"></script>

<script type="text/javascript" src="${ctx}/js/jquery.ptTimeSelect.js"></script>
<script src="${ctx}/js/jquery.validate.min.js"></script>
<script src="${ctx}/js/dateBoard.js" charset="utf-8"></script>

<script  type="text/javascript" >
 var message='<%=request.getAttribute("message")%>';
  var groupid='<%=request.getAttribute("groupid")%>';
  var id='<%=request.getAttribute("id")%>';
  
  var  progressList=<%=request.getAttribute("progressList")%>;
  
  var i=0;
 var failurl;
$(document).ready(function() {

	if(message!='null'){
	 	alert(message);
 	 }
 	 
 	   //初始化订单选择框列表 
     $.ajax({
		type: "POST",
		url: "getDatePono.do",
		data:{groupid:groupid,progress:""},
		async : false,
		dataType:"json",
		success: function(data){
			var productMain=data;
			var selObj = $("#parampono");
			selObj.empty();
			selObj.append("<option value=''>合并显示</option>");
			for(var i=0;i<data.length;i++){
				var value=productMain[i].id;
				var text=productMain[i].pono;	
				var progress=productMain[i].qcprogress.progressName;
				selObj.append("<option value='"+value+"'>"+text+"+"+progress+"</option>");
			}
			
		}
	});
 	 //时间插件方法
 	 $("#hourperiod").multiselect({

        noneSelectedText: "==请选择==",
        checkAllText: "全选",
        uncheckAllText: '全不选',
        selectedList:4
    }, function(){   //回调函数  
        if($("[name='hourperiod']:checked").length > 0)  
        {  
            $("#errRed").empty();  
        }  
        else  
        {  
            $("#errRed").text("请选择");  
        }  
    });   
	
      queryByPage(groupid,id,progressList);//初始化页面
   	  setInterval("queryByPage(groupid,id,progressList)",30000);//30秒刷新
 	   $('#sample1 input').ptTimeSelect();//初始化时间插件
   
 
  });
   $(function () {
   //验证失败工时表单并提交
        $("#failHourForm").validate({
            rules: {
                
                failureStartHour: "required",
                failureEndHour: "required",
                useWorkers: "required",
                failureReason: "required",
                leadPerson:"required",
            },
            messages: {
                failureStartHour: {
                    required: "请填写失败工时起！"
                },
                failureEndHour: {
                    required: "请填写失败工时止"
                },
                useWorkers: {
                    required: "请填写影响人数！"
                },
                failureReason: {
                    required: "请填写失败原因！"
                },
                leadPerson: {
                    required: "请填写失败原因！"
                }
            },
            onfocus: true,
            onkeyup: false,//这个地方要注意，修改去控制器验证的事件。
         	submitHandler : function(){
         	
              $.ajax({
                            type: "POST",
							url: failurl,
							dataType:"json",
							data:$('#failHourForm').serialize(),
							success: function(data){
							
								if(data!="" && data.message=="success"){
								 alert("成功添加");
								 $("#failHourForm").fadeOut("fast");
								  location.reload();
								}else{
								alert(data.message);
								}
								
							},
                           error:function(){
                                  alert("添加失败");
								 
                            },
                                
               } );   //confirm
		}
	});
});
 

   $(function () {
        $("#packageNumForm").validate({
            rules: {
                
                packageNum: "required",
                
            },
            messages: {
                packageNum: {
                    required: "请填写包装数！"
                }
               
            },
            onfocus: true,
            onkeyup: false,//这个地方要注意，修改去控制器验证的事件。
         	submitHandler : function(){
         	
              $.ajax({
                            type: "POST",
							url: "addWorkersDetail.do?groupid="+$("#groupid").val(),
							dataType:"json",
							data:$('#packageNumForm').serialize(),
							success: function(data){
							if(data!="" && data.message=="success"){
								 alert("成功添加");
								 
								 $("#workDetailForm").fadeOut("fast");
								  queryByPage();
							}else{
								alert(data.message);
							}
							},
                           error:function(){
                                  alert("添加失败");
								  
                            },
                                
               } );   //confirm
		}
	});
});
   $(function () {
 
        $("#workDetailForm").validate({
            rules: {
                workspono:"required",
                hourperiod:"required",
                workerAmount: "required",
                workMinute: "required",
                getWorkers:"check1",
                borrowWorkers:"check2"
            },
            messages: {
                workspono: {
                    required: "请填写PONO！"
                },
                hourperiod: {
                    required: "请填写时间段"
                },
                workerAmount: {
                    required: "请填写员工人数！"
                },
                workMinute: {
                    required: "请填写工作时间"
                }
               
                
            },
            onfocus: true,
            onkeyup: false,//这个地方要注意，修改去控制器验证的事件。
         	submitHandler : function(){
              $.ajax({
                        type: "POST",
						url: "addWorkersDetail.do",
						dataType:"json",
						data:$('#workDetailForm').serialize(),
						success: function(data){
						if(data!="" && data=="success"){
								 alert("成功添加");
								
								 $("#workDetailForm").fadeOut("fast");
								  location.reload();
							}else{
								alert(data);
							}
					    },
                        error:function(){
                         	alert("添加失败");
							 queryByPage();
                          },
                                
               } );   //confirm
		}
	});
});
//添加自定义验证信息
$.validator.addMethod("check1",function(value,element,params){
if($("#getWorkers").val()==""&&$("#getWorkersGroup").val()==""
 && $("#getWorkersM").val()==""){
return true;
}else if(($("#getWorkers").val()!=""&&$("#getWorkersGroup").val()!="" 
&& $("#getWorkersM").val()!="")||$("#getWorkers").val()=="0"){
return true;}
else return false;

},"确认借入信息");
$.validator.addMethod("check2",function(value,element,params){
if($("#borrowWorkersGroup").val()==""&&$("#borrowWorkersM").val()=="" 
&& $("#borrowWorkers").val()==""){
return true;
}else if(($("#borrowWorkersGroup").val()!=""&&$("#borrowWorkersM").val()!="" 
&& $("#borrowWorkers").val()!="")|| $("#borrowWorkers").val()=="0"){
return true;}
else return false;

},"确认借出信息");

</script>


</head>

<body>


	<!--主体部分-->
	<div class="g-main-body" id="dateBoard">

		<div class="Store-M-main">
		
		 <div class="blank20"></div>
		
             	<div class="report-main">
             	 <div class="report-title" >生&nbsp;产&nbsp;日&nbsp;报 </div>
             	  <div class="blank20"></div>
        		<input type="hidden" id="groupid" >
              	<span class="report-span" >日期：</span>
             	 <span class="report-span" id="productDate">${data.main.productDate }</span>
             	 <span class="report-span">当前生产型号：</span>
             	 <span class="report-span" id="model">${main.model }</span>
             	 <span class="report-span">当前生产订单：</span>
             	 <span class="report-span" id="pono">${main.pono }</span>
             	 <span class="report-span">订单数量：</span>
             	  <span class="report-span" id="order_number">${main.pono }</span>
             	 <select type="text" id="parampono"  name="pono" class="input-1p Wdate left " 
             	         onchange="queryByPage();">
        	    </select>
             	  <div class="blank20"></div>
             	 <span class="report-span">组别：</span>
             	 <span class="report-span" id="departmentid">${main.groupid }</span>
             	
             	 <span class="report-span">当前产品类型：</span>
             	 <span class="report-span" id="prodectType">${main.prodectType }</span>
             	 <span class="report-span">当前产品工序：</span>
             	 <span class="report-span" id="progress">${main.prodectType }</span>
             	 <span class="report-span">累计订单产量：</span>
             	 <span class="report-span" id="allPonoNum">${main.pono }</span>
             	  	
				<div class="blank20"></div>
				<div class="list-main">
            	<table class="reporttable" >
            		<thead>
						<tr height="40px">
							<th width="10%" rowspan="2" >时间段</th>
						    <th width="8%" colspan="4">上午时段</th>
						    <th width="8%" colspan="4">下午时段</th>
						    <th width="8%" colspan="3">加班时段</th>
						    <th width="8%" rowspan="2">合计</th>
						</tr>
						<tr height="40px">
							
						    <th width="7%">1</th>
						    <th width="7%">2</th>
						    <th width="7%">3</th>
						    <th width="7%">4</th>
						    <th width="7%">5</th>
						    <th width="7%">6</th>
						    <th width="7%">7</th>
						    <th width="7%">8</th>
						    <th width="7%">9</th>
						    <th width="7%">10</th>
						    <th width="7%">11</th>
						 
						</tr>
						<tr height="40px" id="standard_product">
							
						    <td width="7%" >标准产能</td>
						    <td width="7%" >${main.standardProduct }</td>
						    <td width="7%">${main.standardProduct }</td>
						    <td width="7%" >${main.standardProduct }</td>
						    <td width="7%">${main.standardProduct }</td>
						    <td width="7%" >${main.standardProduct }</td>
						    <td width="7%">${main.standardProduct }</td>
						    <td width="7%" >${main.standardProduct }</td>
						    <td width="7%">${main.standardProduct }</td>
						    <td width="7%" >${main.standardProduct }</td>
						    <td width="7%">${main.standardProduct }</td>
						    <td width="7%" >${main.standardProduct }</td>
						    <td width="7%" ></td>
						 
						</tr>
					</thead>
					<tbody id="record">
			 		 	<c:forEach items="${data.sumRecord}" var="sumRecord"  >
							<tr>
							
							<td>${sumRecord[0]}</td>
							<td>${sumRecord[1]}</td>
							<td>${sumRecord[2]}</td>
							<td>${sumRecord[3]}</td>
							<td>${sumRecord[4]}</td>
							<td>${sumRecord[5]}</td>
							<td>${sumRecord[6]}</td>
							<td>${sumRecord[7]}</td>
							<td>${sumRecord[8]}</td>
							<td>${sumRecord[9]}</td>
							<td>${sumRecord[10]}</td>
							<td>${sumRecord[11]}</td>
						
							<td></td>
							</tr>
							</c:forEach>  
					</tbody>
				</table>
				</div>
				<div class="blank20"></div>
            	 <div class="a-btn-1 ">
					<input type="button" value="添加人员调动" onclick="addWorkDetail()">
					<input type="button" value="添加包装数" onclick="addPackageNum()">
				</div>
				<div class="blank20"></div>
				<span class="report-span">失败工时</span>
				<div class="list-main">
				<table class="reporttable">
            		<thead>
						<tr height="40px">
							<th width="20%" colspan="2" >失败工时（时间段）起止</th>
						    <th width="8%" >分钟数</th>
						    <th width="8%" >影响人数</th>
						    <th width="10%" >影响合计工时</th>
						   	<th width="15%" >失败代码</th>
						    <th width="8%" >责任方</th>
						    <th width="10%" >解决方式</th>
						    <th width="15%" >备注</th>
						    <th width="15%" >操作</th>
						</tr>
						
					</thead>
					<tbody id="failBody">
					 <c:forEach items="${failList}" var="fail"  >
						<tr>
						<td>${fail.failureStartHour }</td>
						<td>${fail.failureEndHour }</td>
						<td>${fail.failureCountHours }</td>
						<td>${fail.useWorkers }</td>
						<td>${fail.useSumHours }</td>
						<td>${fail.failureReason }</td>
						<td>${fail.leadPerson }</td>
						<td>${fail.solution }</td>
						<td>${fail.solution }</td>
						
						</tr>
						</c:forEach> 
					</tbody>
				</table>
             </div>
             
             <div class="blank20"></div>
            	 <div class="a-btn-1 ">
					<input type="button" value="添加失败工时" onclick="failAdd()">
				</div>
           	     <div class="clear"></div>
				</div>
				<div class="clear"></div>
			</div>
</div>
			<div class="" style="clear: both;"></div>
	
	<div class="g-footer">Copyright ©港电电器 电子产品首选 地址:廣東東莞石排鎮交警大隊對面
		联系邮箱: zhoucy@kongelectric.com</div>
<!-- <form name="packageNumForm" id="packageNumForm" method="post">
  弹出添加包装数窗口
    <div id="addPackageNum">
        <div class="row1">
	     添加包装数量<a href="javascript:void(0)" title="关闭窗口" class="close_btn" id="closeBtn" onclick="close()">×</a>
        </div>
        <div class="blank20"></div>
        <div class="margin-left30">	
          <input type="hidden" id="packid"  name="parentId" class="input-1p Wdate left width150" readonly="readonly"/>
           
        <label class="label-1 left width85">PONO： </label> 
              <input type="text" id="packpono"  name="pono" class="input-1p Wdate left width150" readonly="readonly"/>
        
         <label class="label-1 left width85">产品型号： </label> 
              <input type="text" id="packmodel"  name="model" class="input-1p Wdate left width150" readonly="readonly"/>
        <div class="blank20"></div>
         <label class="label-1 left width85">时间段： </label> 
        <select name="hourperiod" id="hourPeriod" class="input-1p Wdate left width150" multiple="true"  >
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
							<option value="11">11</option>
		</select>
        <label class="label-1 left width85">包装数： </label> 
        <input type="text" id="packageNum"  name="packageNum" class="input-1p Wdate left width150" />
    	<div class="blank20"></div>
		<div class="a-btn-1 left margin-left82">
            <input type="submit" id="addPackage" value="确定">
            <input type="button" id="modifyreset"  value="取消">
        </div>
   	 </div>
   	 </div>
 </form> -->
	<form name="failHourForm" id="failHourForm" method="post">
  <!--弹出添加失败工时窗口 -->
    <div id="addFailHour">
        <div class="row1">
           添加失败工时<a href="javascript:void(0)" title="关闭窗口" class="close_btn" id="closeBtn" onclick="close()">×</a>
        </div>
        <div class="blank20"></div>
        <div class="margin-left30">
                <input type="hidden" id="txtid"  name="parentId" class="input-1p Wdate left width150" readonly="readonly"/>
                <input type="hidden" id="failid"  name="id" class="input-1p Wdate left width150" readonly="readonly"/>
           
        <label class="label-1 left width85">PONO： </label> 
              <select type="text" id="txtpono"  name="pono" class="input-1p Wdate left width150" readonly="readonly"/>
        	  </select>
       
        <div class="blank20"></div>
        <div id="sample1"  >
        <label class="label-1 left width85">失败工时起： </label> 
              <input type="text" id="failure_start_time"  name="failureStartHour" class="input-1p Wdate left width150" />
    
         <label class="label-1 left width85">失败工时止： </label> 
              <input type="text" id="failure_end_time"  name="failureEndHour" class="input-1p Wdate left width150"/>
          </div>
        <div class="blank20"></div>
     	 <!--  <label class="label-1 left">小时数： </label> 
         <input type="text" id="failure_count_times"  name="failureCountHours" class="input-1p Wdate left width150"/>
         --> 
         <label class="label-1 left width85">影响人数： </label> 
              <input type="text" id="use_workers"  name="useWorkers" class="input-1p Wdate left width150"/>
     	<!-- 
         <label class="label-1 left width85">影响合计工时： </label> 
              <input type="text" id="use_sum_times"  name="useSumHours" class="input-1p Wdate left width150"/>
           --> 
         <label class="label-1 left width85">失败代码： </label> 
         <!--   	<input id="tags" name="failureReason" class="input-1p Wdate left width150"> -->
			<select name="failureReason" id="failureReason" class="input-1p Wdate left width150" onchange="getdepartment()">
							
						</select>  
        <div class="blank20"></div>
         <label class="label-1 left width85">责任方： </label> 
              <input type="text" id="lead_person"  name="leadPerson" class="input-1p Wdate left width150"/>
           
         <label class="label-1 left width85">解决方式： </label> 
              <input type="text" id="solution"  name="solution" class="input-1p Wdate left width150"/>
        <div class="blank20"></div>
           
         <label class="label-1 left width85">备注： </label> 
              <input type="text" id="remark"  name="remark" class="input-1p Wdate left width150"/>
           <div class="blank20"></div>
        <div class="a-btn-1 left margin-left82">
            <input type="submit" id="modifySub" value="确定">
            <input type="button" id="modifyreset"  value="取消">
        </div>
   	 </div>
    </div>
 </form>
	<form name="workDetailForm" id="workDetailForm" method="post">
  <!--弹出添加人员调动窗口 -->
    <div id="addWorks">
        <div class="row1">
           添加人员调动<a href="javascript:void(0)" title="关闭窗口" class="close_btn" id="closeBtn" onclick="close()">×</a>
        </div>
        <div class="blank20"></div>
        <div class="margin-left30">
           
                <input type="hidden" id="worksid"  name="parentId" class="input-1p Wdate left width150" readonly="readonly"/>
           
        <label class="label-1 left width85">PONO： </label> 
              <select type="text" id="workspono"  name="workspono" class="input-1p Wdate left width150" >
        	  </select>
         
      
        <label class="label-1 left width85">时间段： </label> 
         <select name="hourperiod" id="hourperiod" class="width150" multiple="multiple">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
							<option value="11">11</option>
		</select> <font color="red" id="errRed"></font> 
     	 <div class="blank20"></div>
       <label class="label-1 left width85">员工人数：</label> 
       		  <input type="hidden" id="oldWorker"  name="oldWorker" class="input-1p Wdate left width150" />
       		  <input type="hidden" id="oldStandardProd"  name="oldStandardProd" /> 
              <input type="text" id="workerAmount"  name="workerAmount" class="input-1p Wdate left width150" />
         <label class="label-1 left width-100">工作时间(分钟): </label> 
              <input type="text" id="workMinute"  name="workMinute" class="input-1p Wdate left width150" value="60"/>
        <div class="blank20"></div>
     	 <!--  <label class="label-1 left">小时数： </label> 
         <input type="text" id="failure_count_times"  name="failureCountHours" class="input-1p Wdate left width150"/>
         --> 
         <label class="label-1 left width-100">借入员工人数： </label> 
              <input type="text" id="getWorkers"  name="getWorkers" class="input-1p Wdate left width150"/>
     	<!-- 
         <label class="label-1 left width85">影响合计工时： </label> 
              <input type="text" id="use_sum_times"  name="useSumHours" class="input-1p Wdate left width150"/>
           --> 
           <label class="label-1 left width-100">借出员工人数： </label> 
              <input type="text" id="borrowWorkers"  name="borrowWorkers" class="input-1p Wdate left width150"/>
         
        <div class="blank20"></div>
           
         <label class="label-1 left width-100">借入员工组别： </label> 
		<select name="getWorkersGroup" id="getWorkersGroup" class="input-1p Wdate left width150">
							<option value="" ></option>
							<c:forEach var="dept" items="${dptList}">
							<option value="${dept.name}" >
								${dept.name}
							</option>
							</c:forEach>
		</select>     
         <label class="label-1 left width-100">借出员工组别： </label> 
         <select name="borrowWorkersGroup" id="borrowWorkersGroup" class="input-1p Wdate left width150">
         					<option value="" ></option>
							<c:forEach var="dept" items="${dptList}">
							<option value="${dept.name}" >
								${dept.name}
							</option>
							</c:forEach>
		</select> 
		
        <div class="blank20"></div>
        <label class="label-1 left width-100">借入分钟数： </label> 
              <input type="text" id="getWorkersM"  name="getWorkersM" class="input-1p Wdate left width150"/>
     	
           <label class="label-1 left width-100">借出分钟数： </label> 
              <input type="text" id="borrowWorkersM"  name="borrowWorkersM" class="input-1p Wdate left width150"/>
         
        <div class="blank20"></div>
        
        <div class="a-btn-1 left margin-left82 ">
            <input type="submit" id="addWorksDetail"value="确定">
            <input type="button" id="modifyreset"  value="取消">
        </div>
   	 </div>
    </div>
    
 </form>
</body>
</html>
