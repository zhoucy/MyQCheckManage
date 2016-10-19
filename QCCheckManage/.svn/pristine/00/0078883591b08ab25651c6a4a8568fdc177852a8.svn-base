package com.springmvc.common;


import java.awt.BasicStroke;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.Shape;
import java.awt.geom.RoundRectangle2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Hashtable;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.print.Doc;
import javax.print.DocFlavor;
import javax.print.DocPrintJob;
import javax.print.PrintException;
import javax.print.PrintService;
import javax.print.PrintServiceLookup;
import javax.print.SimpleDoc;
import javax.print.attribute.DocAttributeSet;
import javax.print.attribute.HashAttributeSet;
import javax.print.attribute.HashDocAttributeSet;
import javax.print.attribute.HashPrintRequestAttributeSet;
import javax.print.attribute.PrintRequestAttributeSet;
import javax.print.attribute.Size2DSyntax;
import javax.print.attribute.standard.Copies;
import javax.print.attribute.standard.Media;
import javax.print.attribute.standard.MediaPrintableArea;
import javax.print.attribute.standard.MediaSize;
import javax.print.attribute.standard.MediaSizeName;
import javax.print.attribute.standard.MediaTray;
import javax.print.attribute.standard.OrientationRequested;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.BinaryBitmap;
import com.google.zxing.DecodeHintType;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatReader;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.common.HybridBinarizer;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;
  
public class QRCodeUtil {  
  
    private static final String CHARSET = "utf-8";  
    private static final String FORMAT_NAME = "JPG";  
    // 二维码尺寸  
    private static final int QRCODE_SIZE = 40;  
    // LOGO宽度  
    private static final int WIDTH = 10;  
    // LOGO高度  
    private static final int HEIGHT = 10;  
  
    private static BufferedImage createImage(String content, String imgPath, boolean needCompress) throws Exception {  
        Hashtable<EncodeHintType, Object> hints = new Hashtable<EncodeHintType, Object>();  
        hints.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.H);  
        hints.put(EncodeHintType.CHARACTER_SET, CHARSET);  
        hints.put(EncodeHintType.MARGIN, 1);  
        BitMatrix bitMatrix = new MultiFormatWriter().encode(content, BarcodeFormat.QR_CODE, QRCODE_SIZE, QRCODE_SIZE, hints);  
        int width = bitMatrix.getWidth();  
        int height = bitMatrix.getHeight();  
        BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);  
        for (int x = 0; x < width; x++) {  
            for (int y = 0; y < height; y++) {  
                image.setRGB(x, y, bitMatrix.get(x, y) ? 0xFF000000 : 0xFFFFFFFF);  
            }  
        }  
        if (imgPath == null || "".equals(imgPath)) {  
            return image;  
        }  
        // 插入图片  
        QRCodeUtil.insertImage(image, imgPath, needCompress);  
        return image;  
    }  
  
    private static void insertImage(BufferedImage source, String imgPath, boolean needCompress) throws Exception {  
        File file = new File(imgPath);  
        if (!file.exists()) {  
            System.err.println("" + imgPath + " 二维logo不存在！");  
            return;  
        }  
        Image src = ImageIO.read(new File(imgPath));  
        int width = src.getWidth(null);  
        int height = src.getHeight(null);  
        if (needCompress) { // 压缩LOGO  
            if (width > WIDTH) {  
                width = WIDTH;  
            }  
            if (height > HEIGHT) {  
                height = HEIGHT;  
            }  
            Image image = src.getScaledInstance(width, height, Image.SCALE_SMOOTH);  
            BufferedImage tag = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);  
            Graphics g = tag.getGraphics();  
            g.drawImage(image, 0, 0, null); // 绘制缩小后的图  
            g.dispose();  
            src = image;  
        }  
        // 插入LOGO  
        Graphics2D graph = source.createGraphics();  
        int x = (QRCODE_SIZE - width) / 2;  
        int y = (QRCODE_SIZE - height) / 2;  
        graph.drawImage(src, x, y, width, height, null);  
        Shape shape = new RoundRectangle2D.Float(x, y, width, width, 6, 6);  
        graph.setStroke(new BasicStroke(3f));  
        graph.draw(shape);  
        graph.dispose();  
    }  
  
    public static void encode(String content, String imgPath, String destPath, boolean needCompress) throws Exception {  
        BufferedImage image = QRCodeUtil.createImage(content, imgPath, needCompress);  
        mkdirs(destPath);  
        // 二维码图片  
        String file = content + ".jpg";  
        ImageIO.write(image, FORMAT_NAME, new File(destPath + "/" + file));  
    }  
  
    public static void mkdirs(String destPath) {  
        File file = new File(destPath);  
        // 当文件夹不存在时，mkdirs会自动创建多层目录，区别于mkdir．(mkdir如果父目录不存在则会抛出异常)  
        if (!file.exists() && !file.isDirectory()) {  
            file.mkdirs();  
        }  
    }  
  
    public static void encode(String content, String imgPath, String destPath) throws Exception {  
        QRCodeUtil.encode(content, imgPath, destPath, false);  
    }  
  
    public static void encode(String content, String destPath, boolean needCompress) throws Exception {  
        QRCodeUtil.encode(content, null, destPath, needCompress);  
    }  
  
    public static void encode(String content, String destPath) throws Exception {  
        QRCodeUtil.encode(content, null, destPath, false);  
    }  
  
    public static void encode(String content, String imgPath, OutputStream output, boolean needCompress) throws Exception {  
        BufferedImage image = QRCodeUtil.createImage(content, imgPath, needCompress);  
        ImageIO.write(image, FORMAT_NAME, output);  
    }  
  
    public static void encode(String content, OutputStream output) throws Exception {  
        QRCodeUtil.encode(content, null, output, false);  
    }  
  
    public static String decode(File file) throws Exception {  
        BufferedImage image;  
        image = ImageIO.read(file);  
        if (image == null) {  
            return null;  
        }  
        BufferedImageLuminanceSource source = new BufferedImageLuminanceSource(image);  
        BinaryBitmap bitmap = new BinaryBitmap(new HybridBinarizer(source));  
        com.google.zxing.Result result;  
        Hashtable<DecodeHintType, String> hints = new Hashtable<DecodeHintType, String>();  
        hints.put(DecodeHintType.CHARACTER_SET, CHARSET);  
        result = new MultiFormatReader().decode(bitmap, hints);  
        String resultStr = result.getText();  
        return resultStr;  
    }  
  
    public static String decode(String path) throws Exception {  
        return QRCodeUtil.decode(new File(path));  
    }  
  
    public static void main(String[] args) throws Exception {  
        String text = "HS1625260001";
        // 生成带logo的二维码  
//        QRCodeUtil.encode(text, "d:/zhou/Logo-New.jpg", "d:/MyWorkDoc", true);  
        // 生成不带二维码的logo图片  
         QRCodeUtil.encode(text, null, "d:/MyWorkDoc", true);  
//         drawImage("D:/MyWorkDoc/162932240001.jpg", 2);  
    }  
  
    /** 
     * 打印二维码 
     * @param fileName 
     * @param count 
     */  
    public static void drawImage(String fileName, int count) {  
        try {  
            DocFlavor dof = null;  
  
            if (fileName.endsWith(".gif")) {  
                dof = DocFlavor.INPUT_STREAM.GIF;  
            } else if (fileName.endsWith(".jpg")) {  
                dof = DocFlavor.INPUT_STREAM.JPEG;  
            } else if (fileName.endsWith(".png")) {  
                dof = DocFlavor.INPUT_STREAM.PNG;  
            } else  if (fileName.endsWith(".pdf")){
            	dof=DocFlavor.INPUT_STREAM.AUTOSENSE;
            }
            //设置打印属性  
            PrintRequestAttributeSet aset = new HashPrintRequestAttributeSet();  
            aset.add(new Copies(1));//打印份数，1份  
          //  aset.add(ms);
            // 纵向打印
         //  aset.add(OrientationRequested.PORTRAIT);// 设置成竖打
            // 设定打印区域大小
            MediaPrintableArea mp = new MediaPrintableArea(5f, 5f, 10f, 10f,
            Size2DSyntax.INCH);// 5f, 5f, 100f, 40f
//            aset.add(mp);
//             设定纸张大小
//             CustomedMediaSize 为重写MediaSize代码
            CustomedMediaSize ms = new CustomedMediaSize(40f, 40f, Size2DSyntax.INCH, MediaSizeName.INVOICE);// 100, 110f//MediaSizeName.INVOICE 发票
//            aset.add(MediaSizeName.iso);
                  // 获取所有打印机  
            PrintService[] ps = PrintServiceLookup.lookupPrintServices(dof, aset);  
            
            PrintService myPrinter = null;  
            for (int i = 0; i < ps.length; i++) {  
                String svcName = ps[i].toString();
                //获取所需要的打印机
                if (svcName.contains("9025")) {  
                    myPrinter = ps[i];  
                    System.out.println("my printer found: " + myPrinter);  
                    break;  
                }  
            }  
            DocAttributeSet das = new HashDocAttributeSet();  
            das.add(new MediaPrintableArea(10, 0, 100,20, MediaPrintableArea.MM));  
         //   das.add(MediaSizeName);
            
            FileInputStream fin = new FileInputStream(fileName);  
            Doc doc = new SimpleDoc(fin, dof, das);  
            DocPrintJob job = myPrinter.createPrintJob();  
            job.print(doc, aset);  
            fin.close();  
        } catch (IOException ie) {  
            ie.printStackTrace();  
        } catch (PrintException pe) {  
            pe.printStackTrace();  
        } catch(Exception e){
        	e.printStackTrace();
        } 
    }  
  
} 