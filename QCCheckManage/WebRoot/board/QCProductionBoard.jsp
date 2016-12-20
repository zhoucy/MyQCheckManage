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
<link rel="stylesheet" type="text/css" href="${ctx}/css/jquery.ptTimeSelect.css" />

<script src="${ctx}/js/jquery.js"></script>
<script src="${ctx}/js/jquery-ui.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery.ptTimeSelect.js"></script>
<script src="${ctx}/js/dateBoard.js" charset="utf-8"></script>
<script  type="text/javascript" >

$(document).ready(function() { 
	
      //初始化列表 
      queryProduction();
 
 	  setInterval("queryProduction()",30000);
 	  
 
  });
  
  var  queryProduction=function(){
		
		
		$("#record tr").remove();          
	    var datas={belongid:$("#belongid").val(),};
	     $.ajax({      
	    		type: "post",        
				url: "${ctx}/qc/getProductionBoard.do",
				data:datas,
	    		dataType: "json",   /*这句可用可不用，没有影响*/     		 
	    		//contentType: "application/json; charset=utf-8",      
	    		success: function (data) {             
	    			var array=data;
	    			var now=new Date();
	    			var myDate = now.toLocaleDateString();
	    			console.log(JSON.stringify(data));
	    			$("#productDate").html(myDate);
	    			var record=$("#record"); 
	    			if(array!=null&array.length>0){
	    				for(var i=0;i<array.length;i++){
	    				    var targetrate=100*(array[i].standardHour/array[i].nowHour);
	    				    //达标率不同区间不同颜色
	    				    if(targetrate>=90){
	    				       var tr=$("<tr style='color: green'></tr>");
	    				    }else{
	    				       var tr=$("<tr style='color: red'></tr>"); 
	    				    }	    					
	    					var td1=$("<td>"+array[i].pono+"</td>");
	    					var td2=$("<td>"+array[i].model+"</td>");
	    					var temp=array[i].pre_shipment_date;
	    					if(temp){
	    					  var td10=$("<td>"+temp+"</td>");
	    					}else{
	    					  var td10=$("<td>未填写</td>");
	    					}   					
	    					var td3=$("<td>"+array[i].order_number+"</td>"); 
	    					var td8=$("<td>"+array[i].allProduction+"</td>"); 
	    					var td9=$("<td>"+(array[i].order_number-array[i].allProduction)+"</td>"); 
	    					var td4=$("<td>"+array[i].groupid+"</td>");
	    					var td5=$("<td>"+array[i].nowProduction+"</td>"); 
	    					var td6=$("<td>"+array[i].standardHour+"</td>"); 
	    					var td7=$("<td>"+array[i].nowHour+"</td>");
	    				    var td11=$("<td>"+targetrate.toFixed(0)+"%</td>");
	    					
	    					
	    					tr.append(td4).append(td1).append(td2).append(td10).append(td3).append(td8).append(td9).append(td5).
	    					append(td6).append(td7).append(td11);
	    					tr.appendTo(record);  
	    				
	    				}
	    			
	    			}   
	    		},      
	    		error: function (XMLHttpRequest, textStatus, errorThrown) {     
	    		alert(errorThrown);     
	    		}     
		 });  
		 };


</script>


</head>

<body>


	<!--主体部分-->
	<div class="g-main-body" id="dateBoard">

		<div class="Store-M-main">
		
		 <div class="blank20"></div>
		
             	<div class="report-main">
             	 <div class="report-title" >组&nbsp;装&nbsp;产&nbsp;能&nbsp;看&nbsp;板 </div>
             	  <div class="blank20"></div>
             	  	<span class="report-span" >当前日期：</span>                   
             	 <span class="report-span" id="productDate" ></span>
             	    <span class="report-span" >选择显示区域：</span>
             	 <select id="belongid" name="belongid"  onchange="queryProduction();">
                            <option value="">全部</option>
                            <option value="12">2楼生产中心</option>
                            <option value="22">3楼生产中心</option>
                            <option value="2">4楼生产中心</option>
                    </select>
             	  <div class="blank20"></div>               
				<div class="list-main">
            	<table class="reporttable">
            		<thead>
						<tr height="40px">
						    <th width="8%" >组别</th>
							<th width="10%" >订单号</th>
						    <th width="8%" >产品型号</th>
						    <th width="9%" >预计出货日期</th>
						    <th width="8%" >订单数量</th>
						    <th width="9%" >订单累计产量</th>
						    <th width="8%" >订单欠数</th>				    
						    <th width="9%" >当前产线产量</th>
						    <th width="8%" >目标工时</th>
						    <th width="8%" >实际工时</th>
						    <th width="8%" >达标率</th>
						</tr>
						
					</thead>
					<tbody id="record">
			 		 	
					</tbody>
				</table>
				</div>
				<div class="blank20"></div>
            	
				<div class="clear"></div>
			</div>
</div>
			<div class="" style="clear: both;"></div>
	
	<div class="g-footer">Copyright ©港电电器 电子产品首选 地址:廣東東莞石排鎮交警大隊對面
		联系邮箱: zhoucy@kongelectric.com</div>
	
</body>
</html>
