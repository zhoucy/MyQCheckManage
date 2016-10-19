package com.springmvc.common;

import java.util.Date;  
import java.util.concurrent.Executors;  
import java.util.concurrent.ScheduledExecutorService;  
import java.util.concurrent.TimeUnit;  
  

/** 
 * ��ʱ���� 
 * @author zhoucy 
 */  
public class TranslateTimer {  
  
    private  ScheduledExecutorService scheduler = Executors  
            .newScheduledThreadPool(1);  
    Translator tranChinese = new Translator(); //����ʵ���࣬������Ϊ������  
  
    public void executeTranslateTimer() {  
  
        Runnable task = new Runnable() {  
  
            public void run() {  
                // ����  
                tranChinese.translateGo(); //���ò���ʵ�ַ���  
                  
                System.out.println("--------------���룺" + new Date().getTime()  
                        + "------------------");  
            }  
        };  
        if (scheduler.isShutdown()) {  
            scheduler = Executors.newScheduledThreadPool(1);  
            scheduler.scheduleAtFixedRate(task, 10, 30, TimeUnit.SECONDS);  
        } else {  
            scheduler.scheduleAtFixedRate(task, 10, 30, TimeUnit.SECONDS); // �ӳ�10�룬ÿ��30�뷭��һ��  
        }  
    }  
  
 //ֹͣ���񣬲����ύ���������ύ��������ִ���������  
  public void stop() {  
        scheduler.shutdown();  
  }  
  
} 