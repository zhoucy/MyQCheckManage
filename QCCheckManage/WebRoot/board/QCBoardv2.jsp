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
          <form id="ff" method="post">
          <table><tr>
                 <td>生产组别:</td><td><input id="groupid" name="groupid" class="easyui-combobox" style="width:150px;"
                                              required="true" missingMessage="必填信息"
                                              data-options="valueField: 'id',    
                                                            textField: 'name',    
                                                            url: '${ctx}/qc/getAllDept.do',
                                                            panelHeight:'auto', 
                                                            value:'${sessionScope.groupid}', 
                                                            readonly:true,
                                                            onSelect:loadinfo
                                                            " /></td>         
                 <td><input id="id" name="id" type="hidden"></td>                            
                 <td><a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload'" onclick="reflashData();">刷新数据</a></td>
               </tr> 
                           
          </table></form>
          </tr>
          <tr>
              <td>
		            <table id="ponoinfo" class="easyui-datagrid" rownumbers="true" style="width:100%;height:180px;" 
		                                 fitColumns="true" title="今天生产中的订单"
		                                 data-options="fitColumns:true,singleSelect:true,
		                                 loadMsg:0,idField:'id',
                                onLoadSuccess:lockQCPM">
                         <thead>
                               <tr>
                                  <th field="id" hidden="true">id</th> 
                                  <th field="productDate" width="100" align="center">日期</th> 
                                  <th field="pono" width="100" align="center" >订单号</th>
                                  <th field="name" width="100" align="center" >组别</th>
                                  <th field="product_name" width="100" align="center">产品类型</th> 
                                  <th field="newmodel" width="100" align="center">产品型号</th>                                                     
                                  <th field="progress_name" width="100" align="center">工序</th>
                                  <th field="sumWorker" width="100" align="center">投入人数</th>
                                  <th field="targetProduct" width="100" align="center">目标产能</th>
                                  <th field="standardProduct" width="100" align="center">标准产能</th>
                                    
                                  <th field="productTime" width="200" align="center" formatter="formatTime">开始时间</th>
                                  <th field="endTime" width="200" align="center" formatter="formatTime">结束时间</th>  
                                  <th field="order_number" width="100" align="center" formatter="formatnum">进度</th>                                    
                         </tr></thead>
		            </table>
              </td>
          </tr>
          <tr>
            <td>
               <table style="width:100%;" >
                   <tr>
                       <td style="width:50%;"  rowspan="2">
                       	<table id="stationcount"class="easyui-datagrid" rownumbers="true" style="height:405px;"
                             fitColumns="true" title="工位扫描数据" data-options="url:'${ctx}/qc/getStationCount.do?groupid=${sessionScope.groupid}'">
		                    <thead>
		                        <tr>
		                             <th field="position" width="100" align="center">工位编号</th> 
		                             <th field="positioname" width="100" align="center" >工位名称</th>
		                             <th field="num" width="100" align="center" >数量</th>                            
		                        </tr>
		                    </thead>
                		</table>
                	   </td>
                       <td style="width:50%;">
                      	 <table id="qccheck" class="easyui-datagrid" rownumbers="true" style="height:180px;"
                             fitColumns="true" title="QC数量" singleSelect="true" data-options="onDblClickRow:checkdetail">
		                    <thead>
		                        <tr>	                             
		                             <th field="pono" width="100" align="center" >订单号</th>
		                             <th field="qcid" width="100" align="center" >检测结果编码</th>
		                             <th field="name" width="100" align="center" >检测结果名称</th>
		                             <th field="qcnum" width="100" align="center" >数量</th>
		                        </tr>
		                    </thead>
		                 </table>
		               </td>
                   </tr>
                   <tr>
                      <td><table id="qccheckdetail"class="easyui-datagrid" rownumbers="true" style="height:220px;"
                             fitColumns="true" title="QC检测详情" singleSelect="true" pagination="true">
		                    <thead>
		                        <tr>	                             	                             
		                             <th field="serialnum" width="100" align="center">序列号</th>
		                             <th field="name" width="100" align="center">状态</th>
		                        </tr>
		                    </thead>
		                 </table></td>
                   </tr>
               </table>
                
             </td>
          </tr>
        
          
        </table> 
      </div>
<script type="text/javascript">

$(document).ready(function() {
        loadinfo();
        lockQCPM();//初始化生产中订单
          
        $("#serialnum").textbox('textbox').focus();
        
  });
       
    function clearSerialNum(){
        
        $("#qcid").textbox("clear");
        $("#serialnum").textbox("clear");
        $("#serialnum").textbox('textbox').focus();
    }
     //清空产品类型,产品型号,和组别的值
     function clearpono(){
         $("#pono").textbox('clear');
		 $("#prodectType").textbox('clear');
		 $("#productid").textbox('clear');
     }
     //刷新数据 
     function reflashData(){
          $('#swipedata').datagrid('reload');
          $('#ponoinfo').datagrid('reload');
     }
    
   
     //成功消息
     function successMsg(msg){
            $.messager.alert('消息',msg,'info');                                  
            setTimeout("$('.messager-body').window('close');", 1000 );     
     }
     //失败消息
     function errorMsg(msg){
            $.messager.alert('消息',msg,'error');
     }
     function formatTime(value,row,index) {
           if(value!= undefined){
              value=parseInt(value);
              var time=new Date(value);
              var y=time.getFullYear();
              var m=time.getMonth()<10?"0"+time.getMonth():time.getMonth();
              var d=time.getDate()<10?"0"+time.getDate():time.getDate();
              var h=time.getHours()<10?"0"+time.getHours():time.getHours();
              var mm=time.getMinutes()<10?"0"+time.getMinutes():time.getMinutes();
              var ss=time.getSeconds()<10?"0"+time.getSeconds():time.getSeconds();
              var t=y+"-"+m+"-"+d+" "+h+":"+mm+":"+ss;
              return t;
           }          
     }
     function formatnum(value,row,index){
         return row.finish_number+"/"+value;
     }
     function formatNumer(value,row,index){
         return   '<font color="red">' + value + '</font>';
     }
     function loadswipe(){
        $("#swipedata").datagrid({
             url:'${ctx}/qc/getSwipeDataByParams.do',
             queryParams: {
                    pono:$("#pono").textbox('getText'),
		            groupid: $("#groupid").combobox('getValue'),
	         }           
         }); 
     }
     function loadinfo(){       
         $("#ponoinfo").datagrid({
             url:'${ctx}/qc/getTodayPMByGroupid.do',
             queryParams: {
		            groupid: $("#groupid").combobox('getValue')
	         }           
         });
         $("#qccheck").datagrid({
             url:'${ctx}/qc/checkData.do',
             queryParams: {
		            groupid: $("#groupid").combobox('getValue')
	         }           
         });
         
     }
     //思路:根据组别查询是否有未完成的订单(endtime=null)(假设一个组只能有一个endtime=null正在做且未做完的订单)
     //没有什么都不做,如果有继续做这个订单
     function lockQCPM(){
         $.ajax({
              type:'post',
              //async:false,
              url:'${ctx}/qc/lockProducingQCPM.do',
              data:{groupid: $("#groupid").combobox('getValue')},
              dataType:'json',
              success:function(data){
                  if(data){                                    
                      $("#id").val(data.pmid);
                      $("#ponoinfo").datagrid('selectRecord', data.pmid);
                      var row = $('#ponoinfo').datagrid('getSelected');                 
                  }
              }
         });
     }
     function checkdetail(index,row){      
        $("#qccheckdetail").datagrid({
           url:'${ctx}/qc/getQCCheckDetail.do',
           queryParams:{
              qcid:row.qcid,
              pono:row.pono,
              swipedate:row.swipedate
           }
        });
     }

</script>
  </body>
</html>
