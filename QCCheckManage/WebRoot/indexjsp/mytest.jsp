<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<c:set var="ctx" value="${pageContext.request.contextPath }" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <jsp:include page="../inc.jsp"/>
<style type="text/css">
.panel-body {border:0;}
</style>
</head>
  <body>
<div class="easyui-panel" fit="true">
     <table>
          <tr>
                 <td rowspan="2"><table id="swipedata" class="easyui-datagrid" style="width:1000px;height:330px" rownumbers="true"
                                        data-options="url:'${ctx}/qc/getSwipeData.do',fitColumns:true,singleSelect:true,loadMsg:0,
                                                   ">
                                        <thead>
                                            <tr>
                                               <th colspan="7">分析后的数据</th>
                                               <th colspan="6">原始数据</th>
                                            </tr>
                                        <tr>
                                           <th field="pono" width="100" align="center">订单号</th>
                                           <th field="groupname" width="80" align="center">组别</th>
                                           <th field="position" width="30" align="center">工位</th>                                        
                                           <th field="serialnum" width="100" align="center">序列号</th>
                                           <th field="swipetime" width="100" align="center">刷卡时间</th>
                                           <th field="dbtime" width="100" align="center">录入时间</th>
                                           <th field="swipedate" width="100" align="center">日期</th>
                                           <th field="CSN" width="100" align="center">CSN</th>
                                           <th field="GID" width="30" align="center">GID</th>
                                           <th field="DID" width="30" align="center">DID</th>
                                           <th field="DataType" width="30" align="center">DataType</th>
                                           <th field="SerialDate" width="100" align="center">SerialDate</th>
                                           <th field="Info" width="100" align="center">Info</th>
                                        </tr></thead>
                                        </table></td>
                 <td> <form id="fm" method="post" novalidate>
                      <table><tr><!-- <td>组别id:</td><td><input id="groupid" name="groupid" class="easyui-textbox" style="width:10px; required="true" missingMessage="必填信息"></td>
                                 <td>订单:</td><td><input id="pono" name="pono" class="easyui-textbox" style="width:10px; required="true" missingMessage="必填信息"></td>
                                 <td><a id="orderstart" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" onclick="orderstart();">确定</a></td>
                                 <td><a id="orderfinish" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-clear'" disabled="true" onclick="orderfinish();">结单</a></td> -->
                                 <td><a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload'" onclick="reflashData();">刷新数据</a></td>
                      </tr></table></form>
                 </td>
          </tr>
          <tr><td><table id="swipecard" class="easyui-datagrid" style="width:415px;height:280px"  
                                data-options="url:'${ctx}/qc/getCardInfo.do',fitColumns:true,singleSelect:true,loadMsg:0">
                                <thead><tr>
                                           <th field="cnum" width="100" align="center">物理卡号</th>
                                           <th field="cpono" width="150" align="center">订单号</th>
                                           <th field="cposition" width="150" align="center">下次刷卡位置</th>
                                           <th field="cserialnum" width="150" align="center">序列号</th>
                                           <th field="cgroupid" width="150" align="center">组别id</th>
                                           <th field="cgroupname" width="150" align="center">组名</th>
                                           <th field="csequence" width="150" align="center">流程</th>
                                           <th field="cgid" width="50" align="center">卡机组别</th>
                                        </tr></thead>
                                </table></td></tr>
          <tr><td><div id="swipemessage" title="消息" class="easyui-panel" style="width:1000px;height:275px"><div></td>
                <td><table id="swipemachine" class="easyui-datagrid" style="width:415px;height:275px"  
                                data-options="url:'${ctx}/qc/getBindPono.do',fitColumns:true,singleSelect:true,loadMsg:0,">
                                <thead><tr>
                                           <th field="mgid" width="50" align="center">卡机组别</th>
                                           <th field="mgroupid" width="50" align="center">生产组别</th>
                                           <th field="mgroupname" width="80" align="center">组别名称</th>
                                           <th field="mpono" width="100" align="center">订单号</th>
                                           <th field="msequence" width="200" align="center">流程</th>
                                </tr></thead></table></td></tr>
     </table>
</div>
<script type="text/javascript">
         function orderstart(){
            //绑定组别和订单的方法,绑定之前要先判断是否已经绑定过其他的订单
            //如果绑定成功,那么将组别id,pono,和绑定按钮锁死,同时解除结单按钮的关闭状态  
            $('#fm').form('submit',{
				url: '${ctx}/qc/bindGroupAndPono.do',
				onSubmit: function(){
					return $(this).form('validate');
				},
				success: function(result){
				    console.log(result);
				    if(result==0){
				       errorMsg("没有任何改变,确认是否为当前组别分配刷卡器!");
				    }else if(result>0){
				       successMsg("<span style='color:green;'>恭喜你,操作成功!</span>");
				       $('#groupid').textbox('readonly',true);
				       $('#pono').textbox('readonly',true);
				       $("#orderstart").linkbutton('disable');
				       $("#orderfinish").linkbutton('enable');
				    }else{
				       errorMsg("发生未知错误,当前组别已经绑定有订单");
				    }				
					reflashData();
				}
			});    
         }
         function orderfinish(){
            //结单的方法,根据订单号和组别id将符合条件的刷卡器订单号全部清空(如果产品的流程时间长,会引发长时间等待的问题)
            //如果结单成功,那么将组别id,pono,和绑定的按钮解除锁定状态,同时将自己锁定
            $('#fm').form('submit',{
				url: '${ctx}/qc/unbindGroupAndPono.do',
				onSubmit: function(){
					return $(this).form('validate');
				},
				success: function(result){
					console.log(result);
					if(result==0){
					   successMsg("失败!没有绑定任何订单");
					}else{
					   successMsg("<span style='color:green;'>成功!</span>,影响到的刷卡器个数:"+result+"个");
					   $('#groupid').textbox('readonly',false);
				       $('#pono').textbox('readonly',false);
				       $("#orderstart").linkbutton('enable');
				       $("#orderfinish").linkbutton('disable');
					}
					reflashData();
				}
			}); 
         }
         function reflashData(){
            $("#swipedata").datagrid("reload");
            $("#swipecard").datagrid("reload");
            $("#swipemachine").datagrid("reload");
         }
         function successMsg(msg){
            $.messager.alert('消息',msg,'info');                                  
            setTimeout("$('.messager-body').window('close');", 1000 );     
         }
         function errorMsg(msg){
            $.messager.alert('消息',msg,'error');
         }
         $(function(){
             // setInterval("reflashData();",5000);        
         });
     </script>
<script type="text/javascript">
     var websocket = null;
     //判断当前浏览器是否支持WebSocket
     if ('WebSocket' in window) {
         websocket = new WebSocket("ws://"+document.location.host+"${ctx}/websocket");
    }
     else {
         alert('当前浏览器 Not support websocket');
     }
 
     //连接发生错误的回调方法
     websocket.onerror = function (event) {
         console.log(event);
         //setMessageInnerHTML("WebSocket连接发生错误");
     };

     //连接成功建立的回调方法
     websocket.onopen = function () {
         //setMessageInnerHTML("WebSocket连接成功");
    };
 
     //接收到消息的回调方法
     websocket.onmessage = function (event) {
         //setMessageInnerHTML(event.data);
     };

     //连接关闭的回调方法
     websocket.onclose = function () {
         //setMessageInnerHTML("WebSocket连接关闭");
     };
 
     //监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。
     window.onbeforeunload = function () {
         closeWebSocket();
     };

     //将消息显示在网页上
     function setMessageInnerHTML(innerHTML) {
         //document.getElementById('swipemessage').innerHTML += innerHTML + '<br/>';
    }
 
     //关闭WebSocket连接
     function closeWebSocket() {
         websocket.close();
     }
 
    //发送消息
     function send() {
         //var message = document.getElementById('text').value;
         //websocket.send(message);
     }
     </script>
  </body>
</html>
