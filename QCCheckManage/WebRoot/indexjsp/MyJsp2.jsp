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
                 <td>生产订单:</td><td><input id="pono" name="pono" class="easyui-combobox"  style="width:150px;" 
                                              required="true" missingMessage="必填信息"
                                              data-options="valueField: 'id',    
                                                            textField: 'pono',    
                                                            url: '${ctx}/qc/getPonoAndUnion.do',
                                                            panelHeight:'auto',   
                                                            onSelect: function(rec){    
                                                                $('#productid').combobox('select', rec.modelid);
                                                                $('#prodectType').combobox('select', rec.typeid);
                                                                loadswipe();
                                                            }" /></td>
                 <td>产品类型:</td><td><input id="prodectType" name="prodectType" class="easyui-combobox" style="width:150px;" 
                                               required="true" missingMessage="必填信息"
                                               data-options="valueField: 'productNo',    
                                                            textField: 'productName',    
                                                            url: '${ctx}/qc/getAllQCPT.do',
                                                            panelHeight:'auto', 
                                                            readonly:true,  
                                                            " /></td>
                 <td>产品型号:</td><td><input id="productid" name="productid" class="easyui-combobox" style="width:150px;" 
                                               required="true" missingMessage="必填信息"
                                               data-options="valueField: 'id',    
                                                            textField: 'model',    
                                                            url: '${ctx}/product/getAllQCPR.do', 
                                                            panelHeight:'auto',
                                                            readonly:true, 
                                                            " /></td>
                 <td>产品工序:</td><td><input id="progress" name="progress" class="easyui-combobox" style="width:150px;"
                                              required="true" missingMessage="必填信息"
                                              data-options="valueField: 'id',    
                                                            textField: 'progressName',    
                                                            url: '${ctx}/qc/getAllProgress.do',
                                                            panelHeight:'auto', 
                                                            value:'2',  
                                                            "></td>                                        
                   <td><input id="id" name="id" type="hidden"></td>
               </tr>
               <tr>
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
                 <td>投入人数:</td><td><input id="sumWorker" name="sumWorker"  class="easyui-numberspinner" style="width:150px;"
                                              data-options="min:10,max:100,required:true,missingMessage:'必填信息',onChange:workerNum"
                                              /></td>
                 <td>目标产能:</td><td><input id="targetProduct" name="targetProduct"  class="easyui-numberspinner" style="width:150px;" 
                                              data-options="required:true,missingMessage:'必填信息'" 
                                              /></td>
                 <td>标准产能:</td><td><input id="standardProduct" name="standardProduct"  class="easyui-numberspinner" style="width:150px;" 
                                              data-options="required:true,missingMessage:'必填信息'" 
                                              /></td>
                 <td><a id="productstart" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" onclick="productstart();">确定</a></td>
                 <td><a id="productfinfsh" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-clear'" disabled="true" onclick="productfinfsh();">结单</a></td>                
                 <td><a id="manualoperate"  href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-edit'" onclick="manualedit();">手动修改</a></td>
                 <td><a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload'" onclick="reflashData();">刷新数据</a></td>
                 <%-- <td><a class="easyui-linkbutton" iconcls="icon-mylookboard2"  href="${pageContext.request.contextPath}/board/QCBoard.jsp">生产日报看板</a><br></td> --%>
               </tr>                
          </table></form>
          </tr>
          <tr>
          <table id="swipedata" class="easyui-datagrid"  rownumbers="true" style="width:auto;height:350px" fitColumns="true" 
                                        pagination="true" 
                                        data-options="url:'${ctx}/qc/getSwipeDataByParams.do?swipedate=today',fitColumns:true,singleSelect:true,loadMsg:0,
                                        queryParams: {groupid:'${sessionScope.groupid}' },  
                                        ">
                                        <thead>
                                            <tr>
                                               <th colspan="8">分析后的数据</th>
                                               <th colspan="5">原始数据</th>
                                            </tr>
                                        <tr>
                                           <th field="pono" width="100" align="center">订单号</th>
                                           <th field="groupname" width="50" align="center">组别</th>
                                           <th field="position" width="50" align="center">工位</th>
                                           <th field="Info" width="100" align="center">卡号</th>
                                           <th field="serialnum" width="200" align="center">序列号</th>
                                           <th field="swipetime" width="150" align="center" formatter="formatStringTime">刷卡时间</th>
                                           <th field="dbtime" width="150" align="center" formatter="formatTime">录入时间</th>
                                           <th field="swipedate" width="80" align="center">日期</th>
                                           <th field="CSN" width="120" align="center">CSN</th>
                                           <th field="GID" width="50" align="center">GID</th>
                                           <th field="DID" width="50" align="center">DID</th>
                                           <th field="DataType" width="50" align="center">DataType</th>
                                           <th field="SerialDate" width="150" align="center" formatter="formatStringTime">SerialDate</th>
                                           
                                        </tr></thead>
                                        </table>
          </table>
          </tr>
          <tr>
             &#12288;
          </tr>
          <tr>
             <table id="ponoinfo" class="easyui-datagrid" rownumbers="true" style="width:auto;height:180px;" fitColumns="true" title="今天生产中的订单"
                                  data-options="fitColumns:true,singleSelect:true,loadMsg:0,idField:'id',onLoadSuccess:lockQCPM">
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
          <tr>
        </table>
      </div>
<script type="text/javascript">
     //手动选择产品类型,产品型号,和组别
     function manualedit(){
          $("#pono").combobox('readonly', false);
          $('#prodectType').combobox('readonly', false);
          $('#productid').combobox('readonly', false);
          $('#groupid').combobox('readonly', false);
     } 
     //关闭手动选择产品类型,产品型号,和组别
     function manualclose(){
          $("#pono").combobox('readonly', true);
          $('#prodectType').combobox('readonly', true);
          $('#productid').combobox('readonly', true);
          $('#groupid').combobox('readonly', true);
     }
     //开单成功,锁定按钮,解除某些按钮的锁定
     function productstartsuccess(){
		  $("#productstart").linkbutton('disable');
	      $("#productfinfsh").linkbutton('enable');
	      $("#manualoperate").linkbutton('disable');
     }
     //结单成功,锁定按钮,解除某些按钮的锁定
     function productfinfshsuccess(){
          $("#productstart").linkbutton('enable');
		  $("#productfinfsh").linkbutton('disable');
		  $("#manualoperate").linkbutton('enable');
     }
     //清空产品类型,产品型号,和组别的值
     function clearpono(){
         $("#pono").combobox('clear');
		 $("#prodectType").combobox('clear');
		 $("#productid").combobox('clear');
     }
     //刷新数据 
     function reflashData(){
          $('#swipedata').datagrid('reload');
          $('#ponoinfo').datagrid('reload');
     }
     //向product_main中增加一条记录,并且绑定组别和订单   
     function productstart(){                     
          var pono=$("#pono").combobox('getText');
          var model=$("#productid").combobox('getText');
          var sumWorker=$("#sumWorker").numberbox('getValue');
          var targetProduct=$("#targetProduct").numberbox('getValue');
          var standardProduct=$("#standardProduct").numberbox('getValue');
          var groupid=$("#groupid").combobox('getValue');
          var prodectType=$("#prodectType").combobox('getValue');
          var progress=$("#progress").combobox('getValue');
          var productid=$("#productid").combobox('getValue');
          $('#ff').form('submit',{
				url: '${ctx}/qc/startQCPPandBindpono.do',
				queryParams:{pono:pono,
				             model:model,
				             sumWorker:sumWorker,
				             targetProduct:targetProduct,
				             standardProduct:standardProduct,
				             groupid:groupid,
				             prodectType:prodectType,
				             progress:progress,
				             productid:productid},
				onSubmit: function(){
				    if(pono==""){
				       return false;
				    }		    
					return  $(this).form('validate');
				},
				success: function(result){
				    if(result==0){
				       errorMsg("开单失败!");
				    }else{
				      successMsg("开单成功!");
				      $("#id").val(result);	
				      manualclose();
				      productstartsuccess();			      
				    } 
				    //刷新今天订单
				    setTimeout("loadinfo();", 1000 );
				}
		  });
		  
		  
		  
     }
     //更新product_main中增加结束时间,并解除组别和订单的绑定关系
     function productfinfsh(){                   
            $('#ff').form('submit',{
				url: '${ctx}/qc/endQCPPandUnbindpono.do',
				onSubmit: function(){				    
					return  $(this).form('validate');
				},
				success: function(result){
				   console.log(result);
				   if(result=="true"){
				      successMsg("结单成功!"); 
				      $("#pono").combobox('readonly', false);
				      productfinfshsuccess();
				      clearpono(); 
				   }else{
				      errorMsg("结单失败");
				   }
				   //刷新今天订单
				   setTimeout("loadinfo();", 1000 );
				}
		    });
		    		    
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
              var m=time.getMonth()<9?"0"+(time.getMonth()+1):(time.getMonth()+1);
              var d=time.getDate()<10?"0"+time.getDate():time.getDate();
              var h=time.getHours()<10?"0"+time.getHours():time.getHours();
              var mm=time.getMinutes()<10?"0"+time.getMinutes():time.getMinutes();
              var ss=time.getSeconds()<10?"0"+time.getSeconds():time.getSeconds();
              var t=y+"-"+m+"-"+d+" "+h+":"+mm+":"+ss;
              return t;
           }          
     }
      function formatStringTime(value,row,index) {
           if(value!= undefined){
              var y=value.substring(0,4);
              var m=value.substring(4,6);
              var d=value.substring(6,8);
              var h=value.substring(8,10);
              var mm=value.substring(10,12);
              var ss=value.substring(12,14);
              var t=y+"-"+m+"-"+d+" "+h+":"+mm+":"+ss;
              return t;
           }          
     }
     function formatnum(value,row,index){
         return row.finish_number+"/"+value;
     }
     function loadswipe(){
        $("#swipedata").datagrid({
             url:'${ctx}/qc/getSwipeDataByParams.do',
             queryParams: {
                    pono:$("#pono").combobox('getText'),
		            groupid: $("#groupid").combobox('getValue'),
		            swipedate:"today", 
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
                  if(data.isEmpty){
                      return ;
                  }else{
                       console.log(data);
                      $("#pono").combobox('select', data.planid);                     
                      $("#id").val(data.pmid);
                      $("#sumWorker").numberspinner('setValue', data.sumWorker);
                      $("#targetProduct").numberspinner('setValue', data.targetProduct); 
                      $("#standardProduct").numberspinner('setValue', data.standardProduct);
                      $("#ponoinfo").datagrid('selectRecord', data.pmid);
                      productstartsuccess();
                      manualclose();
                  }
              }
         });
     }
     function workerNum(newValue,oldValue){
         var data={productid:$("#productid").combobox('getValue'),
                   progress:$("#progress").combobox('getValue'),
                   sumWorker:$("#sumWorker").numberbox('getValue')};
        $.ajax({
          type:'post',
          url:'${ctx}/qc/getProductNum.do',
          data:data,
          dataType:'json',
          success:function(data){
             if(data){
               $("#targetProduct").numberspinner('setValue', data.targetProduct); 
               $("#standardProduct").numberspinner('setValue', data.standardProduct);
             }            
          },
          error:function(){
             console.log("发生未知的错误");
          }
        });
     }
     $(function(){
         loadinfo();
     });
</script>
  </body> 
</html>
