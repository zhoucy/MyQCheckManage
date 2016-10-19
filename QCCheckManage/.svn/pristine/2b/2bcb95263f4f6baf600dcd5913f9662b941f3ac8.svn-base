package com.springmvc.util;

import java.awt.Color;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.awt.print.PageFormat;
import java.awt.print.Printable;
import java.awt.print.PrinterException;
import java.io.IOException;
import java.net.InetAddress;

import javax.print.Doc;
import javax.print.DocFlavor;
import javax.print.DocPrintJob;
import javax.print.PrintException;
import javax.print.PrintService;
import javax.print.PrintServiceLookup;
import javax.print.SimpleDoc;
import javax.print.attribute.HashPrintRequestAttributeSet;
import javax.print.attribute.PrintRequestAttributeSet;
import javax.print.attribute.standard.Copies;
import javax.print.attribute.standard.MediaPrintableArea;
import javax.print.event.PrintJobEvent;
import javax.print.event.PrintJobListener;
import javax.print.event.PrintServiceAttributeEvent;
import javax.print.event.PrintServiceAttributeListener;


public class PrintQRCODE implements Printable{

	private String content;
	
	
	
	public void print(String content){
		this.content=content;
		DocFlavor flavor=DocFlavor.SERVICE_FORMATTED.PRINTABLE;
		//构建打印请求属性集 
		PrintRequestAttributeSet aset=new HashPrintRequestAttributeSet();	
		//设置:打印区域,打印份数
		aset.add(new MediaPrintableArea(20, 20, 700, 700, MediaPrintableArea.MM));
		aset.add(new Copies(1));
		PrintService ps=PrintServiceLookup.lookupDefaultPrintService();		
		if(ps!=null){
			DocPrintJob pj=ps.createPrintJob();
			//这里的监听器只能监听打印机的属性是否发生变动,如果变动会执行attributeUpdate的方法
			//脱机,阻塞的情况无法被监听
			ps.addPrintServiceAttributeListener(new PrintServiceAttributeListener() {				
				public void attributeUpdate(PrintServiceAttributeEvent psae) {
					// 当打印服务的属性发生变化时，PrintServiceAttributeListener.attributeUpdate()方法将会被调用。
					//服务使用PrintServiceAttributeListener接口来决定支持哪些事件。					
					System.out.println("attributeUpdate");
				}
			});
			//监听打印任务的执行情况
			pj.addPrintJobListener(new PrintJobListener() {
				
				public void printJobRequiresAttention(PrintJobEvent pje) {
					// 要求关注(如缺纸,卡纸)打印机无法自己恢复,需要人来处理
					System.out.println("printJobRequiresAttention:"+pje.getPrintEventType());
				}				
				public void printJobNoMoreEvents(PrintJobEvent pje) {
					// 一个打印工作有可能在一个网络打印服务的缓冲队列中处于假脱机状态。此时“no more events”
					//消息虽然不能说明打印工作已经成功执行，但用户至少可以判断出该工作可能还没有失败
					System.out.println("printJobNoMoreEvents:"+pje.getPrintEventType());
				}				
				public void printJobFailed(PrintJobEvent pje) {
					// 任务失败
					System.out.println("printJobFailed:"+pje.getPrintEventType());
				}				
				public void printJobCompleted(PrintJobEvent pje) {
					// 任务完成
					System.out.println("printJobCompleted:"+pje.getPrintEventType());
				}			
				public void printJobCanceled(PrintJobEvent pje) {
					// 任务取消
					System.out.println("printJobCanceled:"+pje.getPrintEventType());
				}				
				public void printDataTransferCompleted(PrintJobEvent pje) {
					// 数据传输完毕
					System.out.println("printDataTransferCompleted:"+pje.getPrintEventType());
				}
			});
			
			
			try {
				Doc doc=new SimpleDoc(this, flavor, null);
				pj.print(doc, aset);
			} catch (PrintException e) {				
				e.printStackTrace();
			}
		}else{
			System.out.println("未找到打印机");
		}
	}
	
	public int print(Graphics graphics, PageFormat pageFormat, int pageIndex) throws PrinterException {
		if(pageIndex==0){
			Graphics2D g2d=(Graphics2D)graphics;
			//g2d.translate(pageFormat.getImageableX(), pageFormat.getImageableY());
			//g2d.setColor(Color.black);
			//g2d.drawString(content,150, 20);
			//g2d.fillRect(100, 10, 100, 100);			
			BufferedImage img=QRGraphics.getQRimg(content);			
			g2d.drawImage(img, 150, 20,null);
			g2d.drawString(content, 150, img.getHeight()+20+10);
			return Printable.PAGE_EXISTS;
		}else{
			return Printable.NO_SUCH_PAGE;
		}
	}
	//ping ip查看该打印机是否在线
	public static boolean ping(String ip,int timeOut){
		try {
			return InetAddress.getByName(ip).isReachable(timeOut);
		} catch (IOException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	//测试方法
	public static void main(String[] args) {
		String content="HS163110003000108";
		PrintQRCODE p=new PrintQRCODE();		
		p.print(content);		
	}
	
	

}
