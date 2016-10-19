<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="shortcut icon" href="img/logo2.png" type="image/x-icon" />
  <title>东莞港电电器</title>
  <jsp:include page="inc.jsp"/>
  </head>
  
  <body class="easyui-layout">
		    <!-- 上部-->
		    <div id="layout-top" data-options="region:'north',split:true,border:false,href:'${pageContext.request.contextPath}/north.jsp'"
		                      style="padding:0;height:80px;background:#515151;"></div>
		    <!-- 下部版权信息 -->
		    <div id="layout-bottom" data-options="region:'south',split:true,border:false,href:'${pageContext.request.contextPath}/south.jsp'" 
		                      style="padding:0;height:28px;background:#515151;"></div>	
		    <!-- 中间信息展示部分 -->		
			<div id="layout-center" data-options="region:'center',split:true,border:false,href:'${pageContext.request.contextPath}/center.jsp'" 
			                  style="padding:0;"></div>
			<!-- 左侧导航条 -->
			<div id="layout-left" data-options="region:'west',split:true,border:true,href:'${pageContext.request.contextPath}/west.jsp',
			                  title:'<p></p>',collapsible:false,onBeforeLoad:ServerCurrentTime()" 
			                  style="padding:0;width:170px;">
			<!-- 右侧信息栏(不显示) -->
			<div id="layout-right" data-options="region:'east',split:true,closed:true,border:false,"
			                 style="padding:0;"></div>
<script type="text/javascript">
//当前时间
function ServerCurrentTime(){
    var now = new Date();
    var year = now.getFullYear();
    var month = now.getMonth();
    var date = now.getDate();
    var day = now.getDay();
    var hour = now.getHours();
    var minu = now.getMinutes();
    var sec = now.getSeconds();
    var week;
    month = month + 1;
    if (month < 10) month = "0" + month;
    if (date < 10) date = "0" + date;
    if (hour < 10) hour = "0" + hour;
    if (minu < 10) minu = "0" + minu;
    if (sec < 10) sec = "0" + sec;
    var arr_week = new Array("星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六");
    week = arr_week[day];
    var time = "";
    time = year + "年" + month + "月" + date + "日" + " " + hour + ":" + minu + ":" + sec;  
    $("p").text(time);
    var timer = setTimeout("ServerCurrentTime()", 1000);
}   
</script>			
</body>
</html>
