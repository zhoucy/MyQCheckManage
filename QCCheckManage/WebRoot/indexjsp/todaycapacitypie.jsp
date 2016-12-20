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
    getpie();
    setInterval("getpie()",1000*600);
});
function getpie(){
   $.ajax({
       type:'post',
       url:'${ctx}/qc/getTodayTypeOfIndex.do',
       data:{},
       dataType:'json',
       success:function(result){
           piehighcharts(result);
       }
   });
}
function piehighcharts(result){
var  chart2=$("#container2").highcharts({
         chart: { renderTo: 'container2', plotShadow: false }, 
         exporting: {enabled: false},
         credits: {enabled: false},
         title: { text: null }, 
         legend: {enabled: false,layout: 'vertical', align: 'left', verticalAlign: 'top', x: 0, y: 140, floating: true, borderWidth: 0, backgroundColor: '#FFFFFF'},
         tooltip: { pointFormat: '{series.name}: <span style="color:red">{point.y}</span>' },
         plotOptions: { pie: { allowPointSelect: true, cursor: 'pointer', dataLabels: { enabled: false }, showInLegend: true } },
         series: [{ type: 'pie', 
                    name: '数量',
                    dataLabels: {enabled: true,
                                 formatter:function(){
                                    return this.point.name+':'+this.point.percentage.toFixed(2)+'%';
                                 }},
                    data:result
                 }]
     });
}
</script>
  </head>
  <body>
    <div  id="container2" style="width:100%;height:100%;"></div>
  </body>
</html>
