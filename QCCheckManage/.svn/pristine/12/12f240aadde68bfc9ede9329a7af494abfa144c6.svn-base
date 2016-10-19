
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
<%@ page import="net.sf.jasperreports.engine.JasperRunManager"%>//excel
<%@ page import="net.sf.jasperreports.engine.export.JRXlsExporter"%>//excel
<%@ page import="net.sf.jasperreports.engine.export.JRXlsExporterParameter"%>//excel
<%
  

 Connection conn =null;
     try  
     {    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
  	  conn = DriverManager.getConnection(
            "jdbc:sqlserver://192.168.8.3;DatabaseName=QCDB", "sa", "1A2s3d4f5g");
 	HttpSession sessions=request.getSession();
  		String type = (String)sessions.getAttribute("type");
		String project = (String)sessions.getAttribute("project");
		
 		Map parameters = new HashMap();
 		parameters.put("project", project);

       
        ServletContext servletContext = this.getServletContext();  
        File reportFile = new File(application.getRealPath("jasper/barcode.jasper"));
  	 
        if("pdf".equals(type)){  
           byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, conn);  
           response.setContentType("application/pdf");  
           response.addHeader("Content-Disposition", "attachment; filename=report.pdf");  
           response.setContentLength(bytes.length);  
           ServletOutputStream ouputStream = response.getOutputStream();  
           ouputStream.write(bytes, 0, bytes.length);  
           ouputStream.flush();  
           ouputStream.close();
             out.clear();     
           out = pageContext.pushBody();  
            
        } else if ("excel".equals(type)){  
           JRXlsExporter exporter = new JRXlsExporter();     
           ByteArrayOutputStream oStream = new ByteArrayOutputStream();     
           JasperPrint jasperPrint = JasperFillManager.fillReport(reportFile.getPath(), parameters, conn);     
           exporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);     
           exporter.setParameter(JRExporterParameter.OUTPUT_STREAM, oStream);     
           exporter.setParameter(JRXlsExporterParameter.IS_REMOVE_EMPTY_SPACE_BETWEEN_ROWS, Boolean.TRUE);     
           exporter.setParameter(JRXlsExporterParameter.IS_ONE_PAGE_PER_SHEET, Boolean.FALSE);     
           exporter.setParameter(JRXlsExporterParameter.IS_WHITE_PAGE_BACKGROUND, Boolean.FALSE);     
           exporter.exportReport();     
                
           byte[] bytes = oStream.toByteArray();     
           response.setContentType("application/vnd.ms-excel");   
           response.addHeader("Content-Disposition", "attachment; filename=report.xls");  
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
          
           out.print("<script type='text/javaScript'>alert('你要弹出的消息在这里写。');setInterval(function () {window.location.reload();}, 1000);</script>");    
        
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