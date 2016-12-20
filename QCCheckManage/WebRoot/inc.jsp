<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<c:set var="ctx" value="${pageContext.request.contextPath }" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    
    
    <!-- 引入的顺序不能随便改动 -->  
    <!-- jquery --> 
    <script type="text/javascript" src="${ctx}/easyui/jquery.min.js"></script>	
    <script src="${ctx}/easyui/jquery.cookie.js"></script>
 	<%  
        //从cookies中读取主题名称  ,这个要放在cookie.js的后面,要放在easyuiTheme的前面
        String easyuiThemeName = "default"; 
        String[] arr={"default","gray","bootstrap","ui-cupertino","ui-dark-hive","ui-pepper-grinder","ui-sunny"};
		List<String> allTheme=Arrays.asList(arr);      
        Cookie cookies[] = request.getCookies();  
        if(cookies != null && cookies.length > 0){  
            for(int i=0; i<cookies.length; i++){  
                if(cookies[i].getName().equals("easyuiThemeName")){  
                    easyuiThemeName = cookies[i].getValue();  
                    break;  
                }  
            }  
        }
        if(!allTheme.contains(easyuiThemeName)){
			easyuiThemeName="default";//主题必须是arr列表中规定的主题,防止外部修改cookie发生无法预料的错误
		}  
    %> 
    <!-- css -->
    <link id="easyuiTheme" rel="stylesheet" type="text/css" href="${ctx}/easyui/themes/<%=easyuiThemeName%>/easyui.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/easyui/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/easyui/themes/color.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/easyui/demo/demo.css">
	<link rel="stylesheet" href="${ctx}/css/jquery-ui.css">
    


	<!-- js -->
	<script src="${ctx}/js/jquery-ui.js"></script>
	<script type="text/javascript" src="${ctx}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${ctx}/easyui/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${ctx}/easyui/datagrid-detailview.js"></script>
	<script src="${ctx}/js/jquery.validate.min.js"></script>
	
 		
	<!-- 项目原样式 -->
	<link href="${ctx}/css/main.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/css/style.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/css/qccheck.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/css/Third-party-configuration.css" rel="stylesheet" type="text/css">
  </head>
  
  <body>
  </body>
</html>
