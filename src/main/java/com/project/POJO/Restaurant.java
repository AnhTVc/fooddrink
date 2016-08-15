package com.project.POJO;

import java.util.ArrayList;

public class Restaurant {
	private String idRestaurant;
	private Address address;
	private String name;
	private String phoneNumber;
	private String introduce;//Mô tả nhà hàng
	private String contact;
	private String avatar; //Url ảnh đại diện
	private ArrayList<GroupMenu> groupMenus; //Danh sách các món ăn
	private ArrayList<Sale> sales; //Một nhà hàng có nhiều chương trình giảm giá
	private int statusUpdate;
	
	public String getIdRestaurant() {
		return idRestaurant;
	}
	public void setIdRestaurant(String idRestaurant) {
		this.idRestaurant = idRestaurant;
	}
	public Address getAddress() {
		return address;
	}
	public void setAddress(Address address) {
		this.address = address;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public String getAvatar() {
		return avatar;
	}
	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
	public ArrayList<GroupMenu> getGroupMenus() {
		return groupMenus;
	}
	public void setGroupMenus(ArrayList<GroupMenu> groupMenus) {
		this.groupMenus = groupMenus;
	}
	public ArrayList<Sale> getSales() {
		return sales;
	}
	public void setSales(ArrayList<Sale> sales) {
		this.sales = sales;
	}
	public int getStatusUpdate() {
		return statusUpdate;
	}
	public void setStatusUpdate(int statusUpdate) {
		this.statusUpdate = statusUpdate;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	
}
