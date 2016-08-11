package com.project.POJO;


public class Sale {
	private String idSale;
	private TimeSale timeSales;
	private String saleOff; //Giảm giá theo % ví dụ 10 <=> 10%
	private String timeCreate; //Ví dụ 10:30:00 08:06:2016
	private int status; //Trạng thái giảm giá; mặc định là 0; -1 sale này đã được nhà hàng update
	public String getTimeCreate() {
		return timeCreate;
	}
	public void setTimeCreate(String timeCreate) {
		this.timeCreate = timeCreate;
	}
	public String getSaleOff() {
		return saleOff;
	}
	public void setSaleOff(String saleOff) {
		this.saleOff = saleOff;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getIdSale() {
		return idSale;
	}
	public void setIdSale(String idSale) {
		this.idSale = idSale;
	}
	public TimeSale getTimeSales() {
		return timeSales;
	}
	public void setTimeSales(TimeSale timeSales) {
		this.timeSales = timeSales;
	}
}
