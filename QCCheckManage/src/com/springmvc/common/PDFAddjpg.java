package com.springmvc.common;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.lowagie.text.Document;
import com.lowagie.text.DocumentException;
import com.lowagie.text.Font;
import com.lowagie.text.Image;
import com.lowagie.text.Paragraph;
import com.lowagie.text.Rectangle;
import com.lowagie.text.pdf.BaseFont;
import com.lowagie.text.pdf.PdfWriter;

public class PDFAddjpg {
	
	public static void pdfaddjpg( String  pdfFile ,List imgFiles ){
		Rectangle pageSize = new Rectangle(40, 40);
		Document doc = new Document(pageSize);
		 // 定义输出位置并把文档对象装入输出对象中
		   // 打开文档对象
		  try {

			  PdfWriter.getInstance(doc, new FileOutputStream(pdfFile));
				 doc.open();
			   // 设置中文字体
			   BaseFont bfChinese = BaseFont.createFont("STSong-Light", "UniGB-UCS2-H", BaseFont.NOT_EMBEDDED);

			   Font FontChinese = new Font(bfChinese, 12, Font.NORMAL);
			   // 加入文字“HelloWorld ------ 中国北京,我的2008 .”
//			   String str = "HelloWorld ------ 中国北京, 我的2008 .";
//			   Paragraph tt = new Paragraph(str, FontChinese);
//			   doc.add(tt);
			   // 加入图片Deepinpl.jpg
			   for(int i=0;i<imgFiles.size();i++){
				   Image jpg = Image.getInstance(imgFiles.get(i).toString());
				  jpg.setAlignment(Image.AX);
				 //  jpg.setSpacingAfter(2);
				 jpg.setAbsolutePosition(0+i*35f,0f);
				  // jpg.setLeft(2);
				   doc.add(jpg);
			   }
			   
			   // 关闭文档对象，释放资源
			   doc.close();
			  } catch (FileNotFoundException e) {
			   e.printStackTrace();
			  } catch (DocumentException e) {
			   e.printStackTrace();
			  } catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			  System.out.println("OK");

}

	
	public static void main(String[] args) throws Exception {
		 
		 List<String> a= new ArrayList<String>(); 
		 long pono=1629340000;
		 
		 QRCodeUtil.encode(pono+"", null, "d:/MyWorkDoc", true);
		 String imgFile="D:/MyWorkDoc/"+pono+".jpg";
		 a.add(imgFile);
//		 for(int i=0;i<5;i++){
//			
//			 pono++;
//			 //String text="D:/MyWorkDoc/"+pono+".jpg";
//			 QRCodeUtil.encode(pono+"", null, "d:/MyWorkDoc", true);
//			 String imgFile="D:/MyWorkDoc/"+pono+".jpg";
//			 a.add(imgFile);
//		 }
		 pdfaddjpg("D:/MyWorkDoc/hello.pdf", a);
		QRCodeUtil.drawImage("D:/MyWorkDoc/hello.pdf", 1);  
		System.out.println(111);
	}
}
