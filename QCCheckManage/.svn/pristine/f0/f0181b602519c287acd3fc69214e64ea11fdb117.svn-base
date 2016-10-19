
 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@page import="com.springmvc.sys.DateUtil"%>
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
	  String reportType=(String) sessions.getAttribute("reportType");
	  String type = (String)sessions.getAttribute("type");
	    File reportFile= new File("");
	    File reportFile2= new File("");
	    File reportFile3= new File("");
	   
	 	Map parameters = new HashMap();
	 
		String reportName = (String)sessions.getAttribute("reportName"); 
		String pono = (String) sessions.getAttribute("pono");
		String model = (String) sessions.getAttribute("model");
		String groupid = (String) sessions.getAttribute("groupid");
		String nowDate = (String) sessions.getAttribute("nowDate");
		String prodectType = (String) sessions.getAttribute("prodectType");
		String belong = (String) sessions.getAttribute("belong");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		if(nowDate==null||nowDate.equals("")){
			nowDate=DateUtil.getStringDateShort();
		}
		/* parameters.put("pono", "");
		parameters.put("model", "");
		parameters.put("groupid", "");
		parameters.put("productDate", "");
		parameters.put("prodectType", ""); */
		parameters.put("pono", pono);
		parameters.put("belong", belong);
		parameters.put("model", model);
		parameters.put("groupid", groupid);
		parameters.put("productDate", nowDate);
		parameters.put("prodectType", prodectType);
		parameters.put("SUBREPORT_DIR",request.getRealPath("/jasper/")+"/");
		ServletContext servletContext = this.getServletContext();
		if(reportName.equals("QCCheckReport")){
			reportFile = new File(application.getRealPath("jasper/checkRecodeParent.jasper"));
			reportFile2 = new File(application.getRealPath("jasper/QCDateReportHead.jasper"));
			reportFile3 = reportFile;
       	}
       	else if(reportName.equals("QCSummaryReport")){
       	     reportFile = new File(application.getRealPath("jasper/QCDateReportHead.jasper"));
       	     reportFile2 =reportFile;
       	     reportFile3= new File(application.getRealPath("jasper/checkRecodeParent.jasper"));
       	}
		if ("pdf".equals(type)) {
			byte[] bytes = JasperRunManager.runReportToPdf(
					reportFile.getPath(), parameters, conn);
			response.setContentType("application/pdf");
			response.addHeader("Content-Disposition","attachment; filename=report.pdf");
			response.setContentLength(bytes.length);
			ServletOutputStream ouputStream = response.getOutputStream();
			ouputStream.write(bytes, 0, bytes.length);
			ouputStream.flush();
			ouputStream.close();
			out.clear();
			out = pageContext.pushBody();

		} else if ("excel".equals(type)) {
		  JasperPrint jasperPrint1 = JasperFillManager.fillReport(reportFile2.getPath(), parameters, conn);  
           JasperPrint jasperPrint2 = JasperFillManager.fillReport(reportFile3.getPath(), parameters, conn);  
           List<JasperPrint>  list= new ArrayList<JasperPrint>();
           list.add(jasperPrint2);
       	   list.add(jasperPrint1);
       	   JRXlsExporter exporter = new JRXlsExporter();
		   exporter.setParameter(JRExporterParameter.JASPER_PRINT_LIST,list);//此处的list为JasperPrint的list集合 
		   exporter.setParameter(JRXlsExporterParameter.IS_ONE_PAGE_PER_SHEET, Boolean.TRUE);//设置为true，即可在一个excel中，每个单独的jasper对象放入到一个sheet页中
		   String[] sheetNames = {"QC检测详细表","QC检测汇总"};
		   exporter.setParameter(JRXlsExporterParameter.SHEET_NAMES, sheetNames);//此处这样写即可
     
			ByteArrayOutputStream oStream = new ByteArrayOutputStream();
			
		//	exporter.setParameter(JRExporterParameter.JASPER_PRINT,jasperPrint);
			exporter.setParameter(JRExporterParameter.OUTPUT_STREAM,oStream);
			exporter.setParameter(JRXlsExporterParameter.IS_REMOVE_EMPTY_SPACE_BETWEEN_ROWS,Boolean.TRUE);
			//exporter.setParameter(JRXlsExporterParameter.IS_ONE_PAGE_PER_SHEET,Boolean.FALSE);
			exporter.setParameter(JRXlsExporterParameter.IS_WHITE_PAGE_BACKGROUND,Boolean.FALSE);
			exporter.exportReport();

			byte[] bytes = oStream.toByteArray();
			response.setContentType("application/vnd.ms-excel");
			response.addHeader("Content-Disposition","attachment; filename=QCCheckDate.xls");
			response.setContentLength(bytes.length);
			ServletOutputStream ouputStream = response.getOutputStream();
			ouputStream.write(bytes, 0, bytes.length);
			ouputStream.flush();
			ouputStream.close();
			out.clear();
			out = pageContext.pushBody();

		} else if ("html".equals(type)) {
			JRHtmlExporter exporter = new JRHtmlExporter();
			ByteArrayOutputStream oStream = new ByteArrayOutputStream();
			JasperPrint jasperPrint = JasperFillManager.fillReport(reportFile.getPath(), parameters, conn);
			exporter.setParameter(JRHtmlExporterParameter.IS_USING_IMAGES_TO_ALIGN,Boolean.FALSE);
			exporter.setParameter(JRHtmlExporterParameter.JASPER_PRINT,jasperPrint);
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

	} catch (JRException jre) {
		System.out.println("JRException:" + jre.getMessage());
	} catch (Exception e) {
		System.out.println("Exception:" + e.getMessage());
	} finally {
		try {
			conn.close();

		} catch (SQLException ex) {
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