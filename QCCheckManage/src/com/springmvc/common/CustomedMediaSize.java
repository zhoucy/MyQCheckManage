package com.springmvc.common;

//Decompiled by Jad v1.5.8f. Copyright 2001 Pavel Kouznetsov.
//Jad home page: http://www.kpdus.com/jad.html
//Decompiler options: packimports(3) radix(10) lradix(10) 

import java.util.HashMap;
import java.util.Vector;

import javax.print.attribute.standard.MediaSize;
import javax.print.attribute.standard.MediaSizeName;

//Referenced classes of package javax.print.attribute.standard:
//         MediaSizeName

public class CustomedMediaSize extends MediaSize
{

	/**
	 * 
	 */
    private MediaSizeName mediaName;
    private static HashMap mediaMap = new HashMap(100, 10F);
    private static Vector sizeVector = new Vector(100, 10);
	private static final long serialVersionUID = 1L;
	public static final int INCH = 25400;
	public static final int MM = 1000;
	  public CustomedMediaSize(float f, float f1, int i, MediaSizeName mediasizename)
	    {
	        super(f, f1, i);
	       
	        if(mediasizename != null && mediaMap.get(mediasizename) == null)
	        {
	            mediaName = mediasizename;
	            mediaMap.put(mediaName, this);
	        }
	        sizeVector.add(this);
	    }
	  
	    public CustomedMediaSize(int i, int j, int k)
	    {
	        super(i, j, k);
	        
	            sizeVector.add(this);
	            return;
	    }

}