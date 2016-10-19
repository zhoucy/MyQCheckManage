<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <jsp:include page="inc.jsp"/>
  <script type="text/javascript"> 
   
       $(document).ready(function () {  
           $('.easyui-accordion li a').click(function () {  
               var tabTitle = $(this).text();  
               var url = $(this).attr("way");  
               var icon=$(this).attr("iconcls");
               addTab(tabTitle, url,icon);  
           });  
   
           function addTab(subtitle, url,icon) {  
               if (!$('#tabs').tabs('exists', subtitle)) {  
                   $('#tabs').tabs('add', {  
                       title: subtitle,  
                       content: createFrame(url),  
                       closable: true, 
                       iconCls:icon,
                   });  
               } else {  
                   $('#tabs').tabs('select', subtitle);  
               }  
           }  
   
   
           function createFrame(url) {  
               var s = '<iframe name="mainFrame" scrolling="auto" frameborder="0"  src="' + url + '" style="width:100%;height:100%;"></iframe>';  
               return s;  
           } 
           
   
       });
  </script>
</head>
<body>


<div region="west" split="true" class="easyui-panel" title="导航菜单" style="width: 250px;">    
        <div id="aa" class="easyui-accordion" style="position: absolute; top: 27px; left: 0px; right: 0px; bottom: 0px;padding:0;">    
            <div title="生产管理" iconcls="icon-myproduct" style="overflow: auto; padding: 10px;height:70%;">
				<ul>
					<li><span><a class="easyui-linkbutton" iconcls="icon-myproductmanger" plain="true" target="mainFrame" style="width:150px;text-align:left;" way="qc/QCProject.jsp">不良项目管理</a></span></li>
					<li><span><a class="easyui-linkbutton" iconcls="icon-myproductmanger" plain="true" target="mainFrame" style="width:150px;text-align:left;" way="qc/QCProductCode.jsp">延误代码管理</a></span></li>
					<li><span><a class="easyui-linkbutton" iconcls="icon-myproductmanger" plain="true" target="mainFrame" style="width:150px;text-align:left;" way="qc/QCProductionPlan.jsp">生产计划管理</a></span></li>
					<li><span><a class="easyui-linkbutton" iconcls="icon-myproductmanger" plain="true" target="mainFrame" style="width:150px;text-align:left;" way="qc/QCGroup.jsp">生产组别</a></span></li>
					<li><span><a class="easyui-linkbutton" iconcls="icon-myproductmanger" plain="true" target="mainFrame" style="width:150px;text-align:left;" way="qc/ProductMain.jsp">订单生产信息</a></span></li>
					<li><span><a class="easyui-linkbutton" iconcls="icon-myproductmanger" plain="true" target="mainFrame" style="width:150px;text-align:left;" way="qc/ProductRecord.jsp">产品信息</a></span></li>
					<li><span><a class="easyui-linkbutton" iconcls="icon-myproductmanger" plain="true" target="mainFrame" style="width:150px;text-align:left;" way="qc/QCProgressManHour.jsp">产品工时工序</a></span></li>
					<li><span><a class="easyui-linkbutton" iconcls="icon-myproductmanger" plain="true" target="mainFrame" style="width:150px;text-align:left;" way="qc/QCProgress.jsp">工序信息</a></span></li>
					<li><span><a class="easyui-linkbutton" iconcls="icon-myproductmanger" plain="true" target="mainFrame" style="width:150px;text-align:left;" way="qc/QCProductType.jsp">产品类型信息</a></span></li>
					<li><span><a class="easyui-linkbutton" iconcls="icon-myproductmanger" plain="true" target="mainFrame" style="width:150px;text-align:left;" way="qc/CapaCityDetailByWorkHour.jsp">生产综合看板(工时)</a></span></li>
					<li><span><a class="easyui-linkbutton" iconcls="icon-myproductmanger" plain="true" target="mainFrame" style="width:150px;text-align:left;" way="qc/CapaCityDetailByHour.jsp">生产综合看板(时间)</a></span></li>
				</ul>
			</div>
			<div title="权限管理" iconcls="icon-mylimit"  style="padding: 10px;height:70%;">
                <ul>  
                    <li><span><a class="easyui-linkbutton" iconcls="icon-myuser" plain="true" target="mainFrame" style="width:150px;text-align:left;" way="qc/QCPermission.jsp">权限管理</a></span></li>
				    <li><span><a class="easyui-linkbutton" iconcls="icon-myuser" plain="true" target="mainFrame" style="width:150px;text-align:left;" way="qc/QCRole.jsp">角色管理</a></span></li>
				    <li><span><a class="easyui-linkbutton" iconcls="icon-myuser" plain="true" target="mainFrame" style="width:150px;text-align:left;" way="qc/QCUser.jsp">用户管理</a></span></li>
				</ul>
            </div>  
            <div title="部门管理" iconcls="icon-mydept"  style="padding: 10px;height:70%;">  
                 <ul>
                     <li><span><a class="easyui-linkbutton" iconcls="icon-mydept2" plain="true" target="mainFrame" style="width:150px;text-align:left;" way="qc/Department.jsp">部门概况</a></span></li>
                     <li><span><a class="easyui-linkbutton" iconcls="icon-mydept2" plain="true" target="mainFrame" style="width:150px;text-align:left;" way="qc/QCEmployee.jsp">雇员信息</a></span></li>
                 </ul> 
            </div> 
			<div title="报表管理" iconcls="icon-myreport"  style="padding: 10px;height:70%;"> 
			    <ul> 
                    <li><span><a class="easyui-linkbutton" iconcls="icon-myreport2" plain="true" target="mainFrame" style="width:150px;text-align:left;" way="report/QCReport_easyui.jsp">QC检查记录表</a></span></li>
				    <li><span><a class="easyui-linkbutton" iconcls="icon-myreport2" plain="true" target="mainFrame" style="width:150px;text-align:left;"  way="report/QCGoodProject_easyui.jsp">良品条形码</a></span></li>
				    <li><span><a class="easyui-linkbutton" iconcls="icon-myreport2" plain="true" target="mainFrame" style="width:150px;text-align:left;"  way="report/QCBadProject_easyui.jsp">不良品条形码</a></span></li>
				    <li><span><a class="easyui-linkbutton" iconcls="icon-myreport2" plain="true" target="mainFrame" style="width:150px;text-align:left;" way="report/QCDateReport_easyui.jsp">生产日报及汇总</a></span></li>
				    <li><span><a class="easyui-linkbutton" iconcls="icon-myreport2" plain="true" target="mainFrame" style="width:150px;text-align:left;" way="report/FQCDateRpt_easyui.jsp">FQC日报表及汇总</a></span></li>
				    <li><span><a class="easyui-linkbutton" iconcls="icon-myreport2" plain="true" target="mainFrame" style="width:150px;text-align:left;" way="report/badRateRpt_easyui.jsp">不良率推移图</a></span></li>
				    <li><span><a class="easyui-linkbutton" iconcls="icon-myreport2" plain="true" target="mainFrame" style="width:150px;text-align:left;" way="report/badRateSummaryRpt_easyui.jsp">不良率推移汇总</a></span></li>
				</ul>
            </div> 

             
            
            <div title="看板管理" iconcls="icon-mylookboard"  style="padding: 10px;height:70%;">
                <ul>  
                    <li><span><a class="easyui-linkbutton" iconcls="icon-mylookboard2" plain="true" target="mainFrame" style="width:150px;text-align:left;" way="board/QCBoard_easyui.jsp">生产日报看板</a></span></li>
                    <li><span><a class="easyui-linkbutton" iconcls="icon-mylookboard2" plain="true" target="mainFrame" style="width:150px;text-align:left;" way="board/QCBoard2_easyui.jsp">生产日报看板2</a></span></li>
                    <li><span><a class="easyui-linkbutton" iconcls="icon-mylookboard2" plain="true" target="mainFrame" style="width:150px;text-align:left;" way="board/QCBoardv2.jsp">生产日报看板v2.0</a></span></li>
				    <li><span><a class="easyui-linkbutton" iconcls="icon-mylookboard2" plain="true" style="width:150px;text-align:left;"  way="board/QCProductionBoard.jsp" >产能看板</a></span></li>				    
				    <li><span><a class="easyui-linkbutton" iconcls="icon-mylookboard2" plain="true" style="width:150px;text-align:left;" way="javascript:void(0)">其他</a></span></li>
				</ul>
            </div>  
            <div title="财务管理" iconcls="icon-mymoney"  style="padding: 10px;height:70%;">  
                                                           施工中....... 
            </div> 
            <div title="统计视图" iconcls="icon-mycharts"  style="padding: 10px;height:70%;"> 
               <ul>   
                   <li><span><a class="easyui-linkbutton" iconcls="icon-mypie" plain="true" target="mainFrame" style="width:150px;text-align:left;" way="report/HighChartsOfCapacity.jsp">产能品质统计</a></span></li> 
                   <li><span><a class="easyui-linkbutton" iconcls="icon-mypie" plain="true" target="mainFrame" style="width:150px;text-align:left;" way="report/HighChartsOfProductType.jsp">产品类型统计</a></span></li>                    
               </ul>
            </div> 
            <div title="基础数据" iconcls="icon-mydatabases"  style="padding: 10px;height:70%;">  
               <ul>   
                   <li><span><a class="easyui-linkbutton" iconcls="icon-mydatabase" plain="true" target="mainFrame" style="width:150px;text-align:left;" way="qc/QCWorkTime.jsp">工作时间</a></span></li>
                   <li><span><a class="easyui-linkbutton" iconcls="icon-mydatabase" plain="true" target="mainFrame" style="width:150px;text-align:left;" way="indexjsp/mytest.jsp">测试</a></span></li>
                   <li><span><a class="easyui-linkbutton" iconcls="icon-mydatabase" plain="true" target="mainFrame" style="width:150px;text-align:left;" way="indexjsp/MyJsp2.jsp">开卡界面</a></span></li>   
                   <li><span><a class="easyui-linkbutton" iconcls="icon-mydatabase" plain="true" target="mainFrame" style="width:150px;text-align:left;" way="indexjsp/swipemachine.jsp">卡机管理</a></span></li> 
                   <li><span><a class="easyui-linkbutton" iconcls="icon-mydatabase" plain="true" target="mainFrame" style="width:150px;text-align:left;" way="indexjsp/swiperepair.jsp">维修管理</a></span></li>                  
                   <li><span><a class="easyui-linkbutton" iconcls="icon-mydatabase" plain="true" target="mainFrame" style="width:150px;text-align:left;" way="indexjsp/qccheck.jsp">QC检测</a></span></li>                     
               </ul> 
            </div> 
        </div>  
</div>
</body>
</html>