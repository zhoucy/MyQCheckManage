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
    	//��TSCLIB.dll����JAVA_HOME\bin��
        TscLibDll INSTANCE = (TscLibDll) Native.loadLibrary ("TSCLIB", TscLibDll.class);
//	    TscLibDll INSTANCE = (TscLibDll) Native.loadLibrary ("C:\\Windows\\SysWOW64\\TSCLib.dll", TscLibDll.class);
//      ��ʾDLL �汾����
        int about ();
        int openport (String pirnterName);

        int closeport ();
        // ���ڽ�ָ��������ӡ��
        int sendcommand (String printerCommand);
        //���ô�ӡ����ǩ���� �ٶ� Ũ��  0  ��ֱ��� ƫ��ֵ
        int setup (String width,String height,String speed,String density,String sensor,String vertical,String offset);
//        ���ص�ɫPCX ��ʽͼ�ļ�����ӡ��
        int downloadpcx (String filename,String image_name);
        int barcode (String x,String y,String type,String height,String readable,String rotation,String narrow,String wide,String code);
        int printerfont (String x,String y,String fonttype,String rotation,String xmul,String ymul,String text);
        int clearbuffer ();
        //���ô�ӡ����
        int printlabel (String set, String copy);
//        ��ҳ���ú�������setup ��ʹ��
        int formfeed ();
        //������
        int nobackfeed ();
//        ʹ��Windows TTF ���ʹ�ӡ����
        int windowsfont (int x, int y, int fontheight, int rotation, int fontstyle, int fontunderline, String szFaceName, String content);
//        int gap(double d,double n);
    }

    /**
     * @author IT01
     * @param pono  ������
     * @param printer ��ӡ������
     * @return String ������Ϣ
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
           int flag=0;//�ж��Ƿ���ڴ�ӡ��
           for (int i = 0; i < ps.length; i++) {  
               String svcName = ps[i].toString();
               //��ȡ����Ҫ�Ĵ�ӡ��
               if (svcName.contains(printer)) {
            	      
            	  flag+=1;
            	  printer=ps[i].getName();
            	  break;
               } 
           }  
    		
    		if(flag<1){
    			throw new Exception("δ���ñ�ǩ��ӡ����");
    			
    		}
    		System.out.println(printer);
    		TscLibDll.INSTANCE.openport(printer);
        	String strP = "QRCODE 45,3,L,3,M,0,M1,S2,\""+pono+"\"";
        	//���ô�ӡ��ά��  
//        	String strP = "QRCODE 425,5,L,3,M,0,M1,S2,\""+pono+"\"";
        	
     		TscLibDll.INSTANCE.setup("100", "12", "5", "8", "0", "1", "0");
//     		TscLibDll.INSTANCE.setup("100", "12", "5", "8", "0", "0", "0");
//     		TscLibDll.INSTANCE.printerfont("20", "200", "3", "0", "1", "1", "1"); 
//     		TscLibDll.INSTANCE.printerfont ("100", "12", "3", "0", "1", "1", ""+pono+"");
//            TscLibDll.INSTANCE.printerfont ("430", "0", "1", "0", "1", "1", "HS00000001");

     		TscLibDll.INSTANCE.sendcommand(strP);
     		
     		TscLibDll.INSTANCE.printlabel("1", "2"); 
     		TscLibDll.INSTANCE.clearbuffer();
            TscLibDll.INSTANCE.closeport();
			return "success";
		
    	
    }
    
    public static void main(String[] args) {
    	try {
    		PrintService ps = PrintServiceLookup.lookupDefaultPrintService();
    		System.out.println(ps.getName());
			PrintLable.printQR("2016-10-190103","9025");
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