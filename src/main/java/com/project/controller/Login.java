package com.project.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.DAO.PeopleDAO;
import com.project.DAO.RestaurantDAO;
import com.project.POJO.Boss;
import com.project.POJO.People;
import com.project.POJO.Restaurant;

/**
 * Servlet implementation class Login
 */
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

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
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@SuppressWarnings("deprecation")
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String checked = request.getParameterValues("checkbox").toString();
		if (!email.equals(null) && !password.equals(null)) {
			if (checked.isEmpty()) {
				// Người dùng đăng nhập
				System.out.print(login(email, password, false));
			} else {
				// Nhà hàng đăng nhập
				Boss boss = (Boss) login(email, password, true);
				if (boss.getIdBoss() != null) {
					System.out.print("=====> ID boss: " + boss.getIdBoss());
					System.out.print("=====> ID boss: " + boss.getRestaurant().getIdRestaurant());
					
					//Kiểm tra xem đang ở trạng thái thứ mấy?. Nếu là 0 thì load đến UpdateInfoRestaurant
					RestaurantDAO restaurantDAO = new RestaurantDAO();
					Restaurant restaurant = restaurantDAO.findRestaurantById(boss.getRestaurant().getIdRestaurant());
					//Sẽ ko có TH null vì khi tạo nhà hàng mặc định sẽ phải sinh ra tên nhà hàng
					System.out.print(restaurant.getIdRestaurant());
					if(restaurant.getStatusUpdate() == 0){
						//Nhà hàng mới chưa có thông tin
						RequestDispatcher dispatcher = getServletContext()
								.getRequestDispatcher("/UpdateInfoRestaurant");
						dispatcher.forward(request, response);
					}else{
						HttpSession httpSession = request.getSession(true);
						httpSession.putValue("id_boss", boss.getIdBoss());
						RequestDispatcher dispatcher = getServletContext()
								.getRequestDispatcher("/AdminRestaurant");
						dispatcher.forward(request, response);
					}
				}
			}
		}
	}

	private People login(String email, String password, boolean isBoss) {
		PeopleDAO peopleDAO = new PeopleDAO();

		return peopleDAO.login(email, password, isBoss);

	}

}
