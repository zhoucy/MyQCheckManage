package com.springmvc.util;

import java.awt.image.BufferedImage;
import java.util.HashMap;
import java.util.Map;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.WriterException;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;

public class QRGraphics {

	private static final int BLACK = 0xFF000000;       //��ɫ
	private static final int WHITE = 0xFFFFFFFF;       //��ɫ
	private static final String CHARSET = "utf-8";     //����
	private static final int QRCODE_SIZE = 50;         //��ά��ߴ�(��ȸ߶�)

	public static BufferedImage getQRimg(String content) {
		MultiFormatWriter multiFormatWriter = new MultiFormatWriter();
		Map<EncodeHintType, Object> hints = new HashMap<EncodeHintType, Object>();
		hints.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.H);  //�ݴ���
        hints.put(EncodeHintType.CHARACTER_SET, CHARSET);                    //����
        hints.put(EncodeHintType.MARGIN, 1);                                 //�߾�
		try {
			BitMatrix matrix = multiFormatWriter.encode(content, BarcodeFormat.QR_CODE,
					QRCODE_SIZE, QRCODE_SIZE, hints);
			int width = matrix.getWidth();
			int height = matrix.getHeight();
			BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
			for (int x = 0; x < width; x++) {
				for (int y = 0; y < height; y++) {
					image.setRGB(x, y, matrix.get(x, y) ? BLACK : WHITE);
				}
			}
			return image;
		} catch (WriterException e) {
			e.printStackTrace();
		}
		return null;
	}
}

