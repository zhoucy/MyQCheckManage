package com.springmvc.sys;

/* 
2. * To change this template, choose Tools | Templates 
3. * and open the template in the editor. 
4. */ 

 
import java.awt.image.BufferedImage;  

import java.io.FileOutputStream;  
import org.jbarcode.JBarcode;  
import org.jbarcode.encode.Code39Encoder;
import org.jbarcode.encode.EAN13Encoder;
import org.jbarcode.paint.BaseLineTextPainter;
import org.jbarcode.paint.EAN13TextPainter;
import org.jbarcode.paint.WideRatioCodedPainter;
import org.jbarcode.paint.WidthCodedPainter;  
import org.jbarcode.util.ImageUtil;  
/** 
 * 2012-05-28 
 * @author 郏高阳 
 * 支持EAN13, EAN8, UPCA, UPCE, Code 3 of 9, Codabar, Code 11, Code 93, Code 128, MSI/Plessey, Interleaved 2 of PostNet等
 * 利用jbarcode生成各种条形码！测试成功！分享给大家！
 */ 
public class OneBarcodeUtil {  
    public static void main(String[] paramArrayOfString)  
  {  
    try  
    {  
   
      JBarcode localJBarcode = new JBarcode(EAN13Encoder.getInstance(), WidthCodedPainter.getInstance(), EAN13TextPainter.getInstance());  
      //生成. 欧洲商品条码(=European Article Number)  
      //这里我们用作图书条码  
      String str = "788515004013";  
      BufferedImage localBufferedImage = localJBarcode.createBarcode(str);  
      //saveToGIF(localBufferedImage, str+".gif");  
      localJBarcode.setEncoder(Code39Encoder.getInstance());  
      localJBarcode.setPainter(WideRatioCodedPainter.getInstance());  
      localJBarcode.setTextPainter(BaseLineTextPainter.getInstance());  
      localJBarcode.setShowCheckDigit(false);  
      //xx  
     // saveToPNG(localBufferedImage, str+".png");  
      str = "JBARCODE-39";  
      localBufferedImage = localJBarcode.createBarcode(str);  
    //  saveToPNG(localBufferedImage, "Code39.png");  
  
    }  
    catch (Exception localException)  
    {  
      localException.printStackTrace();  
    }  
  }  
  
  static void saveToJPEG(BufferedImage paramBufferedImage, String paramString)  
  {  
    saveToFile(paramBufferedImage, paramString, "jpeg");  
  }  
  
  public static void saveToPNG(BufferedImage paramBufferedImage, String paramString)  
  {  
    saveToFile(paramBufferedImage, paramString, "png");  
  }  
  
  public static void saveToGIF(BufferedImage paramBufferedImage, String paramString)  
  {  
    saveToFile(paramBufferedImage, paramString, "gif");  
  }  
  
  public static void saveToFile(BufferedImage paramBufferedImage, String paramString1, String paramString2)  
  {  
    try  
    {  
    	
      FileOutputStream localFileOutputStream = new FileOutputStream("QCCheckManage/WebRoot/img/" + paramString1);  
      ImageUtil.encodeAndWrite(paramBufferedImage, paramString2, localFileOutputStream, 96, 96);  
      localFileOutputStream.close();  
    }  
    catch (Exception localException)  
    {  
      localException.printStackTrace();  
    }  
  }  
  
}  