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
				url:'getCapaCityDetailByHour.do',
				rownumbers: true,
				showFooter: true,
				singleSelect:true,
				striped:true,
			">
		<thead frozen="true">
			<tr>
			    <th field="belongname" width="80" align="center" >生产中心</th>
				<th field="deptname" width="60" align="center" >生产部门</th>
				<th field="pono" width="100" align="center" >订单</th>
				<th field="productDate" width="80" align="center">生产日期</th>
			</tr>
		</thead>
		<thead>
			<tr>
			    <th colspan="1">类型</th>
				<th colspan="5">上午</th>
				<th colspan="6">下午</th>
				<th colspan="5">晚上</th>
				<th colspan="1">总计</th>
			</tr>
			<tr>
			    <th field="gname" width="55" align="center"></th>
			    <th field="g7" width="55" align="center" >7</th>
				<th field="g8" width="55" align="center" >8</th>
				<th field="g9" width="55" align="center" >9</th>
				<th field="g10" width="55" align="center" >10</th>
				<th field="g11" width="55" align="center" >11</th>
				<th field="g12" width="55" align="center" >12</th>
				<th field="g13" width="55" align="center" >13</th>
				<th field="g14" width="55" align="center" >14</th>
				<th field="g15" width="55" align="center" >15</th>
				<th field="g16" width="55" align="center" >16</th>
				<th field="g17" width="55" align="center" >17</th>
				<th field="g18" width="55" align="center" >18</th>
				<th field="g19" width="55" align="center" >19</th>
				<th field="g20" width="55" align="center" >20</th>
				<th field="g21" width="55" align="center" >21</th>	
				<th field="g22" width="55" align="center" >22</th>			
				<th field="gtotal" width="80" align="center" ></th>
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
        $(function(){
           //datagrid展开
           $("#tg").datagrid({
                view:detailview,
                detailFormatter:function(index,row){
                    var tdb7=row.b7;
                    var tdb8=row.b8;
                    var tdb9=row.b9;
                    var tdb10=row.b10;
                    var tdb11=row.b11;
                    var tdb12=row.b12;
                    var tdb13=row.b13;
                    var tdb14=row.b14;
                    var tdb15=row.b15;
                    var tdb16=row.b16;
                    var tdb17=row.b17;
                    var tdb18=row.b18;
                    var tdb19=row.b19;
                    var tdb20=row.b20;
                    var tdb21=row.b21;
                    var tdbtotal=row.btotal;
                    var tdbr7=row.b7/row.t7;
                    var tdbr8=row.b8/row.t8;
                    var tdbr9=row.b9/row.t9;
                    var tdbr10=row.b10/row.t10;
                    var tdbr11=row.b11/row.t11;
                    var tdbr12=row.b12/row.t12;
                    var tdbr13=row.b13/row.t13;
                    var tdbr14=row.b14/row.t14;
                    var tdbr15=row.b15/row.t15;
                    var tdbr16=row.b16/row.t16;
                    var tdbr17=row.b17/row.t17;
                    var tdbr18=row.b18/row.t18;
                    var tdbr19=row.b19/row.t19;
                    var tdbr20=row.b20/row.t20;
                    var tdbr21=row.b21/row.t21;
                    var tdbrtotal=row.btotal/row.ttotal;
                    
                   
                    
                    if(tdb7>0){
                       tdb7='<td style="border:0;width:60px;color:red;">' + tdb7+ '<td>';
                    }else{
                       tdb7='<td style="border:0;width:60px;">' + tdb7+ '<td>';
                    }
                    if(tdb8>0){
                       tdb8='<td style="border:0;width:60px;color:red;">' + tdb8+ '<td>';
                    }else{
                       tdb8='<td style="border:0;width:60px;">' + tdb8+ '<td>';
                    }
                    if(tdb9>0){
                       tdb9='<td style="border:0;width:60px;color:red;">' + tdb9+ '<td>';
                    }else{
                       tdb9='<td style="border:0;width:60px;">' + tdb9+ '<td>';
                    }
                    if(tdb10>0){
                       tdb10='<td style="border:0;width:60px;color:red;">' + tdb10+ '<td>';
                    }else{
                       tdb10='<td style="border:0;width:60px;">' + tdb10+ '<td>';
                    }
                    if(tdb11>0){
                       tdb11='<td style="border:0;width:60px;color:red;">' + tdb11+ '<td>';
                    }else{
                       tdb11='<td style="border:0;width:60px;">' + tdb11+ '<td>';
                    }
                    if(tdb12>0){
                       tdb12='<td style="border:0;width:60px;color:red;">' + tdb12+ '<td>';
                    }else{
                       tdb12='<td style="border:0;width:60px;">' + tdb12+ '<td>';
                    }
                    if(tdb13>0){
                       tdb13='<td style="border:0;width:60px;color:red;">' + tdb13+ '<td>';
                    }else{
                       tdb13='<td style="border:0;width:60px;">' + tdb13+ '<td>';
                    }
                    if(tdb14>0){
                       tdb14='<td style="border:0;width:60px;color:red;">' + tdb14+ '<td>';
                    }else{
                       tdb14='<td style="border:0;width:60px;">' + tdb14+ '<td>';
                    }
                    if(tdb15>0){
                       tdb15='<td style="border:0;width:60px;color:red;">' + tdb15+ '<td>';
                    }else{
                       tdb15='<td style="border:0;width:60px;">' + tdb15+ '<td>';
                    }
                    if(tdb16>0){
                       tdb16='<td style="border:0;width:60px;color:red;">' + tdb16+ '<td>';
                    }else{
                       tdb16='<td style="border:0;width:60px;">' + tdb16+ '<td>';
                    }
                    if(tdb17>0){
                       tdb17='<td style="border:0;width:60px;color:red;">' + tdb17+ '<td>';
                    }else{
                       tdb17='<td style="border:0;width:60px;">' + tdb17+ '<td>';
                    }
                    if(tdb18>0){
                       tdb18='<td style="border:0;width:60px;color:red;">' + tdb18+ '<td>';
                    }else{
                       tdb18='<td style="border:0;width:60px;">' + tdb18+ '<td>';
                    }
                    if(tdb19>0){
                       tdb19='<td style="border:0;width:60px;color:red;">' + tdb19+ '<td>';
                    }else{
                       tdb19='<td style="border:0;width:60px;">' + tdb19+ '<td>';
                    }
                    if(tdb20>0){
                       tdb20='<td style="border:0;width:60px;color:red;">' + tdb20+ '<td>';
                    }else{
                       tdb20='<td style="border:0;width:60px;">' + tdb20+ '<td>';
                    }
                    if(tdb21>0){
                       tdb21='<td style="border:0;width:60px;color:red;">' + tdb21+ '<td>';
                    }else{
                       tdb21='<td style="border:0;width:60px;">' + tdb21+ '<td>';
                    }
                    if(tdbtotal>0){
                       tdbtotal='<td style="border:0;width:60px;color:red;">' + tdbtotal+ '<td>';
                    }else{
                       tdbtotal='<td style="border:0;width:60px;">' + tdbtotal+ '<td>';
                    }
                    
                    if(row.t7==0||tdbr7==0){
                        tdbr7='<td style="border:0;width:60px;">0<td>';
                    }else if(tdbr7>0.02){
                       tdbr7='<td style="border:0;width:60px;color:red;">' + (100*tdbr7).toFixed(2)+ '%<td>';
                    }else{
                       tdbr7='<td style="border:0;width:60px;color:green;">' +(100*tdbr7).toFixed(2)+ '%<td>';
                    }
                    if(row.t8==0||tdbr8==0){
                        tdbr8='<td style="border:0;width:60px;">0<td>';
                    }else if(tdbr8>0.02){
                       tdbr8='<td style="border:0;width:60px;color:red;">' + (100*tdbr8).toFixed(2)+ '%<td>';
                    }else{
                       tdbr8='<td style="border:0;width:60px;color:green;">' +(100*tdbr8).toFixed(2)+ '%<td>';
                    }
                    if(row.t9==0||tdbr9==0){
                        tdbr9='<td style="border:0;width:60px;">0<td>';
                    }else if(tdbr9>0.02){
                       tdbr9='<td style="border:0;width:60px;color:red;">' + (100*tdbr9).toFixed(2)+ '%<td>';
                    }else{
                       tdbr9='<td style="border:0;width:60px;color:green;">' +(100*tdbr9).toFixed(2)+ '%<td>';
                    }
                    if(row.t10==0||tdbr10==0){
                        tdbr10='<td style="border:0;width:60px;">0<td>';
                    }else if(tdbr10>0.02){
                       tdbr10='<td style="border:0;width:60px;color:red;">' + (100*tdbr10).toFixed(2)+ '%<td>';
                    }else{
                       tdbr10='<td style="border:0;width:60px;color:green;">' +(100*tdbr10).toFixed(2)+ '%<td>';
                    }
                    if(row.t11==0||tdbr11==0){
                        tdbr11='<td style="border:0;width:60px;">0<td>';
                    }else if(tdbr11>0.02){
                       tdbr11='<td style="border:0;width:60px;color:red;">' + (100*tdbr11).toFixed(2)+ '%<td>';
                    }else{
                       tdbr11='<td style="border:0;width:60px;color:green;">' +(100*tdbr11).toFixed(2)+ '%<td>';
                    }
                    if(row.t12==0||tdbr12==0){
                        tdbr12='<td style="border:0;width:60px;">0<td>';
                    }else if(tdbr12>0.02){
                       tdbr12='<td style="border:0;width:60px;color:red;">' + (100*tdbr12).toFixed(2)+ '%<td>';
                    }else{
                       tdbr12='<td style="border:0;width:60px;color:green;">' +(100*tdbr12).toFixed(2)+ '%<td>';
                    }
                    if(row.t13==0||tdbr13==0){
                        tdbr13='<td style="border:0;width:60px;">0<td>';
                    }else if(tdbr13>0.02){
                       tdbr13='<td style="border:0;width:60px;color:red;">' + (100*tdbr13).toFixed(2)+ '%<td>';
                    }else{
                       tdbr13='<td style="border:0;width:60px;color:green;">' +(100*tdbr13).toFixed(2)+ '%<td>';
                    }
                    if(row.t14==0||tdbr14==0){
                        tdbr14='<td style="border:0;width:60px;">0<td>';
                    }else if(tdbr14>0.02){
                       tdbr14='<td style="border:0;width:60px;color:red;">' + (100*tdbr14).toFixed(2)+ '%<td>';
                    }else{
                       tdbr14='<td style="border:0;width:60px;color:green;">' +(100*tdbr14).toFixed(2)+ '%<td>';
                    }
                    if(row.t15==0||tdbr15==0){
                        tdbr15='<td style="border:0;width:60px;">0<td>';
                    }else if(tdbr15>0.02){
                       tdbr15='<td style="border:0;width:60px;color:red;">' + (100*tdbr15).toFixed(2)+ '%<td>';
                    }else{
                       tdbr15='<td style="border:0;width:60px;color:green;">' +(100*tdbr15).toFixed(2)+ '%<td>';
                    }
                    if(row.t16==0||tdbr16==0){
                        tdbr16='<td style="border:0;width:60px;">0<td>';
                    }else if(tdbr16>0.02){
                       tdbr16='<td style="border:0;width:60px;color:red;">' + (100*tdbr16).toFixed(2)+ '%<td>';
                    }else{
                       tdbr16='<td style="border:0;width:60px;color:green;">' +(100*tdbr16).toFixed(2)+ '%<td>';
                    }
                    if(row.t17==0||tdbr17==0){
                        tdbr17='<td style="border:0;width:60px;">0<td>';
                    }else if(tdbr17>0.02){
                       tdbr17='<td style="border:0;width:60px;color:red;">' + (100*tdbr17).toFixed(2)+ '%<td>';
                    }else{
                       tdbr17='<td style="border:0;width:60px;color:green;">' +(100*tdbr17).toFixed(2)+ '%<td>';
                    }
                    if(row.t18==0||tdbr18==0){
                        tdbr18='<td style="border:0;width:60px;">0<td>';
                    }else if(tdbr18>0.02){
                       tdbr18='<td style="border:0;width:60px;color:red;">' + (100*tdbr18).toFixed(2)+ '%<td>';
                    }else{
                       tdbr18='<td style="border:0;width:60px;color:green;">' +(100*tdbr18).toFixed(2)+ '%<td>';
                    }
                    if(row.t19==0||tdbr19==0){
                        tdbr19='<td style="border:0;width:60px;">0<td>';
                    }else if(tdbr19>0.02){
                       tdbr19='<td style="border:0;width:60px;color:red;">' + (100*tdbr19).toFixed(2)+ '%<td>';
                    }else{
                       tdbr19='<td style="border:0;width:60px;color:green;">' +(100*tdbr19).toFixed(2)+ '%<td>';
                    }
                    if(row.t20==0||tdbr20==0){
                        tdbr20='<td style="border:0;width:60px;">0<td>';
                    }else if(tdbr20>0.02){
                       tdbr20='<td style="border:0;width:60px;color:red;">' + (100*tdbr20).toFixed(2)+ '%<td>';
                    }else{
                       tdbr20='<td style="border:0;width:60px;color:green;">' +(100*tdbr20).toFixed(2)+ '%<td>';
                    }
                    if(row.t21==0||tdbr21==0){
                        tdbr21='<td style="border:0;width:60px;">0<td>';
                    }else if(tdbr21>0.02){
                       tdbr21='<td style="border:0;width:60px;color:red;">' + (100*tdbr21).toFixed(2)+ '%<td>';
                    }else{
                       tdbr21='<td style="border:0;width:60px;color:green;">' +(100*tdbr21).toFixed(2)+ '%<td>';
                    }
                    if(row.ttotal==0||tdbrtotal==0){
                        tdbrtotal='<td style="border:0;width:60px;">0<td>';
                    }else if(tdbrtotal>0.02){
                       tdbrtotal='<td style="border:0;width:60px;color:red;">' + (100*tdbrtotal).toFixed(2)+ '%<td>';
                    }else{
                       tdbrtotal='<td style="border:0;width:60px;color:green;">' +(100*tdbrtotal).toFixed(2)+ '%<td>';
                    }
                    return '<table style="border:0;text-align:center;cellpadding:0;cellspacing:0;"><tr style="border:0;">' +
                            '<td style="border:0;width:60px;">' + row.bname + '<td>' +
                            tdb7 +tdb8 + tdb9 + tdb10 + tdb11 + tdb12 + tdb13 + tdb14 + tdb15 + tdb16 + tdb17 + 
                            tdb18 + tdb19 + tdb20 + tdb21 + tdbtotal+'</tr><tr style="border:0;">' +
                            '<td style="border:0;width:60px;">坏品率<td>' +tdbr7+
                            tdbr8 + tdbr9 + tdbr10 + tdbr11 + tdbr12 + tdbr13 + tdbr14 + tdbr15 + tdbr16 + tdbr17 +
                            tdbr18 + tdbr19 + tdbr20 + tdbr21 + tdbrtotal+
                            '</tr></table>';
                },
           });
        });
	</script>
</body>
</html>
