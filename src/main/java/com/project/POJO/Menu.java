package com.project.POJO;

public class Menu {
	private String idMenu;
	private String name; //Tên món ăn
	private String nameRestaurant; //Lưu tên, địa chỉ nhà hàng, để hỗ trợ tìm kiếm nhanh.
	private String price; //Giá món ăn
	private String sale; // phần trăm giảm giá: 30%
	private String image; //Url ảnh
	public String getIdMenu() {
		return idMenu;
	}
	public void setIdMenu(String idMenu) {
		this.idMenu = idMenu;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNameRestaurant() {
		return nameRestaurant;
	}
	public void setNameRestaurant(String nameRestaurant) {
		this.nameRestaurant = nameRestaurant;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getSale() {
		return sale;
	}
	public void setSale(String sale) {
		this.sale = sale;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
}
