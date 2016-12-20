<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>
    <meta charset="utf-8">
    <title></title>
    <jsp:include page="../inc.jsp"></jsp:include>
    <script type="text/javascript" src="${ctx}/Highcharts/js/highcharts.js"></script>
<style type="text/css">
.panel-body {border:0;}
</style>
<script type="text/javascript">
var date=null;
var groupid=null;
var number=0;
$(function(){
   getline();
});
function getline(){
   $.ajax({
       type:'post',
       url:'${ctx}/qc/getProductPerHourHighCharts.do',
       data:{date:date,groupid:groupid,n:number},
       dataType:'json',
       success:function(result){
           highcharts(result);
       }
   });
}
function highcharts(result){
var chart1=$("#container1").highcharts({
        chart: {
            type: 'line'
        },
        exporting: {
		     enabled: false
        },
        title: {
             text:'标题栏'
        },
        subtitle: {
            text: null,
        },
        xAxis: {
            categories: result.xAxis
        },
        yAxis: {
            title: {
                text: '产量(个)'
            }
        },
        legend: {
             align: 'right',
             verticalAlign: 'top',
             x: 0,
             y: 60
        },
        plotOptions: {
            enabled: false
        },
        credits: {
            enabled: false
        },
        series: result.series
    });
}
</script>
  </head>
  <body>
  <div class="easyui-panel" fit="true">
    <table>
           <tr>
               <td>组别:</td><td><input class="easyui-combobox" data-options="
                                              url:'${ctx}/qc/getAllDept.do',
                                              valueField:'id',
                                              textField:'name',
                                              panelHeight:'auto',
                                              onSelect:function(record){                                              
                                                 groupid=record.id!=1?record.id:null;                                                 
                                                 getline();
                                              }
                                              "></td>
               <td>天数:</td><td><input class="easyui-combobox" data-options="
		                                    valueField: 'id',
		                                    textField: 'value',
		                                    panelHeight:'auto',		                                    
		                                    data: [{id: '0',value: '1天'
		                                         },{id: '1',value: '2天'
		                                         },{id: '2',value: '3天',
		                                         },{id: '3',value: '4天'
		                                         },{id: '4',value: '5天'
		                                         },{id: '5',value: '6天'
		                                         },{id: '6',value: '7天'
		                                    }],
		                                    onSelect:function(record){
                                                 number=record.id;
                                                 getline();
                                              }
		                                    "/></td>
		      <td>日期:</td><td><input class="easyui-datebox"  value=" " data-options="
                                              onSelect:function(){                                             
                                                 date=$(this).datebox('getValue');                                             
                                                 getline();
                                              }
                                              "></td>
           </tr>
    </table>
    <div  id="container1" style="width:100%;height:95%;"></div>
  </div>
  </body>
</html>
