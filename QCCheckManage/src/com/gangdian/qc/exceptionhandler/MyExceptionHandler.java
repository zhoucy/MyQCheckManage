package com.gangdian.qc.exceptionhandler;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

public class MyExceptionHandler implements HandlerExceptionResolver {  
	  
    public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler,  
            Exception ex) {  
        Map<String, Object> model = new HashMap<String, Object>();  
        model.put("ex", ex);  
          
        // ���ݲ�ͬ����ת��ͬҳ��  
       return new ModelAndView("error", model);  
    }  
}  