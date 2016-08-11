package com.project.DAO;

import java.sql.*;

import com.project.POJO.Boss;
import com.project.POJO.Customer;
import com.project.POJO.People;
import com.project.POJO.Restaurant;

public class PeopleDAO {
	
	/**
	 * Check login return people
	 * @param email
	 * @param password
	 * @param isBoss
	 * @return
	 */
	public People login(String email, String password, boolean isBoss) {
		String query = null;
		if (isBoss) {
			query = "SELECT email, id_boss, id_restaurant FROM boss where password = '"
					+ password + "';";
		} else {
			query = "SELECT email, id_customer FROM customer where password = '"
					+ password + "';";
		}
		Connection connection = DBPool.getConnection();
		PreparedStatement preStatement = null;
		ResultSet resultSet = null;
		DBPool.build(10);
		try {
			preStatement = connection.prepareStatement(query);
			resultSet = preStatement.executeQuery(query);
			if (resultSet.next()) {
				if (email.equals(resultSet.getString("email"))) {
					if (isBoss) {
						Boss boss = new Boss();
						boss.setIdBoss(resultSet.getString("id_boss"));
						boss.setEmail(resultSet.getString("email"));
						Restaurant restaurant = new Restaurant();
						restaurant.setIdRestaurant(resultSet.getString("id_restaurant"));
						
						boss.setRestaurant(restaurant);
						return boss;
					} else {
						Customer customer = new Customer();
						customer.setIdCustomer(resultSet
								.getString("id_customer"));
						customer.setEmail(resultSet.getString("email"));
						
						return customer;
					}
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
}
