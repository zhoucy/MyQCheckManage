<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<c:set var="ctx" value="${pageContext.request.contextPath }" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <jsp:include page="inc.jsp"/>
  <script type="text/javascript" src="${ctx}/Highcharts/js/highcharts.js"></script>
  </head>
  
  <body>
      <div id="tabs" class="easyui-tabs" data-options="tools:'#tab-tools'" fit="true"
                pill="false"  plain="true" narrow="true">  
  
          <div title="首页" style="padding: 0; overflow: hidden;" id="home" data-options="iconCls:'icon-myhome'"> 
             <table>
                  <tr>
                      <td><div id="home-panel-welcome" title="" class="easyui-panel"  data-options="cls:'c0'" >
                                <div class="easyui-calendar" fit="true" border="false" firstDay="1" 
                                     data-options="onSelect: function(date){
                                                    var productDate=getDateStr(date);
		                                            $('#todayorder').datagrid({
		                                                    title:productDate+'的订单',
		                                                    queryParams:{productDate:productDate}		                                                    
		                                                  });
	                                              }"></div>
                               </div>               
                          </td>
                      <td><table id="todayorder" class="easyui-datagrid"  rownumbers="true" fit="true" title="今天生产中的订单"
		                         data-options="url:'${ctx}/qc/getTodeyOrderOfIndex.do',fitColumns:true,singleSelect:true">
		                  <thead>
			                 <tr>
				               <th field="pono" width="10%" align="center">订单编号</th>	
				               <th field="product_specific" width="5%" align="center">型号</th>	
				               <th field="model" width="13%" align="center">model</th>			               	
				               <th field="name"  width="7%" align="center">生产组别</th>
				               <th field="pre_shipment_date"  width="10%" align="center" formatter="formatPredate">预出货日期</th>
				               <th field="temp"  width="20%"  formatter="formatSchedule">进度</th>
				               <th field="product_name"  width="7%" align="center">产品类型</th>
				               <th field="order_number"  width="7%" align="center">订单数量</th>
				               <th field="finish_number"  width="10%" align="center" formatter="formatfin">完成数量</th>
				               <th field="product_status"  width="7%" align="center" formatter="formatStatus">生产状态</th>			
			                </tr>
		                 </thead>
	                     </table></td>
                  </tr>
                  <tr>
                      <td><div id="home-panel-pie" title="产品类型生产概况" class="easyui-panel"   
                               data-options="cls:'c0',href:'indexjsp/todaycapacitypie.jsp'" 
                               style="padding:10px;">     
                              </div></td>
                      <td><div id="home-panel-line" title="工时与产能走势图" class="easyui-panel"   
                               data-options="cls:'c0',href:'indexjsp/todaycapacityline.jsp'" 
                               style="padding:10px;">    
                               </div></td>
                  </tr>
             </table>
              
          </div> 
        </div>             
        </div>
        <div id="tab-tools">
            <a href="javascript:void(0)" class="easyui-linkbutton easyui-tooltip" title="刷新" data-options="plain:true,iconCls:'icon-reload'" onclick="reflash()"></a>
		    <a href="javascript:void(0)" class="easyui-linkbutton easyui-tooltip" title="全屏" data-options="plain:true,iconCls:'icon-myfull'" id="btn" onclick="fullswitch()"></a>
		    <a href="javascript:void(0)" class="easyui-linkbutton easyui-tooltip" title="关闭" data-options="plain:true,iconCls:'icon-cancel'" onclick="closetal()"></a>
	    </div> 
</div>
<script type="text/javascript">
        //全屏,取消全屏
$.extend($.fn.layout.methods, {
    full : function (jq) {
        return jq.each(function () {
            var layout = $(this);
            var center = layout.layout('panel', 'center');
            center.panel('maximize');
            center.parent().css('z-index', 10);
 
            $(window).on('resize.full', function () {
                layout.layout('unFull').layout('resize');
            });
        });
    },
    unFull : function (jq) {
        return jq.each(function () {
            var center = $(this).layout('panel', 'center');
            center.parent().css('z-index', 'inherit');
            center.panel('restore');
            $(window).off('resize.full');
        });
    }
});
function full() {
	$("body").layout("full");
}
function unFull() {
	$("body").layout("unFull");
}
var status="unfull";
function fullswitch(){
   if(status=="unfull"){
      status="full";
      full();
      $('#btn').linkbutton({iconCls: 'icon-myunfull'});
      $('#btn').tooltip('update','取消全屏');
      $('#btn').tooltip('hide');
   }else{
     status="unfull";
     unFull();
     $('#btn').linkbutton({iconCls: 'icon-myfull'});
     $('#btn').tooltip('update','全屏');
     $('#btn').tooltip('hide');
   }
}

//关闭当前tab
function closetal(){
     var curTab=$('#tabs').tabs('getSelected');
     if(curTab){
           var index = $('#tabs').tabs('getTabIndex', curTab);
           if(index==0){
              return;//不关闭首页
           }
           $('#tabs').tabs('close', index);
     }
}  
//刷新当前tab
function  reflash(){
    var curTab=$('#tabs').tabs('getSelected');
     if(curTab){
           var index = $('#tabs').tabs('getTabIndex', curTab);
           if(index==0){
              $("#todayorder").datagrid('reload');
              $("#home-panel-pie").panel('open').panel('refresh');
              $("#home-panel-line").panel('open').panel('refresh');
              return;//首页不刷新
           }
           var url = $(curTab.panel('options').content).attr('src');
           $('#tabs').tabs('update', {
               tab : curTab,
               options : {
               content : createFrame(url)
               }
          });
     }
}  
function createFrame(url) {  
        var s = '<iframe name="mainFrame" scrolling="auto" frameborder="0"  src="' + url + '" style="width:100%;height:100%;"></iframe>';  
        return s;  
}   
function formatPredate(value,row,index){
   var today=new Date().getTime();
   var orderday=new Date(value).getTime();
   if(orderday<today){
       return '<span style="color:red">'+value+'</span>';
   }else if(orderday-today<86400000){
      return '<span style="color:blue">'+value+'</span>';
   }else{
     return '<span style="color:green">'+value+'</span>';
   }   
}
function formatSchedule(value,row,index) {
       var temp=100*row.finish_number/row.order_number;
       var schedule=temp.toFixed(2);  
       var color=schedule>80?"green":schedule>40?"#FF9933":"#FF0000";  
       var length=schedule>28?schedule:28;
	   var s = ' <div style="width:100%;border:0px solid #ccc;">'+
			   ' <div style="width:' + length+ '%;background:'+color+';color:#FFFFFF">' + schedule + '%' + 
			   ' </div></div>';
	   return s;

	}
	function formatStatus(value, row, index) {
		return value;
	}
	function formatfin(value, row, index) {
		return value + "/<span style='color:black'>" + row.order_number
				+ "<span/>";
	}
	 $(function() {
		var width = $(this).width()-170;
		var height = $(this).height()-108;
		$("#home-panel-welcome").panel({
			width : width * 0.3,
			height : height * 0.48
		});
		$("#todayorder").datagrid({
			width : width * 0.68,
			height : height * 0.48
		});
		$("#home-panel-pie").panel({
			width : width * 0.3,
			height : height * 0.48
		});
		$("#home-panel-line").panel({
			width : width * 0.68,
			height : height * 0.48
		});
	});
function getDateStr(temp){
   var year=temp.getFullYear();
   var month=temp.getMonth() < 9 ? "0" + (temp.getMonth()+1) : (temp.getMonth()+1);
   var day=temp.getDate() < 10 ? "0" + temp.getDate() : temp.getDate();
   var time=year+"-"+month+"-"+day
   return time;
} 
</script>
  </body>
</html>
