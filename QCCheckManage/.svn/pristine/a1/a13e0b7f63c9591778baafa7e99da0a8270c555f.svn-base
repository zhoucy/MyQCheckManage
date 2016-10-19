
var  queryByPage=function(){
var size=progressList.length;
var progress= progressList[i%size];
i++;
if(i>progressList.length){
	i=0;
}
$("#record tr").remove();          
$("#failBody tr").remove(); 

$("#standard_product td").remove();
var id=$("#parampono").val();
if(id!=""){
	progress="";
}
 $.ajax({      
	type: "post",        
	url: "/QCCheckManage/qc/getReportBoard.do",
	data:{groupid:groupid,id:id,progress:progress},
	dataType: "json",   /*这句可用可不用，没有影响*/  
	success: function (data) {             
		var main=data.main;
		var failure=data.failList;
		var sumRecord=data.sumRecord;
		var productNum=data.productNum;
		var workerDetails=data.workerDetails;
		$("#productDate").html(main.productDate);
		$("#model").html(main.model);
		$("#pono").html(main.pono);
		$("#progress").html(main.qcprogress.progressName);
		$("#departmentid").html(main.dpt.name); //组别名称代替id
		$("#order_number").html(productNum.order_number);
		$("#allPonoNum").html(productNum.allPonoNum);
		$("#groupid").val(main.groupid);//隐藏组别id
		$("#prodectType").html(main.prodectType);
		$("#txtid").val(main.id);
		$("#txtpono").val(main.pono);
		$("#txtmodel").val(main.model);
		
		$("#oldWorker").val(main.sumWorker);
		$("#worksid").val(main.id);
		$("#workspono").val(main.pono);
		$("#worksmodel").val(main.model);
		$("#packsid").val(main.id);
		$("#packpono").val(main.pono);
		$("#packmodel").val(main.model);
		$("#oldStandardProd").val(main.standardProduct);
		var standard=$("#standard_product");
		var record=$("#record"); 
		if(sumRecord && sumRecord.length > 0){
			for(var i=0,len=sumRecord.length;i<len;i++){ 
			var tr=$("<tr></tr>"); 
			var tdname=$("<td>"+sumRecord[i].QCCheckProjectID+"</td>");
			var td1=$("<td>"+sumRecord[i].one+"</td>");
			var td2=$("<td>"+sumRecord[i].two+"</td>"); 
			var td3=$("<td>"+sumRecord[i].three+"</td>"); 
			var td4=$("<td>"+sumRecord[i].four+"</td>");
			var td5=$("<td>"+sumRecord[i].five+"</td>"); 
			var td6=$("<td>"+sumRecord[i].six+"</td>"); 
			var td7=$("<td>"+sumRecord[i].seven+"</td>");
			var td8=$("<td>"+sumRecord[i].eight+"</td>"); 
			var td9=$("<td>"+sumRecord[i].nine+"</td>"); 
			var td10=$("<td>"+sumRecord[i].ten+"</td>");
			var td11=$("<td>"+sumRecord[i].eleven+"</td>"); 
			var td12=$("<td>"+sumRecord[i].allNum+"</td>");
			
			tr.append(tdname).append(td1).append(td2).append(td3).append(td4).append(td5).
			append(td6).append(td7).append(td8).append(td9).append(td10).append(td11).append(td12);
			tr.appendTo(record);  
			
			}
		}
		var goodRatetr=$("<tr><td>良品率%</td></tr>"); 
		var arrivedRatetr=$("<tr><td>达成率%</td></tr>"); 
		//计算良品率 循环遍历 达成率和良品率小于98%的标红
		for(var i=1,len=12;i<len;i++){ 
			
		    var bad = record.children().eq(0).children().eq(i);//获取到不良数 
			var good = record.children().eq(1).children().eq(i);//获取到良品数 
			var goodValue=eval(good.text());
			var badValue=eval(bad.text());
			var goodRatetd=0.00;
			//达成率=良品数/标准产能
			var arrivedRatetd=(goodValue*100/main.standardProduct).toFixed(2)
			//良品率=良品数/总检查数
			if((badValue+goodValue)!=0){
				goodRatetd=(goodValue*100/(badValue+goodValue)).toFixed(2)
			}
			var td=$("<td>"+goodRatetd+"</td>");
			var td2=$("<td>"+arrivedRatetd+"</td>");
			goodRatetr.append(td);
			arrivedRatetr.append(td2);
		}
		goodRatetr.append("<td></td>");
		goodRatetr.appendTo(record); 
		arrivedRatetr.append("<td></td>");
		arrivedRatetr.appendTo(record); 
		
		
		if(workerDetails!=null && workerDetails.length>0){
			
			var	tbody7=standard.append($("<td>标准产能</td>"));
			var	tbody1=$("<tr><td>总工时</td></tr>"); 
			var	tbody2=$("<tr><td>借入工时</td></tr>");
			var	tbody3=$("<tr><td>借入组别</td></tr>"); 
			var	tbody4=$("<tr><td>借出工时</td></tr>"); 
			var	tbody5=$("<tr><td>借出组别</td></tr>");
			var sumtd1=0;
			var sumtd2=0;
			var sumtd4=0;
			for(var i=0;i<workerDetails.length;i++){
		
				var allWorkerHour=(((workerDetails[i].workerAmount)/60)+((workerDetails[i].getWorkers)/60)-((workerDetails[i].borrowWorkers)/60)).toFixed(2)
				if(workerDetails[i].standardProduct!=0){
					
					var td7=$("<td>"+workerDetails[i].standardProduct+"</td>");
				
				}else  
					{
					var td7=$("<td>"+main.standardProduct+"</td>");
					var td8=$("<td>"+(sumRecord[1][i+1]*100/main.standardProduct).toFixed(2)+"</td>");
					}
				var getworkers=((workerDetails[i].getWorkers)/60).toFixed(2);
				var borrowworkers=((workerDetails[i].borrowWorkers)/60).toFixed(2);
				var td1=$("<td>"+allWorkerHour+"</td>");
				var td2=$("<td>"+getworkers+"</td>");
				var td3=$("<td>"+workerDetails[i].getWorkersGroup+"</td>");
				var td4=$("<td>"+borrowworkers+"</td>");
				var td5=$("<td>"+workerDetails[i].borrowWorkersGroup+"</td>");
				sumtd1=Number(allWorkerHour)+Number(sumtd1);
				sumtd2=Number(getworkers)+Number(sumtd2);
				sumtd4=Number(borrowworkers)+Number(sumtd4);
			
				 tbody7.append(td7);
				 tbody1.append(td1);
				 tbody2.append(td2);
				 tbody3.append(td3);
				 tbody4.append(td4);
				 tbody5.append(td5);
				} 
			
			tbody7.append("<td></td>");
			tbody2.append("<td>"+sumtd2+"</td>");
			tbody1.append("<td>"+sumtd1+"</td>");
			tbody3.append("<td></td>");
			tbody4.append("<td>"+sumtd4+"</td>");
			tbody5.append("<td></td>");
		
			
			 tbody1.appendTo(record);
			 tbody2.appendTo(record);
			 tbody3.appendTo(record);
			 tbody4.appendTo(record);
			 tbody5.appendTo(record);
	}
		//循环遍历 达成率和良品率小于98%的标红
		for(var i=1,len=12;i<len;i++){  
	    var bad = record.children().eq(0).children().eq(i); 
			if(eval(bad.text())>0) {
			bad.css({ color: 'red' }).css("background-color","yellow");
			}
		var good = record.children().eq(2).children().eq(i); 
			if(eval(good.text())<eval(98)&&eval(good.text())>0) {
			good.css({ color: 'red' });
			}
		var finish = record.children().eq(3).children().eq(i); 
			if(eval(finish.text())<eval(98)&&eval(finish.text())>0) {
			finish.css({ color: 'red' });
			}
		
			}
			
		
		var  failBody=$("#failBody");
		//循环遍历失败工时
		if(failure && failure.length > 0){
				for(var i=0,len=failure.length;i<len;i++){   
				var tr=$("<tr></tr>"); 
				
				var td1=$("<td>"+failure[i].failureStartHour+"</td>");
				var td2=$("<td>"+failure[i].failureEndHour+"</td>"); 
				var td3=$("<td>"+failure[i].failureCountHours+"</td>"); 
				var td4=$("<td>"+failure[i].useWorkers+"</td>");
				var td5=$("<td>"+(failure[i].useSumHours/60).toFixed(2)+"</td>"); 
				var td6=$("<td>"+failure[i].failureReason+"</td>"); 
				var td7=$("<td>"+failure[i].leadPerson+"</td>");
				var td8=$("<td>"+failure[i].solution+"</td>"); 
				var td9=$("<td>"+failure[i].remark+"</td>"); 
				var td10=$("<td> <a href='javascript:delFail(\""+failure[i].id+"\");'>删除</td>");
				/*<a  " +
				"onclick='modifyFail(\""+failure[i].id+"\",\""
				+failure[i].parentId+"\",\""
				+failure[i].failureStartHour+"\",\""
				+failure[i].failureEndHour+"\",\""
				+failure[i].useWorkers+"\",\""
				+failure[i].failureReason+"\",\""
				+failure[i].leadPerson+"\",\""
				+failure[i].solution+"\",\""
				+failure[i].remark+"\");' id='modify'>修改" +
"</a>	*/
				tr.append(td1).append(td2).append(td3).append(td4).append(td5).
				append(td6).append(td7).append(td8).append(td9).append(td10);
				tr.appendTo(failBody);  
				}
			} 
	},
		error: function (XMLHttpRequest, textStatus, errorThrown) {     
		alert(errorThrown);     
		}     
 });  
 };
 
 
 
 
//添加失败工时	
function addFailHours(){
	$.ajax({
			type: "POST",
			url: "addFailHours.do?groupid="+$("#groupid").val(),
			dataType:"json",
			data:$('#failHourForm').serialize(),
			success: function(data){
				alert(data.message);
				location.reload();
				}
		});
}
//添加员工详细
var  addWorkersDetail=function(){
	
	$.ajax({
			type: "POST",
			url: "addWorkersDetail.do?groupid="+$("#groupid").val(),
			dataType:"json",
			data:$('#workDetailForm').serialize(),
			success: function(data){
				alert(data.message);
				location.reload();
				}
		});
	
};
//弹出失败工时添加框
function failAdd(){
//清空表单
	$("#failure_start_time").val('');
	$("#failure_end_time").val("");
	$("#use_workers").val("");
	$("#failureReason").val("");
	$("#lead_person").val("");
	$("#solution").val("");
	$("#remark").val("");
	$("body").append("<div id='mask'></div>");
	$("#mask").addClass("mask").fadeIn("slow");
	$("#addFailHour").fadeIn("slow");
	getDelayCodes();//初始化所有失败原因
	getDatePono();
	failurl="addFailHours.do?groupid="+$("#groupid").val();
}

//删除失败工时
function delFail(failId){
	if(confirm("确定要删除该记录？")){
		var url = "deleteFail.do?failId="+failId;
		$.get(url,function(data){
			if(data=="success"){
				alert("删除成功");
				document.location.reload();
			}else alert(data)
		});
	}
}


//修改失败工时
function modifyFail(id,parentId,failure_start_time,failure_end_time,use_workers,failureReason,lead_person,
		solution,remark){
			        
			failAdd();
			
			$("#failid").val( id );
			$("#txtid").val( parentId );
			$("#failure_start_time").val(failure_start_time);
			$("#failure_end_time").val(failure_end_time);
			$("#use_workers").val(use_workers);
			$("#failureReason").val(failureReason);
			$("#lead_person").val(lead_person);
			$("#solution").val(solution);
			$("#remark").val(remark);
			
					
		}
//弹出员工调入调出添加框
function addWorkDetail(){
	$("body").append("<div id='mask'></div>");
	$("#mask").addClass("mask").fadeIn("slow");
	$("#addWorks").fadeIn("slow");
	getDatePono();
	
}

function getdepartment(){
    var delayCode=$("#failureReason").val();
    
	$.ajax({
		type: "POST",
		url: "getDepartment.do",
		dataType:"json",
		data:{delayCode:$("#failureReason").val()},
		success: function(data){
			
			$("#lead_person").val(data);
			}
			
		});
	}
  

//获取失败原因代码
function getDelayCodes(){
	$.ajax({
		type: "POST",
		url: "getDelayCodes.do",
		dataType:"json",
		success: function(data){
			var delayCodes=data;
			for(var i=0;i<data.length;i++){
				
				 var selObj = $("#failureReason");
				 var value=delayCodes[i][0];
				 var text=delayCodes[i][1];
				
				 selObj.append("<option value='"+value+"'>"+value+","+text+"</option>");
			}
			
			
		   /* $( "#tags" ).autocomplete({
		      source: data
		    });*/
			}
	});
	
} 

//获取当前组别当天所有的单号
function getDatePono(){
	
	$.ajax({
		type: "POST",
		url: "getDatePono.do",
		data:{groupid:$("#groupid").val()},
		dataType:"json",
		success: function(data){
			var productMain=data;
			var selObj = $("#workspono");
			var selObj2 = $("#txtpono");
			selObj.empty();
			selObj2.empty();
			for(var i=0;i<data.length;i++){
				$("#worksid").val(productMain[0].id);
				var value=productMain[i].pono;
				var text=productMain[i].pono;
				var progress=productMain[i].qcprogress.progressName;
				selObj.append("<option value='"+value+"'>"+value+"+"+progress+"</option>");
				selObj2.append("<option value='"+value+"'>"+value+"+"+progress+"</option>");
			}
		}
	});
}  
$(function ($) {
		//弹出框关闭事件
	 	 $(".close_btn").hover(function () { $(this).css({ color: 'black' }); }, function () { $(this).css({ color: '#999' }); }).on('click', function () {
			$("#addFailHour").fadeOut("fast");
			$("#addWorks").fadeOut("fast");
			$("#addPackageNum").fadeOut("fast");
			$("#mask").css({ display: 'none' });
		});
		//取消事件
		$(" #modifyreset").on('click', function () {
			$("#addFailHour").fadeOut("fast");
			$("#addWorks").fadeOut("fast");
			$("#addPackageNum").fadeOut("fast");
			$("#mask").css({ display: 'none' });
			
		});
		$("#workspono").change(function () {
			$.ajax({
				type: "POST",
				url: "getParentId.do",
				data:{pono:$("#workspono").val(),groupid:$("#groupid").val(),productDate:$("#productDate").html()},
				dataType:"json",
				success: function(data){
					var productMain=data;
					 $("#worksid").val(productMain.id);
					
				}
			});
		});
});


var  queryByPage2=function(){
	var size=progressList.length;
	var progress= progressList[i%size];
	i++;
	if(i>progressList.length){
		i=0;
	}
	$("#record tr").remove();          
	$("#failBody tr").remove(); 

	$("#standard_product td").remove();
	var id=$("#parampono").val();
	if(id!=""){
		progress="";
	}
	 $.ajax({      
		type: "post",        
		url: "/QCCheckManage/qc/getReportBoard2.do",
		data:{groupid:groupid,id:id,progress:progress},
		dataType: "json",   /*这句可用可不用，没有影响*/  
		success: function (data) {             
			var main=data.main;
			var failure=data.failList;
			var sumRecord=data.sumRecord;
			var productNum=data.productNum;
			var workerDetails=data.workerDetails;
			$("#productDate").html(main.productDate);
			$("#model").html(main.model);
			$("#pono").html(main.pono);
			$("#progress").html(main.qcprogress.progressName);
			$("#departmentid").html(main.dpt.name); //组别名称代替id
			$("#order_number").html(productNum.order_number);
			$("#allPonoNum").html(productNum.allPonoNum);
			$("#groupid").val(main.groupid);//隐藏组别id
			$("#prodectType").html(main.prodectType);
			$("#txtid").val(main.id);
			$("#txtpono").val(main.pono);
			$("#txtmodel").val(main.model);
			
			$("#oldWorker").val(main.sumWorker);
			$("#worksid").val(main.id);
			$("#workspono").val(main.pono);
			$("#worksmodel").val(main.model);
			$("#packsid").val(main.id);
			$("#packpono").val(main.pono);
			$("#packmodel").val(main.model);
			$("#oldStandardProd").val(main.standardProduct);
			var standard=$("#standard_product");
			var record=$("#record"); 
			if(sumRecord && sumRecord.length > 0){
				for(var i=0,len=sumRecord.length;i<len;i++){ 
				var tr=$("<tr></tr>"); 
				var tdname=$("<td>"+sumRecord[i].QCCheckProjectID+"</td>");
				var td1=$("<td>"+sumRecord[i].one+"</td>");
				var td2=$("<td>"+sumRecord[i].two+"</td>"); 
				var td3=$("<td>"+sumRecord[i].three+"</td>"); 
				var td4=$("<td>"+sumRecord[i].four+"</td>");
				var td5=$("<td>"+sumRecord[i].five+"</td>"); 
				var td6=$("<td>"+sumRecord[i].six+"</td>"); 
				var td7=$("<td>"+sumRecord[i].seven+"</td>");
				var td8=$("<td>"+sumRecord[i].eight+"</td>"); 
				var td9=$("<td>"+sumRecord[i].nine+"</td>"); 
				var td10=$("<td>"+sumRecord[i].ten+"</td>");
				var td11=$("<td>"+sumRecord[i].eleven+"</td>"); 
				var td12=$("<td>"+sumRecord[i].allNum+"</td>");
				
				tr.append(tdname).append(td1).append(td2).append(td3).append(td4).append(td5).
				append(td6).append(td7).append(td8).append(td9).append(td10).append(td11).append(td12);
				tr.appendTo(record);  
				
				}
			}
			var goodRatetr=$("<tr><td>良品率%</td></tr>"); 
			var arrivedRatetr=$("<tr><td>达成率%</td></tr>"); 
			//计算良品率 循环遍历 达成率和良品率小于98%的标红
			for(var i=1,len=12;i<len;i++){ 
				
			    var bad = record.children().eq(0).children().eq(i);//获取到不良数 
				var good = record.children().eq(1).children().eq(i);//获取到良品数 
				var goodValue=eval(good.text());
				var badValue=eval(bad.text());
				var goodRatetd=0.00;
				//达成率=良品数/标准产能
				var arrivedRatetd=(goodValue*100/main.standardProduct).toFixed(2)
				//良品率=良品数/总检查数
				if((badValue+goodValue)!=0){
					goodRatetd=(goodValue*100/(badValue+goodValue)).toFixed(2)
				}
				var td=$("<td>"+goodRatetd+"</td>");
				var td2=$("<td>"+arrivedRatetd+"</td>");
				goodRatetr.append(td);
				arrivedRatetr.append(td2);
			}
			goodRatetr.append("<td></td>");
			goodRatetr.appendTo(record); 
			arrivedRatetr.append("<td></td>");
			arrivedRatetr.appendTo(record); 
			
			
			if(workerDetails!=null && workerDetails.length>0){
				
				var	tbody7=standard.append($("<td>标准产能</td>"));
				var	tbody1=$("<tr><td>总工时</td></tr>"); 
				var	tbody2=$("<tr><td>借入工时</td></tr>");
				var	tbody3=$("<tr><td>借入组别</td></tr>"); 
				var	tbody4=$("<tr><td>借出工时</td></tr>"); 
				var	tbody5=$("<tr><td>借出组别</td></tr>");
				var sumtd1=0;
				var sumtd2=0;
				var sumtd4=0;
				for(var i=0;i<workerDetails.length;i++){
			
					var allWorkerHour=(((workerDetails[i].workerAmount)/60)+((workerDetails[i].getWorkers)/60)-((workerDetails[i].borrowWorkers)/60)).toFixed(2)
					if(workerDetails[i].standardProduct!=0){
						
						var td7=$("<td>"+workerDetails[i].standardProduct+"</td>");
					
					}else  
						{
						var td7=$("<td>"+main.standardProduct+"</td>");
						var td8=$("<td>"+(sumRecord[1][i+1]*100/main.standardProduct).toFixed(2)+"</td>");
						}
					var getworkers=((workerDetails[i].getWorkers)/60).toFixed(2);
					var borrowworkers=((workerDetails[i].borrowWorkers)/60).toFixed(2);
					var td1=$("<td>"+allWorkerHour+"</td>");
					var td2=$("<td>"+getworkers+"</td>");
					var td3=$("<td>"+workerDetails[i].getWorkersGroup+"</td>");
					var td4=$("<td>"+borrowworkers+"</td>");
					var td5=$("<td>"+workerDetails[i].borrowWorkersGroup+"</td>");
					sumtd1=Number(allWorkerHour)+Number(sumtd1);
					sumtd2=Number(getworkers)+Number(sumtd2);
					sumtd4=Number(borrowworkers)+Number(sumtd4);
				
					 tbody7.append(td7);
					 tbody1.append(td1);
					 tbody2.append(td2);
					 tbody3.append(td3);
					 tbody4.append(td4);
					 tbody5.append(td5);
					} 
				
				tbody7.append("<td></td>");
				tbody2.append("<td>"+sumtd2+"</td>");
				tbody1.append("<td>"+sumtd1+"</td>");
				tbody3.append("<td></td>");
				tbody4.append("<td>"+sumtd4+"</td>");
				tbody5.append("<td></td>");
			
				
				 tbody1.appendTo(record);
				 tbody2.appendTo(record);
				 tbody3.appendTo(record);
				 tbody4.appendTo(record);
				 tbody5.appendTo(record);
		}
			//循环遍历 达成率和良品率小于98%的标红
			for(var i=1,len=12;i<len;i++){  
		    var bad = record.children().eq(0).children().eq(i); 
				if(eval(bad.text())>0) {
				bad.css({ color: 'red' }).css("background-color","yellow");
				}
			var good = record.children().eq(2).children().eq(i); 
				if(eval(good.text())<eval(98)&&eval(good.text())>0) {
				good.css({ color: 'red' });
				}
			var finish = record.children().eq(3).children().eq(i); 
				if(eval(finish.text())<eval(98)&&eval(finish.text())>0) {
				finish.css({ color: 'red' });
				}
			
				}
				
			
			var  failBody=$("#failBody");
			//循环遍历失败工时
			if(failure && failure.length > 0){
					for(var i=0,len=failure.length;i<len;i++){   
					var tr=$("<tr></tr>"); 
					
					var td1=$("<td>"+failure[i].failureStartHour+"</td>");
					var td2=$("<td>"+failure[i].failureEndHour+"</td>"); 
					var td3=$("<td>"+failure[i].failureCountHours+"</td>"); 
					var td4=$("<td>"+failure[i].useWorkers+"</td>");
					var td5=$("<td>"+(failure[i].useSumHours/60).toFixed(2)+"</td>"); 
					var td6=$("<td>"+failure[i].failureReason+"</td>"); 
					var td7=$("<td>"+failure[i].leadPerson+"</td>");
					var td8=$("<td>"+failure[i].solution+"</td>"); 
					var td9=$("<td>"+failure[i].remark+"</td>"); 
					var td10=$("<td> <a href='javascript:delFail(\""+failure[i].id+"\");'>删除</td>");
					/*<a  " +
					"onclick='modifyFail(\""+failure[i].id+"\",\""
					+failure[i].parentId+"\",\""
					+failure[i].failureStartHour+"\",\""
					+failure[i].failureEndHour+"\",\""
					+failure[i].useWorkers+"\",\""
					+failure[i].failureReason+"\",\""
					+failure[i].leadPerson+"\",\""
					+failure[i].solution+"\",\""
					+failure[i].remark+"\");' id='modify'>修改" +
	"</a>	*/
					tr.append(td1).append(td2).append(td3).append(td4).append(td5).
					append(td6).append(td7).append(td8).append(td9).append(td10);
					tr.appendTo(failBody);  
					}
				} 
		},
			error: function (XMLHttpRequest, textStatus, errorThrown) {     
			alert(errorThrown);     
			}     
	 });  
	 };
