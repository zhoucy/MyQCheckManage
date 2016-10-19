<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>
    <meta charset="utf-8">
    <title></title>
    <jsp:include page="../inc.jsp"></jsp:include>
<script type="text/javascript">

$(function(){
    getline();
    setInterval("getline()",1000*600);
});
function getline(){
   $.ajax({
       type:'post',
       url:'${ctx}/qc/getTodayCapacityOfIndex.do',
       data:{},
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
            text: null,
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
             y: 0
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
    <div  id="container1" style="width:950px;height:269px;"></div>
  </body>
</html>
