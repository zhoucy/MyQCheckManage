<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<c:set var="ctx" value="${pageContext.request.contextPath }" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<jsp:include page="../inc.jsp"></jsp:include>
<meta charset="utf-8">
<style type="text/css">
.panel-body {border:0;}
</style>
</head>
<body>
       <table id="tg" title="" class="easyui-datagrid" style="width:auto;height:auto" fit="true"
            toolbar="#searchtool"
			data-options="
				url:'getCapaCityDetailByWorkHour.do',
				rownumbers: true,
				showFooter: true,
				singleSelect:true,
				onLoadSuccess: onLoadSuccess,
				onDblClickCell:doubleClick,
				rowStyler:stylefunction,
			">
		<thead frozen="true">
			<tr>
				<th field="belongname" width="120" align="center" formatter="formatcenter">生产中心</th>
				<th field="groupname" width="120" align="center" formatter="formatdept">生产部门</th>
				<th field="pono" width="120" align="center" formatter="formatpono">订单</th>
				<th field="prodate" width="120" align="center" hidden="true">生产日期</th>
				<th field="protype" width="120" align="center">类型</th>
			</tr>
		</thead>
		<thead>
			<tr>
				<th colspan="4">上午</th>
				<th colspan="4">下午</th>
				<th colspan="3">晚上</th>
				<th colspan="1">合计</th>
			</tr>
			<tr>
				<th field="h1" width="60" align="center" formatter="format">1</th>
				<th field="h2" width="60" align="center" formatter="format">2</th>
				<th field="h3" width="60" align="center" formatter="format">3</th>
				<th field="h4" width="60" align="center" formatter="format">4</th>
				<th field="h5" width="60" align="center" formatter="format">5</th>
				<th field="h6" width="60" align="center" formatter="format">6</th>
				<th field="h7" width="60" align="center" formatter="format">7</th>
				<th field="h8" width="60" align="center" formatter="format">8</th>
				<th field="h9" width="60" align="center" formatter="format">9</th>
				<th field="h10" width="60" align="center" formatter="format">10</th>
				<th field="h11" width="60" align="center" formatter="format">11</th>
				<th field="total" width="60" align="center" formatter="format"></th>
			</tr>
		</thead>
	</table>
	<div id="searchtool" style="padding:5px">  
	    <table>
	       <tr>
	            <td>生产日期:</td><td><input class="easyui-datebox" id="proDate" size="12"/></td>
	            <td>生产中心:</td><td><input id="belongname" size="12"/></td>
	            <td>生产部门:</td><td><input id="groupname" size="12"/></td>
	            <td>订单编号:</td><td><input id="pono" size="12"/></td>
	            <td>刷新间隔:</td><td><input id="reflash" class="easyui-combobox" style="width:90px;" data-options="
                           panelHeight:'auto',
                           onSelect:reflashfun,
		                   valueField: 'label',
		                   textField: 'value',
		                   data: [{label: '60000',value: '一分钟'
		                        },{label: '180000',value: '三分钟'
		                        },{label: '300000',value: '五分钟',selected:'true'
		                        },{label: '600000',value: '十分钟'
		                        },{label: '1800000',value: '半小时'
		                        },{label: '3600000',value: '一小时'
		                   }]" /></td>
		        <td>显示内容:</td><td><input id="show" class="easyui-combobox" style="width:90px;" data-options="
                           panelHeight:'auto',
                           onSelect:showfun,
		                   valueField: 'label',
		                   textField: 'value',
		                   data: [{label: 'default',value: '默认',selected:'true'
		                        },{label: 'nopono',value: '生产部门'
		                        },{label: 'nogroup',value: '生产中心',
		                        },{label: 'all',value: '汇总显示'
		                   }]" /></td>
		        <td>显示底部: <input type="checkbox" checked onchange="$('#tg').datagrid({showFooter:$(this).is(':checked')});"></td>
	            <td><a href="javascript:searchCapacity()" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a></td>
	            <td><a href="javascript:clearCapacity()" class="easyui-linkbutton" data-options="iconCls:'icon-myclear'">清空</a></td>	            
		   </tr>
	    </table>  
    <div>
    <div id="dlg" class="easyui-dialog" style="left:300px;top:5px;width:350px;height:330px;"closed="true" >
    <table id="pg" fit="true"></table></div> 
    <div id="dlg2" class="easyui-dialog" style="left:660px;top:5px;width:350px;height:480px;"closed="true">
    <table id="pg2" fit="true"></table></div>  
    <div id="dlg3" class="easyui-dialog" style="left:0;top:240px;width:640px;height:300px;"closed="true" 
                   collapsible="true" resizable="true" maximizable="true">
    <table id="pg3" style="width:300px"></table></div>    
	<script type="text/javascript">
	
	var showgroup="";
	var showbelong="";
	var showpono="";
	var reflashsecond=300000;
	var interval=0;
         function searchCapacity(){
              $("#tg").datagrid('load',{
                  proDate:$("#proDate").combo('getValue'),
                  groupname:$("#groupname").val(),
                  belongname:$("#belongname").val(),
                  pono:$("#pono").val(),
                  showgroup:showgroup,
                  showbelong:showbelong,
                  showpono:showpono,
              });
         }
         function clearCapacity(){
             $("#proDate").combo('clear');
             $("#groupname").val("");
             $("#belongname").val("");
             $("#pono").val("");
             searchCapacity();
         }
         function showfun(){
             var choose=$("#show").combobox('getValue');
             console.log(choose);
             if(choose=='nopono'){
                showgroup="";
                showbelong="";
                showpono="on";
             }else if(choose=='nogroup'){
                showgroup="on";
                showbelong="";
                showpono="on";
             }else if(choose=='all'){
                showgroup="on";
                showbelong="on";
                showpono="on";
             }else{
                showgroup="";
                showbelong="";
                showpono="";
             }
             searchCapacity();
         }
         function reflashCapacity(){ //如果是当天自动刷新,否则不刷新,减轻数据库的负担
             var nowDate=new Date();
             var myDate=$("#proDate").combo('getValue');
             var lala=nowDate.getFullYear()
                + "-"
                + ((nowDate.getMonth() + 1) > 10 ? (nowDate.getMonth() + 1) : "0"
                        + (nowDate.getMonth() + 1))
                + "-"
                + (nowDate.getDate() < 10 ? "0" + nowDate.getDate() : nowDate
                        .getDate());
             if(myDate==""||lala==myDate){
                 console.log(nowDate);
                 $("#tg").datagrid('reload');
             }
         }
         //格式化
         function format(val,row,index){
            if(row.sort==1){
               return val;
            }
            if(row.sort==2){
               if(val>0){
                 return '<span style="color:red;background-color: yellow;"><a href="#" title="双击查看坏机信息" class="easyui-tooltip">'
                         +val+'</a></span>';
               }else{
                 return val;
               }             
            }
            if(row.sort==3){
               if(val==0){
                  return 0;
               }else{
                 var c=val/100;
                 if(c<=2){
                   return '<span style="color:green;">'+c.toFixed(2)+'%</span>';
                 }else{
                   return '<span style="color:red;">'+c.toFixed(2)+'%</span>';
                 }
               }
            }
         }
         //格式化生产中心,增加悬浮事件
         function formatcenter(val,row,index){
             if(val!=undefined){return '<a href="#" title="双击显示详细信息" class="easyui-tooltip">'+val+'</a>';}		     
		 }
		 //格式化部门,增加悬浮事件
		 function formatdept(val,row,index){	 
		     if(val!=undefined){return '<a href="#" title="双击显示详细信息" class="easyui-tooltip">'+val+'</a>';}
		 }	
		 //格式化订单信息,增加悬浮事件
		 function formatpono(val,row,index){		 
		    if(val!=undefined){return '<a href="#" title="双击显示详细信息" class="easyui-tooltip">'+val+'</a>';}
		 }
          //合并单元格
        function onLoadSuccess(data){
            //rows.length是记录数,也就是总行数
            var rows= $('#tg').datagrid('getRows'); 
			for(var i=0; i<(rows.length)/3; i++){
				$(this).datagrid('mergeCells',{
					index: 3*i,
					field: 'groupname',
					rowspan: 3
				});
				$(this).datagrid('mergeCells',{
					index: 3*i,
					field: 'pono',
					rowspan: 3
				});
				$(this).datagrid('mergeCells',{
					index: 3*i,
					field: 'belongname',
					rowspan: 3
				});
				$(this).datagrid('mergeCells',{
					index: 3*i,
					field: 'prodate',
					rowspan: 3
				});
			}
		}
		//双击单元格事件		
		 function doubleClick(index,field,value){		 
		    //先准备好三个参数,部门(比如A组),日期date,时间,时间小时hour
		    var hour=1;//
		    if(field=='total'){hour="";}else{hour=field.substring(1);}
		    var row = $('#tg').datagrid('getSelected');//双击必然会选中一行记录	    
		    var date=row.prodate;
		    var pono=row.pono;
		    var groupname=row.groupname;
		    var belongname=row.belongname;
		    //保留的值(暂时不用)	    
		    var type=row.protype;	    
		    if(value==0 || value==undefined){
		       //过滤掉无效的数据
		       return ;
		    }
		    //双击显示部门和生产中心信息
		    if(field=='groupname'||field=='belongname'){
		          showDept(index,field,value);
		    }
		    //双击显示订单信息
		    if(field=='pono'){
		          showPono(index,field,value,groupname,date);
		    }
		    //第二行才是坏品数(index+1)%3==2,过滤其他行,双击显示坏机信息
		    if(index!=null&&(index+1)%3==2){
		          showDefective(date,hour,pono,groupname,belongname);	       
		    }	    		    
		 }
		 //显示坏机的信息
		 function showDefective(date,hour,pono,groupname,belongname){
		       $('#dlg3').dialog('open').dialog('setTitle','坏机信息');
               $('#pg3').datagrid({  
                 fit:true, 
                 url:'getDefective.do',
                 
                 queryParams: {
		                       date: date,
		                       hour: hour,
		                       pono:pono,
		                       groupname:groupname,
		                       belongname:belongname,
	             },                      
                 columns:[[    
                 {field:'badcode',title:'坏项编码',width:60,align:'center'},    
                 {field:'badname',title:'坏项名称',width:150,align:'center'},    
                 {field:'badtime',title:'录入时间',width:150,align:'center'},
                 {field:'badpono',title:'订单编号',width:80,align:'center'}, 
                 {field:'badgroup',title:'生产拉别',width:60,align:'center'},
                 {field:'badbelong',title:'生产中心',width:80,align:'center'},    
                 ]]});
		 }
		 	 
		 //显示部门信息
		 function showDept(index,field,value){
                $('#dlg').dialog('open').dialog('setTitle',value+'部门信息');
                $('#pg').propertygrid({    
                        url: 'getDeptByDeptName.do', 
                        queryParams: {
		                       deptname: value,
	                    },    
                        showGroup: true,    
                        scrollbarSize: 0    
                }); 
		 }
		 //显示订单信息
		 function showPono(index,field,value,groupname,date){
		        $('#dlg2').dialog('open').dialog('setTitle',value+'订单信息');
                $('#pg2').propertygrid({    
                        url: 'getPonoInfoByPono.do',
                        queryParams: {
		                       deptname: groupname,
		                       date: date,
		                       pono:value
	                    },      
                        showGroup: true,    
                        scrollbarSize: 0    
                }); 
		 }
	
	     //背景色
	     function stylefunction(index,row){
	         if(index%3==0){
	             return 'background-color:#E5E5E5'; 
	         }
	     }
	     //刷新间隔
	     function reflashfun(){
	        reflashsecond=$("#reflash").combo('getValue');
	        clearInterval(interval);
	        interval=setInterval("reflashCapacity()",reflashsecond);
	     }
         $(function(){
            //刷新间隔          
            interval=setInterval("reflashCapacity()",reflashsecond);
         });
        
	</script>
</body>
</html>
