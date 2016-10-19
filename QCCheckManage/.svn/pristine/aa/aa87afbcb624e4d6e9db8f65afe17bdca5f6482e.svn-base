<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<head>
    <meta charset="utf-8">
    <title></title>
    <jsp:include page="../inc.jsp"></jsp:include>
   <script type="text/javascript" src="${ctx}/Highcharts/js/highcharts.js"></script>
   <script type="text/javascript" src="${ctx}/Highcharts/js/modules/exporting.js" ></script>
   <script type="text/javascript" src="${ctx}/Highcharts/js/modules/no-data-to-display.js" ></script> 
   <script type="text/javascript" src="${ctx}/Highcharts/export-excel.js"></script>
   
    

<style type="text/css">
.panel-body {border:0;}
</style>
<script>
$(function() {
    $("#qq + .combo").hide();
    $("#date + .combo").hide();
	selectfun();				
}); 
//选择
function selectfun(){
          var timetype=$("#timetype").combo('getValue');
          var producttype=$("#producttype").combo('getValue');
          var group=$("#group").combo('getValue');
          var belong=$("#belong").combo('getValue');
          var date="";
          var thisyear=new Date().getFullYear();
          var yy=$("#yy").combo('getValue');
          var qq=$("#qq").combo('getValue');
          var mm=$("#mm").combo('getValue');
          if(timetype=='month'){
             if(yy!=''&&mm!=''){date=yy+"-"+mm;
             }else{date="";}
          }else if(timetype=='quarter'){
             if(yy!=''&&qq!=''){date=thisyear+"-"+qq;
             }else{date="";}
          }else if(timetype=='year'){
             if(yy!=''){date=yy+"-01-01";
             }else{date="";}
          }else{
             date=$("#date").combo('getValue');
          }
          console.log(timetype);
          console.log(date);
		  $.ajax({
			type : 'post',
			url : '${ctx}/qc/getHighCharts.do',
			data : {"timetype":timetype,"producttype":producttype,"group":group,"date":date,"belong":belong},
			async : false,
			dataType : 'json',
			success : function(result) {
				highcharts(result);//ajax来取得数据 				
			}
		});
}
//绘图
function highcharts(result) {
        //设置导出按钮,中文显示
        Highcharts.setOptions({
            lang: {
                  contextButtonTitle:"图表导出菜单",
                  printChart:"打印图表",
                  downloadJPEG: "下载JPEG 图片" , 
                  downloadPDF: "下载PDF文档"  ,
                  downloadPNG: "下载PNG 图片"  ,
                  downloadSVG: "下载SVG 矢量图" , 
                  exportButtonTitle: "导出图片" ,
                  noData:"没有数据",
            }
        });
        
            //主体部分
			$('#container').highcharts({		        
			    //1.图形类型
				chart : { 
				},
				//导出按钮
				exporting: {
				    //设置导出图片的高和宽
                    sourceWidth: 1000,
                    sourceHeight: 400,
                      // scale: 2 (default)
                    chartOptions: {
                         subtitle: null
                    }
                },		
				//2.主标题
				title : {
					text : result.title 
				},
				//3.副标题
				subtitle: {
                   // text: result.subtitle  
                },
                //4.图例。用不同形状、颜色、文字等 标示不同数据列，通过点击标示可以显示或隐藏该数据列
                legend: {//让他显示在右上角
                     align: 'right',
                     verticalAlign: 'top',
                     x: 0,
                     y: 100
                },
                //5.x坐标数据
				xAxis : {
					categories : result.xAxis,
					//如果有空格,那么这天就是没产出,先去掉空格,然后添加上颜色
					/* labels:{formatter:function(){
					         if(this.value.indexOf(" ")>=0){
					             return '<span style="color:blue;">'+$.trim(this.value)+'</span>';
					         }else{
					             return  this.value;
					         }
					         }
					       } */									
				    },
				//6.y坐标标题
				yAxis : [{
					labels: {//第一个y轴yAxis
                        format: '{value}',
                        style: {color: '#89A54E'}
                    },
                    title: {
                        text: '数量',
                        style: { color: '#89A54E'}
                   }}, 
                    { // 第二个y轴yAxis
                   title: {
                       text: '坏品率',
                       style: {color: '#4572A7'}
                   },
                   labels: {
                       format: '{value} %',
                       style: {color: '#4572A7'}
                   },
                   //min:0,  //刻度最小值
                   //tickPositions: [-3,-2,-1,0,1,2,3] ,//手动设置右边y轴刻度
                   opposite: true
				}],
				//7.数据提示框
				tooltip: {
                    shared: false,
                    //crosshairs: [{width: 1,color: 'black'}] //列定位线
                },
                //8.标签(左上角显示的部分)
                labels: {                                                         
                    items: [{                                                     
                    html: result.labels,                          
                    style: {                                                  
                        left: '40px',                                         
                        top: '-100px',                                           
                        color: 'black'                                        
                      }                                                         
                    }]                                                            
                }, 
                //9.版权信息,不显示
                credits: {
                    enabled: false
                },
                //让饼图显示百分比
                plotOptions: {
                      pie: {
                         allowPointSelect: true,
                         cursor: 'pointer',
                         depth: 35,
                         dataLabels: {color:'black',enabled: false,
                         formatter:function(){
                             return '<b>'+this.point.name+'</b>:'+this.point.percentage.toFixed(2)+"%"+'<br>数量:'+this.y;
                                   },
                         connectorWidth:0,
                         connectorPadding:0,
                         distance:-30
                         },
                      showInLegend: false
                    }
                },
				//10.数据
				series : [{  
				      type:'column',
				      name:'良品',
				      yAxis: 0,			      
				      data:result.series.good,
				      color:'#64E572',
				      dataLabels:{
				          enabled: true,//显示柱形条的值
				      }
				},{
				      type:'column',
				      name:'坏品',
				      yAxis: 0,			      
				      data:result.series.bad,
				      color:'#3D3D3D',
				      dataLabels:{
				          enabled: true,//显示柱形条的值
				      }
				},{
				      type:'line',
				      name:'坏品率',
				      yAxis: 1,
				      data:result.series.rate,
				      color:'#EE0000',
				      tooltip: {valueSuffix: '%'},//在tooltip上显示百分比符号
				      dataLabels:{enabled: true,
				            formatter: function() {return this.point.y+'%';},  // 显示百分比符号
				      }//显示折线点的值
				},{
				      type:'line',
				      name:'安全线',
				      yAxis: 1,
				      data:result.series.secure,
				      color:'#50B432',
				      tooltip: {valueSuffix: '%'},
				      marker:{enabled:false },//不显示折线点
				      showInLegend: false,
				      dataLabels: { enabled: false } 
				},{
				      type:'line',
				      name:'警戒线',
				      yAxis: 1,
				      data:result.series.warning,
				      color:'#CD8500',
				      tooltip: {valueSuffix: '%'},
				      marker:{enabled:false },//不显示折线点
				      showInLegend: false,
				      dataLabels: {enabled: false} 
				},{
				      type:'pie',
				      name:'合计',
				      data:result.series.pie,
				      center:[-40,-90],
				      size: 90, 
				      showInLegend: false,//不在图例中显示
				      dataLabels: {enabled: true} 
				}]
			});
}
//选择不同的时间类型,显示不同的下拉框
function timetypefun(record){
    //不管如何,先清空date的值
    $('#date').datebox('setValue', '');
    if(record.value=='week'){
        console.log("选择了星期");      
        $("#yy + .combo").hide();
        $("#qq + .combo").hide();
        $("#mm + .combo").hide();
        $("#date + .combo").show();
    }else if(record.value=='month'){
        console.log("选择了月份");
        $("#date + .combo").hide();
        $("#qq + .combo").hide();
        $("#yy + .combo").show();
        $("#mm + .combo").show();
    }else if(record.value=='quarter'){
       console.log("选择了季度");
       $("#date + .combo").hide();
       $("#mm + .combo").hide();
       $("#yy + .combo").show();
       $("#qq + .combo").show();
    }else if(record.value=='year'){
       console.log("选择了年份");
       $("#date + .combo").hide();
       $("#qq + .combo").hide();
       $("#mm + .combo").hide();
       $("#yy + .combo").show();
    }else{
       return ;
    }
}
function getinfo(){
   var chart = $('#container').highcharts();      
   alert(chart.getCSV());
}
function getExcel(){
   var chart = $('#container').highcharts();      
   Highcharts.post('http://export.hcharts.cn/cvs.php', {csv: chart.getCSV()});	
}
var i=0;
function addAllproducttype(){
    if(i==0){
       var data=$(this).combobox('getData');
       var temp=[{'productNo':'','productName':'全部','selected':true}];
       $.merge(temp,data);
       i++;
       $(this).combobox("loadData", temp);
    }  
}
var j=0;
function addAllbelong(){
     if(j==0){
       var data=$(this).combobox('getData');
       var temp=[{'id':'','name':'生产部','selected':true}];
       $.merge(temp,data);
       j++;
       $(this).combobox("loadData", temp);
    } 
}
var k=0;
function addAllgroup(){
   if(k==0){
       var data=$(this).combobox('getData');
       var temp=[{'id':'','name':'全部','selected':true}];
       $.merge(temp,data);
       k++;
       $(this).combobox("loadData", temp);
    } 
}
function clearhighchart(){
   $("#timetype").combobox('select','month');
   $("#producttype").combobox('setValue','');
   $("#belong").combobox('select','');
   $("#yy").combobox('setValue','2016');
   $("#qq").combobox('clear');
   $("#mm").combobox('clear');
   selectfun();
}
</script>
</head>
<body>
  <!-- 放入panel,并填充整个界面,更加美观 -->
  <div class="easyui-panel" fit="true">
    <table>
       <tr>
            <td><select id="producttype" class="easyui-combobox" style="width:80px;" 
                        data-options="valueField:'productNo',textField:'productName',panelHeight:'auto',
                        url:'${ctx}/qc/getAllQCPT.do',onLoadSuccess:addAllproducttype">
                        </select></td>
            <td><select id="belong" class="easyui-combobox" style="width:80px;"
                        data-options="valueField:'id',textField:'name',panelHeight:'auto',
                        url:'${ctx}/qc/getAllProductDept.do',onLoadSuccess:addAllbelong,
                        onSelect: function(rec){    
                        var url = '${ctx}/qc/getDeptByBelong.do?belong='+rec.id;
                        k=0;  
                        $('#group').combobox('clear');   
                        $('#group').combobox('reload', url);    
                        }">
                        </select></td>
            <td><select id="group" class="easyui-combobox" style="width:80px;"
                        data-options="valueField:'id',textField:'name',panelHeight:'auto',onLoadSuccess:addAllgroup">
                        </select></td>
            <td><select id="timetype" class="easyui-combobox" style="width:80px;"
                        data-options="onSelect:timetypefun,panelHeight:'auto'" >
                        <option value="week">按周</option> 
                        <option value="month" selected="true">按月</option>                                             
                        <option value="quarter">按季度</option>
                        <option value="year">按年</option>
                        </select></td>
            <td><input id="date"  type="text" style="width:95px;" class="easyui-datebox" hidden="true"></td>
            <td><input id="yy" class="easyui-combobox" style="width:80px;" data-options="
                       hidden:true,
		               valueField: 'label',
		               textField: 'value',
		               panelHeight:'auto',
		               data: [{label: '2016',value: '2016',selected:'true'
		                    },{label: '2017',value: '2017'
		                    },{label: '2018',value: '2018'
		                    },{label: '2019',value: '2019'
		               }]" /></td>
            <td><input id="qq" class="easyui-combobox" style="width:80px;" data-options="
		               valueField: 'label',
		               textField: 'value',
		               panelHeight:'auto',
		               data: [{label: '01-01',value: '第一季度'
		                    },{label: '04-01',value: '第二季度'
		                    },{label: '07-01',value: '第三季度'
		                    },{label: '10-01',value: '第四季度'
		               }]" /></td>
            <td><input id="mm" class="easyui-combobox" style="width:80px;" data-options="
		               valueField: 'label',
		               textField: 'value',
		               panelHeight:'auto',
		               data: [{label: '01-01',value: '1月'
		                    },{label: '02-01',value: '2月'
		                    },{label: '03-01',value: '3月'
		                    },{label: '04-01',value: '4月'
		                    },{label: '05-01',value: '5月'
		                    },{label: '06-01',value: '6月'
		                    },{label: '07-01',value: '7月'
		                    },{label: '08-01',value: '8月'
		                    },{label: '09-01',value: '9月'
		                    },{label: '10-01',value: '10月'
		                    },{label: '11-01',value: '11月'
		                    },{label: '12-01',value: '12月'
		               }]" /></td>
            <td><a class="easyui-linkbutton" iconCls="icon-search"  onclick="selectfun();">查询</a></td>
            <td><a href="javascript:clearhighchart()" class="easyui-linkbutton" data-options="iconCls:'icon-myclear'">清空</a></td>
            <td><a class="easyui-linkbutton"   onclick="getExcel();">导出数据到excel</a></td>
       </tr>
    </table>   
  <div id="container" style="min-width:800px;height:580px;"></div> 
  </div>
</body>