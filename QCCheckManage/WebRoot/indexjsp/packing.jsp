<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<c:set var="ctx" value="${pageContext.request.contextPath }" />

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <jsp:include page="../inc.jsp"/>

  </head>
<style type="text/css">
.panel-body {border:0;}
</style>
  <body>
  <div class="easyui-panel" fit="true">
      <table>
          <tr>               
               <td>生产组别:</td><td><input id="groupid" name="groupid" class="easyui-combobox" 
                                              required="true" missingMessage="必填信息"
                                              data-options="valueField: 'id',    
                                                            textField: 'name',    
                                                            url: '${ctx}/qc/getAllDept.do',
                                                            panelHeight:'auto', 
                                                            value:'${sessionScope.groupid}',
                                                            onSelect: function(rec){    
                                                                groupid=rec.id;
                                                                getPM();
                                                            },
                                                            onLoadSuccess:function(){
                                                                getPM();
                                                            }                                                      
                                                            " /></td>
               <td>生产日期:</td><td><input id="dd" type="text" class="easyui-datebox" value=" "
                                              
                                              data-options="onSelect: function(date){
                                                              var selectDate=$(this).datebox('getValue');
                                                              productDate=selectDate;
                                                              getPM();
                                                            }            
                                                             "></input></td>
               <td>生产订单:</td><td><input id="pmid" name="pmid" class="easyui-combobox"   
                                                required="true" missingMessage="必填信息"/></td>
           </tr>
           <tr>
               <td>外箱条形码:</td><td><input id="boxbarcode" class="easyui-numberbox" 
                                                required="true" missingMessage=""></td> 
               <td>彩盒条形码:</td><td><input id="packbarcode" class="easyui-numberbox" 
                                                required="true" missingMessage=""></td>        
               <td></td><td><span id="msg"></span></td>                                 
          </tr>
          <tr>
              <td colspan="6"><table id="ponoinfo" class="easyui-datagrid" rownumbers="true" style="width:800px;height:120px;" fitColumns="true" title="订单"
                                                   data-options="fitColumns:true,singleSelect:true,loadMsg:0,idField:'id'">
                                        <thead>
                                        <tr>
                                           <th field="id" hidden="true">id</th> 
                                           <th field="productDate" width="10%" align="center">日期</th> 
                                           <th field="pono" width="10%" align="center" >订单号</th>
                                           <th field="name" width="10%" align="center" >组别</th>
                                           <th field="product_name" width="10%" align="center">产品类型</th> 
                                           <th field="newmodel" width="10%" align="center">产品型号</th>                                                     
                                           <th field="progress_name" width="10%" align="center">工序</th>
                                           <th field="sumWorker" width="10%" align="center">投入人数</th>
                                           <th field="targetProduct" width="10%" align="center">目标产能</th>
                                           <th field="standardProduct" width="10%" align="center">标准产能</th> 
                                           
                                           <th field="productTime" width="10%" align="center" formatter="formatTime">开始时间</th>
                                           <th field="endTime" width="10%" align="center" formatter="formatTime">结束时间</th>  
                                           <th field="order_number" width="10%" align="center" formatter="formatnum">进度</th>                                                               
                                       </tr></thead>
                               </table>
              </td>
          </tr>
          <tr>
              <td colspan="6"><table id="packing" class="easyui-datagrid"  rownumbers="true" style="width:800px;height:300px" fitColumns="true" title="包装"
                                        pagination="true" pageSize="10"
                                        data-options="fitColumns:true,singleSelect:true,loadMsg:0">
                                        <thead>                            
                                        <tr>
                                           <th field="pmid" width="5%" align="center">pmid</th>
                                           <th field="BoxBarcode" width="15%" align="center">外箱条形码</th>
                                           <th field="PackBarcode" width="15%" align="center">彩盒条形码</th>
                                           <th field="BoxCapacity" width="6%" align="center">个/箱</th>
                                           <th field="PackCount" width="6%" align="center">计数</th>
                                           <th field="BoxNo" width="6%" align="center">箱号</th>
                                           <th field="PackNo" width="6%" align="center">入箱顺序</th>
                                           <th field="date" width="12%" align="center" >录入日期</th>   
                                           <th field="time" width="20%" align="center" formatter="formatTime">录入时间</th>                  
                                        </tr></thead>
                                        </table>
              </td>
          </tr>
      </table>
  </div>
<script type="text/javascript">
var groupid="${sessionScope.groupid}";
var today=getTodayStr();
var pmid;
var PackBarcode;
var BoxBarcode;
var productDate=getTodayStr();

/*获取当天的日期*/
function getTodayStr(){
	var now=new Date();
	var year=now.getFullYear();
	var month=now.getMonth() < 9 ? "0" + (now.getMonth()+1) : (now.getMonth()+1);
	var day=now.getDate() < 10 ? "0" + now.getDate() : now.getDate();
	var today=year+"-"+month+"-"+day;
	return today;
}
//选择组别,自动筛选出当天的该组生成的订单
function getPM(){
   $.ajax({
       type:"post",
       url:"${ctx}/qc/getPMByGroupidAndProductDate.do",
       data:{productDate:productDate,groupid:groupid},
       dataType:"json",
       success:function(data,dataType){
           $("#pmid").combobox({
                  valueField: 'id',
                  textField: 'pono',
                  panelHeight:'auto',
                  data:data,
                  onSelect: function(rec){
                       pmid=rec.id;
                       loadPacking();                    
                  }                   
           });
       },
       error:function(){
           console.log("error");
       }
   });
}
//成功消息
function successMsg(msg) {
	$.messager.alert('消息', msg, 'info');
	setTimeout("$('.messager-body').window('close');", 1000);
}
//失败消息
function errorMsg(msg) {
	$.messager.alert('消息', msg, 'error');
}
//格式化时间
function formatTime(value, row, index) {
	if (value != undefined) {
		value = parseInt(value);
		var time = new Date(value);
		var y = time.getFullYear();
		var m = time.getMonth() < 9 ? "0" + (time.getMonth() + 1) : (time
					.getMonth() + 1);
		var d = time.getDate() < 10 ? "0" + time.getDate() : time.getDate();
		var h = time.getHours() < 10 ? "0" + time.getHours() : time
					.getHours();
		var mm = time.getMinutes() < 10 ? "0" + time.getMinutes() : time
					.getMinutes();
		var ss = time.getSeconds() < 10 ? "0" + time.getSeconds() : time
					.getSeconds();
		var t = y + "-" + m + "-" + d + " " + h + ":" + mm + ":" + ss;
		return t;
	}
}
//格式化完成数量
function formatnum(value,row,index){
    return row.finish_number+"/"+value;
}
function loadPacking(){
    $("#ponoinfo").datagrid({
                             url:'${ctx}/qc/getTodayPMByGroupidFromPlan.do',
                             queryParams: {groupid: groupid,productDate:productDate},
                             onLoadSuccess:function(){
                                 //$(this).datagrid('selectRow', 0);
                                 $(this).datagrid('selectRecord', pmid);
                             }         
                       });
   $("#packing").datagrid({
                            url:'${ctx}/qc/getBarCodeByPmid.do',
                            queryParams: {pmid: pmid},
                            onLoadSuccess:function(){
                                 $(this).datagrid('selectRow', 0);
                            }          
                       });
}
function addPacking(){
   var pmidValid=$("#pmid").numberbox("isValid");
   var value=$('#packbarcode').numberbox('getValue');
   if(pmidValid){
      $.ajax({
            type:"post",
            url:"${ctx}/qc/addPacking.do",
            data:{pmid:pmid,
                  PackBarcode:PackBarcode,
                  BoxBarcode:BoxBarcode
                  },
            dataType:"json",
            success:function(data,dataType){
                if(data==-1){
                  $("#msg").html("新增失败(检查生成计划管理外箱条形码,彩盒条形码,个/箱是否设置正确)").css('color','red');
                }else{
                  $("#msg").html("新增成功").css('color','green');
                  setTimeout("loadPacking();", 100 );
                  if(data==1){
                     $('#boxbarcode').textbox('textbox').focus();
                     $('#boxbarcode').textbox('clear');
                  }
                }       
            },
            error:function(){              
                errorMsg("发生异常");
            }
     });
   }else{
      errorMsg("请选择订单先");
   }
   
   
}
$(function(){
   $('#boxbarcode').textbox('textbox').keyup(function (e) {
        if (e.keyCode == 13) {              
               BoxBarcode=$('#boxbarcode').numberbox('getValue');
               if(BoxBarcode){
                 $.ajax({
                    type:"post",
                    url:"${ctx}/qc/getPonoAndPackingByPmid.do",
                    data:{pmid:pmid},
                    dataType:"json",
                    success:function(data){
                       console.log(data);
                       if(data[0].boxbarcode==BoxBarcode){
                         $('#packbarcode').textbox('textbox').focus(); 
                       }else{
                         alert("外箱条形码"+BoxBarcode+"错误!");
                         $('#boxbarcode').textbox('clear');
                       }
                    }
                 });                                                            
               }             
        }
   });
   $('#packbarcode').textbox('textbox').keyup(function (e) {
        if (e.keyCode == 13) {  
               $("#msg").html("");           
               PackBarcode=$('#packbarcode').numberbox('getValue');
               if(PackBarcode){
                  $.ajax({
                    type:"post",
                    url:"${ctx}/qc/getPonoAndPackingByPmid.do",
                    data:{pmid:pmid},
                    dataType:"json",
                    success:function(data){
                       console.log(data);
                       if(data[0].packbarcode==PackBarcode){
                         addPacking();               
                         $('#packbarcode').textbox('clear');
                         $('#packbarcode').textbox('textbox').focus(); 
                       }else{
                         alert("彩盒条形码"+PackBarcode+"错误!");
                         $('#packbarcode').textbox('clear');
                       }
                    }
                 });                               
               }              
        }
   });  
});
</script>
  </body>
</html>
