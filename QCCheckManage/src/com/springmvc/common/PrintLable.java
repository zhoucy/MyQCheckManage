package com.springmvc.common;

import javax.print.DocFlavor;
import javax.print.DocFlavor.INPUT_STREAM;
import javax.print.PrintService;
import javax.print.PrintServiceLookup;
import javax.print.attribute.HashPrintRequestAttributeSet;
import javax.print.attribute.PrintRequestAttributeSet;


import com.sun.jna.Library;
import com.sun.jna.Native;
public class PrintLable {
    public interface TscLibDll extends Library {
    	//把TSCLIB.dll发到JAVA_HOME\bin下
        TscLibDll INSTANCE = (TscLibDll) Native.loadLibrary ("TSCLIB", TscLibDll.class);
//	    TscLibDll INSTANCE = (TscLibDll) Native.loadLibrary ("C:\\Windows\\SysWOW64\\TSCLib.dll", TscLibDll.class);
//      显示DLL 版本号码
        int about ();
        int openport (String pirnterName);

        int closeport ();
        // 送内建指令到条形码打印机
        int sendcommand (String printerCommand);
        //设置打印机标签宽高 速度 浓度  0  垂直间距 偏移值
        int setup (String width,String height,String speed,String density,String sensor,String vertical,String offset);
//        下载单色PCX 格式图文件至打印机
        int downloadpcx (String filename,String image_name);
        int barcode (String x,String y,String type,String height,String readable,String rotation,String narrow,String wide,String code);
        int printerfont (String x,String y,String fonttype,String rotation,String xmul,String ymul,String text);
        int clearbuffer ();
        //设置打印个数
        int printlabel (String set, String copy);
//        跳页，该函数需在setup 后使用
        int formfeed ();
        //不回吐
        int nobackfeed ();
//        使用Windows TTF 字型打印文字
        int windowsfont (int x, int y, int fontheight, int rotation, int fontstyle, int fontunderline, String szFaceName, String content);
//        int gap(double d,double n);
    }

    /**
     * @author IT01
     * @param pono  订单号
     * @param printer 打印机名称
     * @return String 返回消息
     * @throws ServiceException
     */
    public static String  printQR(String  pono,String printer) throws Exception {
    	
//        	PrintService ps = PrintServiceLookup.lookupDefaultPrintService();
//        	String printer="";
//        	if(ps!=null){
//        		printer=ps.getName();
//        	}
    	   INPUT_STREAM dof = DocFlavor.INPUT_STREAM.AUTOSENSE;
    	   PrintRequestAttributeSet aset = new HashPrintRequestAttributeSet();  
    	   PrintService[] ps = PrintServiceLookup.lookupPrintServices(dof, aset);  
           int flag=0;//判断是否存在打印机
           for (int i = 0; i < ps.length; i++) {  
               String svcName = ps[i].toString();
               //获取所需要的打印机
               if (svcName.contains(printer)) {
            	      
            	  flag+=1;
            	  printer=ps[i].getName();
            	  break;
               } 
           }  
    		
    		if(flag<1){
    			throw new Exception("未配置标签打印机！");
    			
    		}
    		System.out.println(printer);
    		TscLibDll.INSTANCE.openport(printer);
        	String strP = "QRCODE 45,3,L,3,M,0,M1,S2,\""+pono+"\"";
        	//设置打印二维码  
//        	String strP = "QRCODE 425,5,L,3,M,0,M1,S2,\""+pono+"\"";
        	
     		TscLibDll.INSTANCE.setup("100", "12", "5", "8", "0", "1", "0");
//     		TscLibDll.INSTANCE.setup("100", "12", "5", "8", "0", "0", "0");
//     		TscLibDll.INSTANCE.printerfont("20", "200", "3", "0", "1", "1", "1"); 
//     		TscLibDll.INSTANCE.printerfont ("100", "12", "3", "0", "1", "1", ""+pono+"");
//            TscLibDll.INSTANCE.printerfont ("430", "0", "1", "0", "1", "1", "HS00000001");

     		TscLibDll.INSTANCE.sendcommand(strP);
     		
     		TscLibDll.INSTANCE.printlabel("1", "6"); 
     		TscLibDll.INSTANCE.clearbuffer();
            TscLibDll.INSTANCE.closeport();
			return "success";
		
    	
    }
    
    public static void main(String[] args) {
    	try {
    		PrintService ps = PrintServiceLookup.lookupDefaultPrintService();
    		System.out.println(ps.getName());
			PrintLable.printQR("2016-10-190103","9025");
			PrintLable.printQR("abc",ps.getName());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			e.getMessage();
		}
      /*  //TscLibDll.INSTANCE.about();
    	PrintService ps = PrintServiceLookup.lookupDefaultPrintService();
    	String printer="";
    	if(ps!=null){
    		printer=ps.getName();
    	}
        TscLibDll.INSTANCE.openport(printer);
    	
    	TscLibDll.INSTANCE.openport("Gprinter  GP-9025T");
        //TscLibDll.INSTANCE.downloadpcx("C:\\UL.PCX", "UL.PCX");
        TscLibDll.INSTANCE.sendcommand("REM ***** This is a test by JAVA. *****");
        TscLibDll.INSTANCE.setup("100", "50", "5", "8", "0", "0", "0");
        TscLibDll.INSTANCE.clearbuffer();
        //TscLibDll.INSTANCE.sendcommand("PUTPCX 550,10,\"UL.PCX\"");
        TscLibDll.INSTANCE.printerfont ("100", "10", "3", "0", "1", "1", "(JAVA) DLL Test!!");
        TscLibDll.INSTANCE.barcode("100", "40", "128", "50", "1", "0", "2", "2", "123456789");
//        TscLibDll.INSTANCE.windowsfont(400, 200, 48, 0, 3, 1, "arial", "DEG 0");
//        TscLibDll.INSTANCE.windowsfont(400, 200, 48, 90, 3, 1, "arial", "DEG 90");
//        TscLibDll.INSTANCE.windowsfont(400, 200, 48, 180, 3, 1, "arial", "DEG 180");
//        TscLibDll.INSTANCE.windowsfont(400, 200, 48, 270, 3, 1, "arial", "DEG 270");
      String strP = "QRCODE 43,0,L,3,M,0,M1,S2,\"HS123456\"";
		TscLibDll.INSTANCE.setup("100", "10", "5", "8", "0", "0", "0");
		TscLibDll.INSTANCE.printerfont("20", "200", "3", "0", "1", "1", "1"); 
		TscLibDll.INSTANCE.sendcommand(strP);
		TscLibDll.INSTANCE.printlabel("1", "1"); 
		TscLibDll.INSTANCE.clearbuffer();
//        TscLibDll.INSTANCE.printlabel("1", "1");
        TscLibDll.INSTANCE.closeport();*/
    }
}
