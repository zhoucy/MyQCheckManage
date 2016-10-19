<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <jsp:include page="inc.jsp"/>
  </head> 
  <body>
	<div class="g-logo"><img  src="${pageContext.request.contextPath}/img/logo2.png"  height="50" width="60" ></div>
    <div class="g-top-title" style="padding:10px;">
    <span style="color:#FFFFFF;font-size:22px;">东莞港电电器制品有限公司管理系统</span><br>
    <span style="color:#FFFFFF;font-size:12px;">DONGGUAN KONG ELECTRICAL CO,LTD MANAGEMENT SYSTEM<span></div>
    
    
  <div class="right" style="padding:5px;">
          <a id="north-index" class="easyui-linkbutton" iconAlign="top" size="large" iconcls="icon-large-myindex" plain="true" href="javascript:void(0)" onclick="window.location.reload(true);"
              onmouseover="this.style.background='#4169E1'" onmouseout="this.style.background='transparent'"><span style="color:#FFFFFF;">系统首页</span></a>
          <a id="north-brower" class="easyui-linkbutton easyui-tooltip" iconAlign="top" size="large" iconcls="icon-large-mybrower" plain="true" href="javascript:void(0)" class="easyui-tooltip" data-options="					
					content: function(){
						return $('#brower-toolbar');
					},
					onShow: function(){
						var t = $(this);
					    t.tooltip('tip').unbind().bind('mouseenter', function(){
						t.tooltip('show');
					    }).bind('mouseleave', function(){
						t.tooltip('hide');
					    });
					}
				" onmouseover="this.style.background='#4169E1'" onmouseout="this.style.background='transparent'"><span style="color:#FFFFFF;">快捷导航</span></a>
          <a id="north-setting" class="easyui-linkbutton easyui-tooltip" iconAlign="top" size="large" iconcls="icon-large-mysetting" plain="true" href="javascript:void(0)" data-options="
					content: function(){
						return $('#setting-toolbar');
					},
					onShow: function(){
						var t = $(this);
					    t.tooltip('tip').unbind().bind('mouseenter', function(){
						t.tooltip('show');
					    }).bind('mouseleave', function(){
						t.tooltip('hide');
					    });
					}
				" onmouseover="this.style.background='#4169E1'" onmouseout="this.style.background='transparent'"><span style="color:#FFFFFF;">设置中心</span></a>
          <!-- <a id="north-skin" class="easyui-linkbutton" iconAlign="top" size="large" iconcls="icon-large-myskin" plain="true" href="javascript:void(0)" onclick=""><span style="color:#FFFFFF;">切换皮肤</span></a>
          <a id="north-user" class="easyui-linkbutton" iconAlign="top" size="large" iconcls="icon-large-myuser" plain="true" href="javascript:void(0)" onclick=""><span style="color:#FFFFFF;">个人中心</span></a> -->
          <a id="north-exit" class="easyui-linkbutton" iconAlign="top" size="large" iconcls="icon-large-myexit" plain="true" href="${pageContext.request.contextPath}/qc/logout.do"
             onmouseover="this.style.background='#4169E1'" onmouseout="this.style.background='transparent'"><span style="color:#FFFFFF;">安全退出</span></a>    
  </div>
  <!-- 快捷导航悬浮窗 -->
  <div style="display:none">
		<div id="brower-toolbar">
		    <a class="easyui-linkbutton" iconcls="icon-myproductmanger" plain="true" style="width:120px;text-align:left;" href="${pageContext.request.contextPath}/indexjsp/MyJsp2.jsp">生产开单</a><br>
		    <a class="easyui-linkbutton" iconcls="icon-undo" plain="true" style="width:120px;text-align:left;" href="${pageContext.request.contextPath}/qc/QCCheck.jsp">品质检测记录</a><br>
		    <a class="easyui-linkbutton" iconcls="icon-mylookboard2" plain="true" style="width:120px;text-align:left;" href="${pageContext.request.contextPath}/board/QCBoard.jsp">生产日报看板</a><br>
			<a class="easyui-linkbutton" iconcls="icon-mylookboard" plain="true" style="width:120px;text-align:left;" href="${pageContext.request.contextPath}/board/QCProductionBoard.jsp">产能看板</a><br>
			<a class="easyui-linkbutton" iconcls="icon-mycharts" plain="true" style="width:120px;text-align:left;" href="${pageContext.request.contextPath}/report/HighChartsOfCapacity.jsp" target="_blank">产能品质统计</a><br>
			<a class="easyui-linkbutton" iconcls="icon-mycharts" plain="true" style="width:120px;text-align:left;" href="${pageContext.request.contextPath}/report/HighChartsOfProductType.jsp" target="_blank">产品类型统计</a><br>
		</div>
  </div>
  <!-- 帮组中心悬浮窗 -->
  <div style="display:none">
		<div id="setting-toolbar">
		    <a class="easyui-linkbutton" iconcls="icon-mybluepling" plain="true" href="javascript:void(0)" onclick="showwinit()">技术支持</a><br>
		    <a class="easyui-linkbutton" iconcls="icon-myyellowpling" plain="true" href="javascript:void(0)" onclick="showwarning()">注意事项</a><br>
		    <a class="easyui-linkbutton" iconcls="icon-help" plain="true" href="javascript:void(0)" onclick="helpdocument();">帮组文档</a><br>
		    <!-- <a class="easyui-linkbutton" iconcls="icon-myonlinehelp" plain="true" href="javascript:void(0)" onclick="helponline();">在线求组</a><br>    --> 
		</div>
  </div>
  <!-- 技术支持弹窗 -->
<div id="win-it" class="easyui-window" title="技术支持" style="width:900px;height:auto;padding:25px"   
        data-options="collapsible:false,minimizable:false,maximizable:false,modal:true,closed:true">   
        <table class="reporttable">
           <thead><tr>
                <td>支持类型</td>
                <td>部门</td>
                <td>联系人</td>
                <td>职务</td>
                <td>联系方式</td>
                <td>办公电话</td>
           </tr></thead>
           <tbody><tr>
                <td>网络支持</td>
                <td>信息技术部(IT部)</td>
                <td>***</td>
                <td>处理网络故障</td>
                <td>*********</td>
                <td>8202</td>
           </tr>
           <tr>
                <td>系统故障</td>
                <td>信息技术部(IT部)</td>
                <td>周晨雨</td>
                <td>处理系统故障</td>
                <td>******</td>
                <td>8206</td>
           </tr>
           <tr>
                <td>系统故障</td>
                <td>信息技术部(IT部)</td>
                <td>张新洲</td>
                <td>处理系统故障</td>
                <td>********</td>
                <td>8207</td>
           </tr>
           <tr>
                <td>生产</td>
                <td>生产部</td>
                <td>***</td>
                <td>开单</td>
                <td>*********</td>
                <td>*********</td>
           </tr>
           </tbody>
        </table>
</div> 
<div id="win-helper" class="easyui-window" title="帮组文档" style="width:700px;height:auto;padding:25px"   
        data-options="collapsible:false,minimizable:false,maximizable:false,modal:true,closed:true">   
        <table class="reporttable">
           <thead><tr>
                <td width="10%">序号</td>
                <td width="30%">名称</td>
                <td width="15%">类型</td>
                <td width="30%">更新日期</td>
                <td width="15%">操作</td>
           </tr></thead>
           <tbody><tr>
                <td>1</td>
                <td>操作手册</td>
                <td>word</td>
                <td>2016-08-25</td>
                <td><a href="${pageContext.request.contextPath}/helpdocument/操作手册.docx">下载</a></td>
           </tr>
           <tr>
                <td>2</td>
                <td>看板管理</td>
                <td>word</td>
                <td>2016-08-25</td>
                <td><a href="${pageContext.request.contextPath}/helpdocument/看板管理.docx">下载</a></td>
           </tr>
           <tr>
                <td>3</td>
                <td>文具申请清单表</td>
                <td>excel</td>
                <td>2016-08-25</td>
                <td><a href="${pageContext.request.contextPath}/helpdocument/文具申请清单表.xls">下载</a></td>
           </tr></tbody>
        </table>
</div>
<div id="win-helponline" class="easyui-window" title="在线求组" style="width:700px;height:400px;padding:10px;"   
        data-options="collapsible:false,minimizable:false,maximizable:false,modal:true,closed:true">   
      <div class="easyui-layout" data-options="fit:true">
            <div data-options="region:'north',split:true" style="padding:0;width:auto;height:80px;">上部,说明错误信息(1号,软件故障.2号..)</div>
			<div data-options="region:'south',split:true,closed:true" style="padding:0;width:auto;height:auto;">下部,不显示</div>			
			<div data-options="region:'center',split:true" style="padding:0;width:auto;height:auto;">中间</div>
			<div data-options="region:'west',split:true" style="padding:0;width:100px;height:auto;">左侧,显示技术人员</div>
			<div data-options="region:'east',split:true" style="padding:0;width:100px;height:auto;">右侧,显示,对话人员的信息(姓名,职位..)</div>			
		</div>
</div>
<script type="text/javascript">
     function showwinit(){
          $("#win-it").window('open');  
     }
     function helpdocument(){
          $("#win-helper").window('open');
     }
     function showwarning(){
          successMsg("欢迎使用本系统......");
     }
     function helponline(){
          $("#win-helponline").window('open');
          //successMsg("施工中......");
     }
     function successMsg(msg){
            $.messager.alert('消息',msg,'info');                                  
            setTimeout("$('.messager-body').window('close');", 1200 );     
     }
</script>
  </body>
</html>