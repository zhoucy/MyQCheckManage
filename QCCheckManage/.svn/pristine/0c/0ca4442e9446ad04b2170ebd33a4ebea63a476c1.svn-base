
 <%@page import="com.springmvc.sys.DateUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.Date" %>
<%@ page import=" java.text.SimpleDateFormat" %>
<%@ page import="org.jfree.chart.plot.PlotOrientation" %>
<%@ page import="org.jfree.data.category.DefaultCategoryDataset" %>

<%@ page import="java.net.URLDecoder" %>
<%@ page import="net.sf.jasperreports.engine.JasperFillManager" %>
<%@ page import="net.sf.jasperreports.engine.JasperPrint"%>
<%@ page import="net.sf.jasperreports.engine.JRException"%>
<%@ page import="net.sf.jasperreports.engine.export.JRHtmlExporter"%>
<%@ page import="net.sf.jasperreports.engine.export.JRHtmlExporterParameter"%>
<%@ page import="net.sf.jasperreports.engine.JRExporterParameter"%>//excel
<%@ page import="net.sf.jasperreports.engine.JasperRunManager"%>//excel12123
<%@ page import="net.sf.jasperreports.engine.export.JExcelApiExporter"%>//excel
<%@ page import="net.sf.jasperreports.engine.export.JRXlsExporterParameter"%>//excel
<%@ page import="net.sf.jasperreports.engine.export.JRXlsExporter"%>//excel
<%
  

    
 
 Connection conn =null;
     try  
     {    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
  	  conn = DriverManager.getConnection(
            "jdbc:sqlserver://192.168.8.3;DatabaseName=QCDB", "sa", "1A2s3d4f5g");
   
 	/* HttpSession sessions=request.getSession();
	String groupid = (String)sessions.getAttribute("groupid");
	String productDate = (String)sessions.getAttribute("productDate");
	String safeLine = (String)sessions.getAttribute("safeLine");
	String warmLine = (String)sessions.getAttribute("warmLine");
	
	
	if(nowDate==null||nowDate.equals("")){
		nowDate=DateUtil.getStringDateShort();
	} */
	 	Map parameters = new HashMap();
	 	String groupid = (String)request.getParameter("groupid");
	 	String belong = (String)request.getParameter("belong");
		String productDate = (String)request.getParameter("productDate");
		if(productDate==null||productDate.equals("")){
			productDate=DateUtil.getStringDateShort();
		}
		String safeLine = (String)request.getParameter("safeLine");
		String warmLine = (String)request.getParameter("warmLine");
	 	String type=   (String) request.getParameter("type");
	 	String reportName = (String)request.getParameter("reportName");
		parameters.put("SUBREPORT_DIR",request.getRealPath("/jasper/")+"/");
	 	parameters.put("productDate", productDate);
	 	
		parameters.put("groupid",groupid);
		parameters.put("safeLine",Double.parseDouble(safeLine));
		parameters.put("warmLine", Double.parseDouble(warmLine)); 
 		ServletContext servletContext = this.getServletContext();
 		String  onePage="";//一页显示
 		String  headPage="";//分别显示头 excel中多个sheet的第一个
 		String  subPage="";//显示尾
 		String applicatiosname ="" ;//处理下载后文件名中文问题
 		//汇总信息和分组信息
 		if(reportName==null||reportName.equals("")){
 		//分组信息
	 	    onePage=application.getRealPath("jasper/crossMonthRpt.jasper");
	 		headPage=application.getRealPath("jasper/badRateMonthRpt.jasper");
	        subPage=application.getRealPath("jasper/crossDateRpt.jasper");
	      	 parameters.put("belong",belong);
	        applicatiosname = "badRateRpt-"+groupid;
	  	}else{
	  	//汇总信息
	  		 onePage =application.getRealPath("jasper/crossMonthSummarRpt.jasper");
	 		 headPage = application.getRealPath("jasper/badRateMonthSummarRpt.jasper");
	         subPage =application.getRealPath("jasper/crossDateSummaryRpt.jasper");
	         applicatiosname = URLDecoder.decode("badRateSummaryRpt", "UTF-8");
	  
	  	}
	  	File reportFile1 = new File(onePage);
	  	File reportFile2 = new File(headPage);
	  	 File reportFile3=new  File(subPage);
  		if("pdf".equals(type)){  
           byte[] bytes = JasperRunManager.runReportToPdf(reportFile1.getPath(), parameters, conn);  
           response.setContentType("application/pdf");  
           response.addHeader("Content-Disposition", "attachment; filename="+applicatiosname+".pdf");  
           response.setContentLength(bytes.length);  
           ServletOutputStream ouputStream = response.getOutputStream();  
           ouputStream.write(bytes, 0, bytes.length);  
           ouputStream.flush();  
           ouputStream.close();
             out.clear();     
           out = pageContext.pushBody();  
           
            
        } else if ("excel".equals(type)){  
         	
        // JExcelApiExporter exporter=new JExcelApiExporter();   
           ByteArrayOutputStream oStream = new ByteArrayOutputStream();     
           JasperPrint jasperPrint1 = JasperFillManager.fillReport(reportFile2.getPath(), parameters, conn);  
           JasperPrint jasperPrint2 = JasperFillManager.fillReport(reportFile3.getPath(), parameters, conn);  
           List<JasperPrint>  list= new ArrayList<JasperPrint>();
           list.add(jasperPrint1);
       	   list.add(jasperPrint2);
       	   JRXlsExporter exporter = new JRXlsExporter();
		   exporter.setParameter(JRExporterParameter.JASPER_PRINT_LIST,list);//此处的list为JasperPrint的list集合 
		   exporter.setParameter(JRXlsExporterParameter.IS_ONE_PAGE_PER_SHEET, Boolean.TRUE);//设置为true，即可在一个excel中，每个单独的jasper对象放入到一个sheet页中
		   String[] sheetNames = {"不良率汇年报表","不良率汇总月报表"};
		   exporter.setParameter(JRXlsExporterParameter.SHEET_NAMES, sheetNames);//此处这样写即可
         //  exporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);     
           exporter.setParameter(JRExporterParameter.OUTPUT_STREAM, oStream);     
           exporter.setParameter(JRXlsExporterParameter.IS_REMOVE_EMPTY_SPACE_BETWEEN_ROWS, Boolean.TRUE);     
          // exporter.setParameter(JRXlsExporterParameter.IS_ONE_PAGE_PER_SHEET, Boolean.FALSE);     
           exporter.setParameter(JRXlsExporterParameter.IS_WHITE_PAGE_BACKGROUND, Boolean.FALSE);     
           exporter.exportReport();     
                
           byte[] bytes = oStream.toByteArray();     
           response.setContentType("application/vnd.ms-excel");   
           response.addHeader("Content-Disposition", "attachment; filename="+applicatiosname+".xls");  
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
           JasperPrint jasperPrint = JasperFillManager.fillReport(reportFile1.getPath(), parameters, conn);     
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