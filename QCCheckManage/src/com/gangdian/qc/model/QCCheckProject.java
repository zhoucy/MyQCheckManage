package com.gangdian.qc.model;

import java.io.Serializable;

public class QCCheckProject implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String id;

    private String name;

    private String barcodeimg;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getBarcodeimg() {
        return barcodeimg;
    }

    public void setBarcodeimg(String barcodeimg) {
        this.barcodeimg = barcodeimg == null ? null : barcodeimg.trim();
    }

	@Override
	public String toString() {
		return "QCCheckProject [id=" + id + ", name=" + name + ", barcodeimg="
				+ barcodeimg + "]";
	}
    
}