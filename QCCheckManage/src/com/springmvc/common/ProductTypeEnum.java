package com.springmvc.common;

import java.util.HashMap;
import java.util.Map;

import com.fr.report.core.A.p;

public enum ProductTypeEnum {
	Straight("直发器", "S"),  Curler("卷发器", "C"), HE("负离子梳", "HE"),
	   Dingxing("定型器", "D"),SC("直卷发器", "SC"),FC("洗面机", "FC");
       // 成员变量
       private String name;
       private String index;

       // 构造方法
       private ProductTypeEnum(String name, String index) {
           this.name = name;
           this.index = index;
       }

       // 普通方法
       public static String getName(String index) {
           for (ProductTypeEnum c : ProductTypeEnum.values()) {
               if (c.getIndex().equals(index)) {
                   return c.name;
               }
           }
           return null;
       }

       // get set 方法
       public String getName() {
           return name;
       }

       public void setName(String name) {
           this.name = name;
       }

       public String getIndex() {
           return index;
       }

       public void setIndex(String index) {
           this.index = index;
       }
       public static void main(String[] args) {
    	   for(ProductTypeEnum type:ProductTypeEnum.values()){
    		   
    		   System.out.println(type.getIndex());
    	   }
    	   System.out.println(ProductTypeEnum.getName("S"));
    	   Map map=new HashMap();
    	   map.put("type", ProductTypeEnum.Straight.getIndex());
    	   System.out.println(ProductTypeEnum.valueOf("Straight"));
    	   System.out.println(map.get("type"));
	}
    
}
