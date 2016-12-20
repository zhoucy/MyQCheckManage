package com.springmvc.util.print;

import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.imageio.ImageIO;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.BinaryBitmap;
import com.google.zxing.DecodeHintType;
import com.google.zxing.EncodeHintType;
import com.google.zxing.LuminanceSource;
import com.google.zxing.MultiFormatReader;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.NotFoundException;
import com.google.zxing.Result;
import com.google.zxing.WriterException;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.common.HybridBinarizer;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;

//��ά�빤����
public class CodeUtil {

	
	private static final String FORMAT_NAME = "JPG";   //����ͼƬ�ĸ�ʽ
	private static final int BLACK = 0xFF000000;       //��ɫ
	private static final int WHITE = 0xFFFFFFFF;       //��ɫ
	private static final String CHARSET = "UTF-8";     //����
	
	//��ͼ
	private static BufferedImage drawImage(BitMatrix matrix){
		int width=matrix.getWidth();
		int height=matrix.getHeight();
		BufferedImage img=new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		for (int x = 0; x < width; x++) {
			for (int y = 0; y < height; y++) {
				img.setRGB(x, y, matrix.get(x, y) ? BLACK : WHITE);
			}
		}
		return img;
	}

	//����ͼƬ������ά�벢����bitmap
	private static BinaryBitmap decodeImage(BufferedImage img) {
		LuminanceSource source = new BufferedImageLuminanceSource(img);
		BinaryBitmap bitmap = new BinaryBitmap(new HybridBinarizer(source));
		return bitmap;
	}
	
	//Ĭ������
	private static Map<EncodeHintType, Object> defaultHints(){
		Map<EncodeHintType, Object> hints = new HashMap<EncodeHintType, Object>();
		hints.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.H);  //�ݴ���
        hints.put(EncodeHintType.CHARACTER_SET, CHARSET);                    //����
        hints.put(EncodeHintType.MARGIN, 1);                                 //�߾�
        return hints;
	}
	
	/**
	 *                          �Զ�������
	 * @param errorLevel        �ݴ�ȼ�   ErrorCorrectionLevel.*
	 * @param charset           �ַ�����   UTF-8..
	 * @param margin            �߾�          ����
	 * @return                  ����Map<EncodeHintType, Object>
	 */
	private static Map<EncodeHintType, Object> customHints(EncodeHintType errorLevel,
			String charset,int margin){
		Map<EncodeHintType, Object> hints = new HashMap<EncodeHintType, Object>();
		hints.put(EncodeHintType.ERROR_CORRECTION, errorLevel);               //�ݴ���
	    hints.put(EncodeHintType.CHARACTER_SET, charset);                     //����
	    hints.put(EncodeHintType.MARGIN, margin);                             //�߾�
	    return hints;
	}
	
	/**
	 *                  ��׼��ά��
	 * @param content   ��ά������
	 * @param size      ��ά��ߴ�
	 * @return          ���ض�ά���BufferedImage
	 */
	public static BufferedImage getQRcode(String content,int size){
        return getQRcode(content, size, defaultHints());
	}
	
	/**
	 *                        ��׼��ά��
	 * @param content         ��ά������
	 * @param size            ��ά��ĳߴ�
	 * @param errorLevel      �ݴ�ȼ�ErrorCorrectionLevel.*
	 * @param charset         �ַ�����  �� UTF-8..
	 * @param margin          �߾�          ����
	 * @return                ���ض�ά���BufferedImage
	 */
	public static BufferedImage getQRcode(String content,int size,EncodeHintType errorLevel,
			String charset,int margin){
        return getQRcode(content, size, customHints(errorLevel, charset, margin));
	}
	
	/**
	 *                  ��׼��ά��
	 * @param content   ��ά������
	 * @param size      ��ά������
	 * @param hints     ��������(�ݴ���,�ַ�����,�߾�)
	 * @return          ���ض�ά���BufferedImage
	 */
	public static BufferedImage getQRcode(String content,int size,Map<EncodeHintType, Object> hints){
		BitMatrix matrix;
		try {
			matrix = new MultiFormatWriter().encode(content, BarcodeFormat.QR_CODE,size, size, hints);
			return drawImage(matrix);
		} catch (WriterException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 *                   �м��logo�Ķ�ά��
	 * @param content    ��ά�������
	 * @param size       ��ά��ĳߴ�
	 * @param logoPath   logo��ַ
	 * @param logoRate   logoռ�ٷֱ�
	 * @return           ���ش�logo�Ķ�ά���BufferedImage
	 */	
	public static BufferedImage getQRcodeWithLogo(String content,int size,String logoPath,int logoRate){
        return getQRcodeWithLogo(content, size, defaultHints(), logoPath, logoRate);
	}
	
	/**
	 *                        �м��logo�Ķ�ά��
	 * @param content         ��ά�������
	 * @param size            ��ά��ĳߴ�
	 * @param logoPath        logo��ַ
	 * @param logoRate        logoռ�ٷֱ� 
	 * @param errorLevel      �ݴ�ȼ�ErrorCorrectionLevel.*
	 * @param charset         �ַ�����  �� UTF-8..
	 * @param margin          �߾�          ����
	 * @return                ���ش�logo�Ķ�ά���BufferedImage
	 */
	public static BufferedImage getQRcodeWithLogo(String content,int size,String logoPath,int logoRate,
			              EncodeHintType errorLevel,String charset,int margin){
        return getQRcodeWithLogo(content, size, customHints(errorLevel, charset, margin), 
        		logoPath, logoRate);
	}
	
	/**
	 *                    �м��logo�Ķ�ά��
	 * @param content     ��ά�������
	 * @param size        ��ά��ĳߴ�
	 * @param hints       ��������(�ݴ���,�ַ�����,�߾�)
	 * @param logoPath    logo��ַ
	 * @param logoRate    logoռ�ٷֱ�
	 * @return            ���ش�logo�Ķ�ά���BufferedImage
	 */
	public static BufferedImage getQRcodeWithLogo(String content,int size,Map<EncodeHintType, Object> hints,
			                                      String logoPath,int logoRate){
		if(logoRate<15||logoRate>30){  //����30����ʶ��,С��15��̫С
			//��Ч�ı���������Ĭ��ֵ
			logoRate=20;
		}
		
        try {
			BufferedImage img=getQRcode(content,size,hints);                           //��׼��ά��
			BufferedImage logo=readImg(logoPath);                                     //logoԭͼ							
			Graphics2D imgg=img.createGraphics();
						
			int logoSize=size*logoRate/100;                                     
			int logoXY=(size-logoSize)/2;
			imgg.drawImage(logo, logoXY, logoXY,logoSize,logoSize, null);
			return img;
		} catch (Exception e) {
			e.printStackTrace();
		}
        return null;
	}		
	
	/**
	 *                       ��׼��һά��(CODE_128������)
	 * @param content        һά�������
	 * @param width          һά��Ŀ��
	 * @param height         һά��ĸ߶�
	 * @return               ����һά���BufferedImage
	 */
	public static BufferedImage getBarcode(String content,int width,int height){
		try {
			content=content.toUpperCase();
			BitMatrix matrix = new MultiFormatWriter().encode(content, BarcodeFormat.CODE_128,width, height);
			BufferedImage img=drawImage(matrix);
			return img;
		} catch (WriterException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	/**
	 *                       �·������ݵ�һά��
	 * @param content        һά�������
	 * @param width          һά��Ŀ��
	 * @param height         һά��ĸ߶�
	 * @return               ����һά���BufferedImage
	 */
	public static BufferedImage getBarcodeWithStr(String content,int width,int height){
		try {
			content=content.toUpperCase();                        //content������ת�ɴ�д
			int margin=10;                                        //������������ļ��
			BitMatrix matrix = new MultiFormatWriter().encode(content, BarcodeFormat.CODE_128,width, height);
			BufferedImage img=drawImage(matrix);
			BufferedImage result=new BufferedImage(img.getWidth(), img.getHeight()+margin, BufferedImage.TYPE_INT_RGB);
			Graphics2D g=result.createGraphics();
			g.drawImage(img, 0, 0, null);
			g.setColor(Color.WHITE);
			g.fillRect(0, img.getHeight(), img.getWidth(), 10);
			int strWidth=g.getFontMetrics().stringWidth(content);
			int strX=(img.getWidth()-strWidth)/2;
			int strY=img.getHeight()+margin;
			g.setColor(Color.BLACK);
			g.drawString(content, strX, strY);
			return result;
		} catch (WriterException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 *                 ������ά��
	 * @param img      ��������ͼƬ
	 * @return         ���ؽ����������(String����)
	 */
	public static String QRdecode(BufferedImage img){
		Map<DecodeHintType, Object> hints = new HashMap<DecodeHintType, Object>();
        hints.put(DecodeHintType.CHARACTER_SET, CHARSET);                    //����       
		return QRdecode(img, hints);
	}
	
	/**
	 *                ������ά��
	 * @param img     ��������ͼƬ
	 * @param hints   ����(�ݴ���,�ַ�����,�߾��)
	 * @return        ���ؽ����������(String����)
	 */ 
	public static String QRdecode(BufferedImage img,Map<DecodeHintType, Object> hints){
		Result result=null;                    
        try {
			result=new MultiFormatReader().decode(decodeImage(img),hints);
			return result.getText();
		} catch (NotFoundException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 *                ����һά��(������)
	 * @param img     ����ж��ͼƬ
	 * @return        ���ؽ����������(String����)
	 */
	public static String Bardecode(BufferedImage img){
		try {
			Result result=new MultiFormatReader().decode(decodeImage(img));
			return result.getText();
		} catch (NotFoundException e) {
			e.printStackTrace();
		}
		return null;		
	}
	
	/**
	 *                    ����ͼƬ��ָ��·��(ͼƬ��ʽJPG)
	 * @param img         ͼƬ
	 * @param filePath    ·��
	 */
	public static void saveImg(BufferedImage img,String filePath){
		File file=new File(filePath);
		if(!file.exists()){
			file.mkdirs();
		}
		String picName=System.currentTimeMillis()+".jpg";
		try {
			ImageIO.write(img, FORMAT_NAME, new File(file+"/"+picName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 *                      ����·����ͼƬ
	 * @param imgPath       ͼƬ·��
	 * @return              ����BufferedImage
	 */
	public static BufferedImage readImg(String imgPath){
		File file=new File(imgPath);
		BufferedImage img=null;
		if(file.exists()){
			try {
				img=ImageIO.read(file);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}		
		return img;
	}
}
