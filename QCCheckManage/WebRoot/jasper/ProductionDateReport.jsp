
 <%@page import="com.springmvc.sys.DateUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.Date" %>
<%@ page import=" java.text.SimpleDateFormat" %>

<%@ page import="net.sf.jasperreports.engine.JasperFillManager" %>
<%@ page import="net.sf.jasperreports.engine.JasperPrint"%>
<%@ page import="net.sf.jasperreports.engine.JRException"%>
<%@ page import="net.sf.jasperreports.engine.export.JRHtmlExporter"%>
<%@ page import="net.sf.jasperreports.engine.export.JRHtmlExporterParameter"%>
<%@ page import="net.sf.jasperreports.engine.JRExporterParameter"%>//excel
<%@ page import="net.sf.jasperreports.engine.JasperRunManager"%>//excel12123
<%@ page import="net.sf.jasperreports.engine.export.JRXlsExporter"%>//excel
<%@ page import="net.sf.jasperreports.engine.export.JRXlsExporterParameter"%>//excel
<%
  

    
 
 Connection conn =null;
     try  
     {    
     		//连接数据库
     	  Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
  	 	  conn = DriverManager.getConnection(
            "jdbc:sqlserver://192.168.8.3;DatabaseName=QCDB", "sa", "1A2s3d4f5g");

 	HttpSession sessions=request.getSession();
	String pono = (String)sessions.getAttribute("pono");
	
	String model = (String)sessions.getAttribute("model");
	String groupid = (String)sessions.getAttribute("groupid");
	String nowDate = (String)sessions.getAttribute("nowDate");
	String startDate = (String)sessions.getAttribute("startDate");
	String type = (String)sessions.getAttribute("type");
	String prodectType = (String)sessions.getAttribute("prodectType");
	String targetProdect = (String)sessions.getAttribute("targetProdect");
	String standardProdect = (String)sessions.getAttribute("standardProdect");
	String sumWorker = (String)sessions.getAttribute("sumWorker"); 
	String belong = (String)sessions.getAttribute("belong"); 
	String reportName = (String)sessions.getAttribute("reportName"); 
		/*String pono = request.getParameter("pono");//PONO
		String nowDate  = request.getParameter("nowDate");//日期
		String groupid = request.getParameter("groupid");//组别
		String model = request.getParameter("model");//产品规格
		String prodectType = request.getParameter("prodectType");//产品类型
		String type=request.getParameter("type");//导出类型
		
	 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	*/
	//默认日期为当前日期
	if(nowDate==null||nowDate.equals("")){
		nowDate=DateUtil.getStringDateShort();
	}
	if(startDate==null||startDate.equals("")){
		startDate=DateUtil.getStringDateShort();
	}
	
 	Map parameters = new HashMap();
 	
	//设置子报表路径
	parameters.put("SUBREPORT_DIR",request.getRealPath("/jasper/")+"/");
	//设置报表需要的参数
 	parameters.put("pono", pono);
	parameters.put("model", model);
	parameters.put("groupid", groupid);
	parameters.put("productDate", nowDate);
	parameters.put("prodectType", prodectType); 
	parameters.put("belong", belong); 
System.out.println(belong);
 		ServletContext servletContext = this.getServletContext();
 		String filePath="";//jasper文件路径
 		String headPage="";
 		String fileName="";//文件名
 		//生产日报表
 		if(reportName.equals("QCDateReport")){
 			filePath=application.getRealPath("jasper/ProductionDatePar2.jasper");
 			
 			fileName="productionDate";
 		}else if(reportName.equals("QCDateSummaryReport")){
 		//生产日报表按时间顺序汇总
 			filePath=application.getRealPath("jasper/ProductionDatePar3.jasper");
 			headPage=application.getRealPath("jasper/ProductionHour.jasper");
 			parameters.put("startDate", startDate);
 			fileName="productionSummary";
 		
 		}else if(reportName.equals("failDetailReport")){
 		//失败工时汇总报表
 			filePath=application.getRealPath("jasper/failDetailRpt.jasper");
 			parameters.put("startDate", startDate);
 			fileName="failWorkerHour";
 		}else{
 			filePath=application.getRealPath("jasper/ProductionHour.jasper");
 			parameters.put("startDate", startDate);
 			fileName="productionHour";
 		
 		}
 		
 		File reportFile = new File(filePath);
 		File reportFile2 = new File(headPage);
       	
  		if("pdf".equals(type)){  
           byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, conn);  
           response.setContentType("application/pdf");  
           response.addHeader("Content-Disposition", "attachment; filename="+fileName+".pdf");  
           response.setContentLength(bytes.length);  
           ServletOutputStream ouputStream = response.getOutputStream();  
           ouputStream.write(bytes, 0, bytes.length);  
           ouputStream.flush();  
           ouputStream.close();
             out.clear();     
           out = pageContext.pushBody();  
           
            
        } else if ("excel".equals(type)){  
        
           JasperPrint jasperPrint1 = JasperFillManager.fillReport(reportFile.getPath(), parameters, conn);  
           JasperPrint jasperPrint2 = JasperFillManager.fillReport(reportFile2.getPath(), parameters, conn);  
           List<JasperPrint>  list= new ArrayList<JasperPrint>();
           list.add(jasperPrint1);
       	   list.add(jasperPrint2);
       	   JRXlsExporter exporter = new JRXlsExporter();
		   exporter.setParameter(JRExporterParameter.JASPER_PRINT_LIST,list);//此处的list为JasperPrint的list集合 
		   exporter.setParameter(JRXlsExporterParameter.IS_ONE_PAGE_PER_SHEET, Boolean.TRUE);//设置为true，即可在一个excel中，每个单独的jasper对象放入到一个sheet页中
		   String[] sheetNames = {"生产日报汇总","生产工时汇总"};
		     exporter.setParameter(JRXlsExporterParameter.SHEET_NAMES, sheetNames);//此处这样写即可
           ByteArrayOutputStream oStream = new ByteArrayOutputStream();     
          // exporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);     
           exporter.setParameter(JRExporterParameter.OUTPUT_STREAM, oStream);     
           exporter.setParameter(JRXlsExporterParameter.IS_REMOVE_EMPTY_SPACE_BETWEEN_ROWS, Boolean.TRUE);     
           //exporter.setParameter(JRXlsExporterParameter.IS_ONE_PAGE_PER_SHEET, Boolean.FALSE);     
           exporter.setParameter(JRXlsExporterParameter.IS_WHITE_PAGE_BACKGROUND, Boolean.FALSE);     
           exporter.exportReport();     
                
           byte[] bytes = oStream.toByteArray();     
           response.setContentType("application/vnd.ms-excel");   
           response.addHeader("Content-Disposition", "attachment; filename="+fileName+".xls");  
           response.setContentLength(bytes.length);     
           ServletOutputStream ouputStream = response.getOutputStream();     
           ouputStream.write(bytes, 0, bytes.length);     
           ouputStream.flush();     
           ouputStream.close();  
           out.clear();     
           out = pageContext.pushBody();    
            
        } else if("html".equals(type)){
        	JRHtmlExporter exporter = new JRHtmlExporter();     
           ByteArrayOutputStream oStream = new ByteArrayOutputStream();     
           JasperPrint jasperPrint = JasperFillManager.fillReport(reportFile.getPath(), parameters, conn);     
           exporter.setParameter(JRHtmlExporterParameter.IS_USING_IMAGES_TO_ALIGN, Boolean.FALSE);     
           exporter.setParameter(JRHtmlExporterParameter.JASPER_PRINT, jasperPrint);     
           exporter.setParameter(JRHtmlExporterParameter.CHARACTER_ENCODING, "utf-8");     
           exporter.setParameter(JRHtmlExporterParameter.OUTPUT_STREAM, oStream);     
           exporter.exportReport();     
           byte[] bytes = oStream.toByteArray();     
           response.setContentType("text/html");   
           response.setContentLength(bytes.length);     
           response.setCharacterEncoding("utf-8");
          
           ServletOutputStream ouputStream = response.getOutputStream();     
           ouputStream.write(bytes, 0, bytes.length);
    
           ouputStream.flush();     
           ouputStream.close();     
           conn.close();
                
           out.clear();     
           out = pageContext.pushBody();  
            
            
        }
        
     }  
     catch (JRException jre)  
     {  
        System.out.println("JRException:" + jre.getMessage());  
     }  
     catch (Exception e)  
     {  
        System.out.println("Exception:" + e.getMessage());  
     }  
     finally{  
        try  
        {  
           conn.close();  
         
        }  
        catch (SQLException ex)  
        {  
           // TODO Auto-generated catch block  
           ex.printStackTrace();  
        }  
     }
%>
<html>
<head>
<meta charset="utf-8">
<title>QC检查记录</title>

</head>
</html>