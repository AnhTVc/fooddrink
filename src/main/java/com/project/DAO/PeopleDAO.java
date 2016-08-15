package com.project.DAO;

import java.sql.*;

import com.project.POJO.Boss;
import com.project.POJO.Customer;
import com.project.POJO.People;
import com.project.POJO.Restaurant;
import com.project.util.Constant;

public class PeopleDAO {
	private static final int MAX_CONNECTION = 10;
	Connection connection = null;
	PreparedStatement preStatement = null;
	ResultSet resultSet = null;

	public PeopleDAO() {
		DBPool.build(MAX_CONNECTION);
	}

	/**
	 * Check login return people
	 * 
	 * @param email
	 * @param password
	 * @param isBoss
	 * @return
	 */
	public People loginBoss(String email, String password, boolean isBoss) {
		String query = null;
		if (isBoss) {
			query = "SELECT email, id_boss, id_restaurant FROM boss where password = '"
					+ password + "';";
		} else {
			query = "SELECT email, id_customer FROM customer where password = '"
					+ password + "';";
		}
		connection = DBPool.getConnection();

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
						restaurant.setIdRestaurant(resultSet
								.getString("id_restaurant"));

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

	public boolean loginCustomer(Customer customer, String status) {
		String query = null;
		connection = DBPool.getConnection();
		if (status.equals(Constant.LOGIN_NORMAL)) {
			// Login bình thường
			query = "select password from customer where email = '"
					+ customer.getEmail() + "';";
			try {
				preStatement = connection.prepareStatement(query);
				resultSet = preStatement.executeQuery(query);
				if (resultSet.next()) {
					if (customer.getPassword().equals(
							resultSet.getString("password"))) {
						return true;
					}
				}
			} catch (SQLException e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			return false;
		} else if (status.equals(Constant.LOGIN_FACEBOOK)) {
			// Login with facebook
			query = "select name from customer where user_uid = '"
					+ customer.getUserId() + "';";
			System.out.print("Client login with Facebook ID: "
					+ customer.getUserId());
			try {
				preStatement = connection.prepareStatement(query);
				resultSet = preStatement.executeQuery(query);
				if (resultSet.next()) {
					if (customer.getName().equals(resultSet.getString("name"))) {
						return true;
					}
				} else {
					// Chưa tồn tại
					String queryInsert = "INSERT INTO customer (name, user_uid, contact) VALUES('"
							+ customer.getName()
							+ "', '"
							+ customer.getUserId()
							+ "', '"
							+ "https://www.facebook.com/"
							+ customer.getUserId() + "');";
					Statement st = (Statement) connection.createStatement();
					st.executeUpdate(queryInsert);
					return true;
				}
			} catch (SQLException e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			return false;

		} else if (status.equals(Constant.LOGIN_GOOGLE)) {
			// Login with google
			query = "select name from customer where email = '"
					+ customer.getEmail() + "';";
			System.out.print("Name:" + customer.getName());
			try {
				preStatement = connection.prepareStatement(query);
				resultSet = preStatement.executeQuery(query);
				if (resultSet.next()) {
					System.out.print("Name:" + resultSet.getString("name"));
					if (customer.getName().equals(resultSet.getString("name"))) {
						return true;
					}
				} else {
					// Chưa tồn tại
					String queryInsert = "INSERT INTO customer (name, email, contact) VALUES('"
							+ customer.getName()
							+ "', '"
							+ customer.getEmail()
							+ "', '" + customer.getEmail() + "');";
					Statement st = (Statement) connection.createStatement();
					st.executeUpdate(queryInsert);
					return true;
				}
			} catch (SQLException e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			return false;
		}
		return false;
	}

	/**
	 * Customer register
	 * 
	 * @param customer
	 * @return
	 */
	public Customer registerCustomer(Customer customer) {
		connection = DBPool.getConnection();
		String queryInsert = "INSERT INTO customer(email, password, phone_number, name, username) VALUES('"
				+ customer.getEmail()
				+ "', '"
				+ customer.getPassword()
				+ "', '"
				+ customer.getPhoneNumber()
				+ "', '"
				+ customer.getEmail() + "', '" + customer.getEmail() + "');";
		try {
			Statement st = (Statement) connection.createStatement();
			st.executeUpdate(queryInsert);

			Customer temp = new Customer();
			temp.setEmail(customer.getEmail());
			temp.setName(customer.getEmail());
			temp.setUsername(customer.getEmail());
			temp.setPhoneNumber(customer.getPhoneNumber());

			return temp;
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return null;
	}

	/**
	 * Register to table boss Create data in restaurant
	 * 
	 * @param boss
	 * @return
	 */
	public Boss registerBoss(Boss boss) {

		connection = DBPool.getConnection();

		String queryInsertRt = "INSERT INTO restaurant(status_update) values(0);";
		try {
			Statement statement = (Statement) connection.createStatement();
			statement.executeUpdate(queryInsertRt, Statement.RETURN_GENERATED_KEYS);
			
			resultSet = statement.getGeneratedKeys();
			if (resultSet.next()) {
				String idRestaurant = String.valueOf(resultSet.getInt(1));
				String queryInsert = "INSERT INTO boss(email, password, phone_number, full_name, username, id_restaurant) VALUES('"
						+ boss.getEmail()
						+ "', '"
						+ boss.getPassword()
						+ "', '"
						+ boss.getPhoneNumber()
						+ "', '"
						+ boss.getEmail()
						+ "', '"
						+ boss.getEmail() + "', "+ idRestaurant +");";
				Statement st = (Statement) connection.createStatement();
				st.executeUpdate(queryInsert, Statement.RETURN_GENERATED_KEYS);
				
				ResultSet rs = st.getGeneratedKeys();
				if(rs.next()){
					String idBoss = String.valueOf(rs.getInt(1));
					Boss temp = new Boss();
					temp.setEmail(boss.getEmail());
					temp.setFullName(boss.getEmail());
					temp.setUsername(boss.getEmail());
					temp.setPhoneNumber(boss.getPhoneNumber());
					temp.setIdBoss(idBoss);
					
					Restaurant restaurant = new Restaurant();
					restaurant.setIdRestaurant(idRestaurant);
					temp.setRestaurant(restaurant);
					System.out.print("Id Restaurant new Resgiater: " + restaurant.getIdRestaurant() + temp.getFullName());
					
					return temp;
				}
				
			}
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return null;
	}
}
