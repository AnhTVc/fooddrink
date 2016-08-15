package com.project.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.project.POJO.Restaurant;
import com.project.POJO.Sale;
import com.project.POJO.TimeSale;

public class RestaurantDAO {
	/**
	 * Return: restaurant: sale + time_sale + address
	 * @param idRestaurant
	 * @return
	 */
	public Restaurant findRestaurantById(String idRestaurant){
		String query = "SELECT * from restaurant where  restaurant.id_restaurant = " + idRestaurant + ";";
		Connection connection = DBPool.getConnection();
		PreparedStatement preStatement = null;
		ResultSet resultSet = null;
		
		try {
			preStatement = connection.prepareStatement(query);
			resultSet = preStatement.executeQuery(query);
			if(resultSet.next()){
				Restaurant restaurant = new Restaurant();
				restaurant.setName(resultSet.getString("name"));
				restaurant.setPhoneNumber(resultSet.getString("phone_number"));
				restaurant.setIdRestaurant(resultSet.getString("id_restaurant"));
				restaurant.setAvatar(resultSet.getString("avatar"));
				restaurant.setIntroduce(resultSet.getString("introduce"));
				restaurant.setStatusUpdate(resultSet.getInt("status_update"));
				System.out.print("Status ===" + resultSet.getInt("status_update"));
				
				query = "Select * from sale, time_sale where sale.id_restaurant = " + restaurant.getIdRestaurant() + " and sale.id_sale = time_sale.id_sale;";
				Connection conn = DBPool.getConnection();
				PreparedStatement preparedStatement = null;
				ResultSet rs = null;
				try {
					preparedStatement = conn.prepareStatement(query);
					rs = preparedStatement.executeQuery();
					
					ArrayList<Sale> sales = new ArrayList<Sale>();
					Sale sale = null;
					TimeSale timeSale = null;
					while(rs.next()){
						sale = new Sale();
						timeSale = new TimeSale();
						
						sale.setIdSale(rs.getString("id_sale"));
						sale.setSaleOff(rs.getString("sale_off"));
						sale.setStatus(rs.getInt("status"));
						sale.setTimeCreate(rs.getString("time_create"));
						
						timeSale.setFromDate(rs.getString("from_date"));
						timeSale.setFromTime(rs.getString("from_time"));
						timeSale.setToDate(rs.getString("to_date"));
						timeSale.setToTime(rs.getString("to_time"));
						
						sale.setTimeSales(timeSale);
						
						sales.add(sale);
					}
					restaurant.setSales(sales);
					return restaurant;
				} catch (SQLException e) {
					e.printStackTrace();
					// TODO: handle exception
				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return null;
	}
}
