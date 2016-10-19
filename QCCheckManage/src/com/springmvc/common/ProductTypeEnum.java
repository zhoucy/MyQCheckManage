package com.springmvc.common;

import java.util.HashMap;
import java.util.Map;

import com.fr.report.core.A.p;

public enum ProductTypeEnum {
	Straight("ֱ����", "S"),  Curler("����", "C"), HE("��������", "HE"),
	   Dingxing("������", "D"),SC("ֱ����", "SC"),FC("ϴ���", "FC");
       // ��Ա����
       private String name;
       private String index;

       // ���췽��
       private ProductTypeEnum(String name, String index) {
           this.name = name;
           this.index = index;
       }

       // ��ͨ����
       public static String getName(String index) {
           for (ProductTypeEnum c : ProductTypeEnum.values()) {
               if (c.getIndex().equals(index)) {
                   return c.name;
               }
           }
           return null;
       }

       // get set ����
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
