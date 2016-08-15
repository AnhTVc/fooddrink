package com.project.controller;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.project.DAO.PeopleDAO;
import com.project.DAO.RestaurantDAO;
import com.project.POJO.Boss;
import com.project.POJO.Customer;
import com.project.POJO.People;
import com.project.POJO.Restaurant;
import com.project.util.Constant;

/**
 * Servlet implementation class Login
 */
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	PeopleDAO peopleDAO = new PeopleDAO();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Login() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = getServletContext()
				.getRequestDispatcher("/url/login.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * Check status
	 * 
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@SuppressWarnings("deprecation")
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String statusLogin = request.getParameter("status");
		Customer customer = new Customer();
		if (statusLogin != null) {
			if (statusLogin.equals(Constant.LOGIN_NORMAL)) {
				// Login bình thường; check có phải là nhà hàng hay không
				String email = request.getParameter("email");
				String password = request.getParameter("password");
				String checked = request.getParameterValues("checkbox")
						.toString();
				if (!email.equals(null) && !password.equals(null)) {
					if (checked.isEmpty()) {
						// Người dùng đăng nhập
						System.out.print(loginBoss(email, password, false));
					} else {
						// Nhà hàng đăng nhập
						Boss boss = (Boss) loginBoss(email, password, true);
						if (boss.getIdBoss() != null) {
							System.out.print("=====> ID boss: "
									+ boss.getIdBoss());
							System.out.print("=====> ID boss: "
									+ boss.getRestaurant().getIdRestaurant());

							// Kiểm tra xem đang ở trạng thái thứ mấy?. Nếu là 0
							// thì load đến UpdateInfoRestaurant
							RestaurantDAO restaurantDAO = new RestaurantDAO();
							Restaurant restaurant = restaurantDAO
									.findRestaurantById(boss.getRestaurant()
											.getIdRestaurant());
							// Sẽ ko có TH null vì khi tạo nhà hàng mặc định sẽ
							// phải sinh ra tên nhà hàng
							System.out.print(restaurant.getIdRestaurant());
							if (restaurant.getStatusUpdate() == 0) {
								// Nhà hàng mới chưa có thông tin
								RequestDispatcher dispatcher = getServletContext()
										.getRequestDispatcher(
												"/UpdateInfoRestaurant");
								dispatcher.forward(request, response);
							} else {
								HttpSession httpSession = request
										.getSession(true);
								httpSession.putValue("id_boss",
										boss.getIdBoss());
								RequestDispatcher dispatcher = getServletContext()
										.getRequestDispatcher(
												"/AdminRestaurant");
								dispatcher.forward(request, response);
							}
						}
					}
				}
			} else if (statusLogin.equals(Constant.LOGIN_FACEBOOK)) {
				String name = request.getParameter("name");
				String userId = request.getParameter("userId");
				if (userId != null) {
					customer.setUserId(userId);
					customer.setName(name);

					if (loginCustomer(customer, statusLogin)) {
						HttpSession httpSession = request.getSession(true);
						httpSession.putValue("name_customer",
								customer.getName());

						JsonObject data = new JsonObject();
						data.addProperty("authen", "true");

						response.setContentType("application/json");
						request.setCharacterEncoding("utf-8");
						response.getWriter().write(new Gson().toJson(data));
						// Đăng nhập thành công
					} else {
						// Đăng nhập không thành công
						JsonObject data = new JsonObject();
						data.addProperty("authen", "false");

						response.setContentType("application/json");
						request.setCharacterEncoding("utf-8");
						response.getWriter().write(new Gson().toJson(data));
					}
				} else {
					response.getWriter().write("Error");
				}
			} else if (statusLogin.equals(Constant.LOGIN_GOOGLE)) {
				String name = request.getParameter("name");
				String email = request.getParameter("email");

				if (email != null) {
					customer.setEmail(email);
					customer.setName(name);

					if (loginCustomer(customer, statusLogin)) {
						HttpSession httpSession = request.getSession(true);
						httpSession.putValue("name_customer",
								customer.getName());

						JsonObject data = new JsonObject();
						data.addProperty("authen", "true");

						response.setContentType("application/json");
						request.setCharacterEncoding("utf-8");
						response.getWriter().write(new Gson().toJson(data));
						// Đăng nhập thành công
					} else {
						// Đăng nhập không thành công
						JsonObject data = new JsonObject();
						data.addProperty("authen", "false");

						response.setContentType("application/json");
						request.setCharacterEncoding("utf-8");
						response.getWriter().write(new Gson().toJson(data));
					}
				} else {
					response.getWriter().write("Error");
				}
			}
		} else {
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String checked = request.getParameterValues("checkbox").toString();
			if (!email.equals(null) && !password.equals(null)) {
				if (checked.isEmpty()) {
					// Người dùng đăng nhập
					System.out.print(loginBoss(email, password, false));
				} else {
					// Nhà hàng đăng nhập
					Boss boss = (Boss) loginBoss(email, password, true);
					if (boss.getIdBoss() != null) {
						System.out.print("=====> ID boss: " + boss.getIdBoss());
						System.out.print("=====> ID restauranr: "
								+ boss.getRestaurant().getIdRestaurant());

						// Kiểm tra xem đang ở trạng thái thứ mấy?. Nếu là 0 thì
						// load đến UpdateInfoRestaurant
						RestaurantDAO restaurantDAO = new RestaurantDAO();
						Restaurant restaurant = restaurantDAO
								.findRestaurantById(boss.getRestaurant()
										.getIdRestaurant());
						// Sẽ ko có TH null vì khi tạo nhà hàng mặc định sẽ phải
						// sinh ra tên nhà hàng
						if (restaurant.getStatusUpdate() == 0) {
							// Nhà hàng mới chưa có thông tin
							RequestDispatcher dispatcher = getServletContext()
									.getRequestDispatcher(
											"/UpdateInfoRestaurant");
							dispatcher.forward(request, response);
						} else {
							//Put to session
							HttpSession httpSession = request.getSession(true);
							httpSession.putValue("idBoss",
									boss.getIdBoss());
							httpSession.putValue("idRestaurant",
									boss.getRestaurant().getIdRestaurant());
									
							RequestDispatcher dispatcher = getServletContext()
									.getRequestDispatcher("/AdminRestaurant");
							dispatcher.forward(request, response);
						}
					}
				}
			}
		}

	}

	private People loginBoss(String email, String password, boolean isBoss) {
		return peopleDAO.loginBoss(email, password, isBoss);
	}

	private boolean loginCustomer(Customer customer, String status) {
		return peopleDAO.loginCustomer(customer, status);
	}

}
