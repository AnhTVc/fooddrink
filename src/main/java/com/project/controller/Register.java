package com.project.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.DAO.PeopleDAO;
import com.project.POJO.Boss;
import com.project.POJO.Customer;

/**
 * Servlet implementation class Register
 */
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
	PeopleDAO peopleDAO = null;
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Register() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@SuppressWarnings("deprecation")
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email_register");
		String password = request.getParameter("password_register");
		String phonenumber = request.getParameter("phonenumber");

		//String checked = request.getParameterValues("checkbox").toString();
		if (email != null && password != null
				&& phonenumber != null){
			peopleDAO = new PeopleDAO();
			if (request.getParameterValues("checkbox_register") == null) {
				System.out.print("Client register: " + email);
				Customer customer = new Customer();
				customer.setEmail(email);
				customer.setPassword(password);
				customer.setPhoneNumber(phonenumber);
				
				Customer temp = registerCustomer(customer);
				if(temp != null){
					System.out.print("================>" + temp.getName());
					HttpSession httpSession = request.getSession(true);
					httpSession.putValue("name_customer",
							temp.getName());
					RequestDispatcher dispatcher = getServletContext()
							.getRequestDispatcher(
									"/");
					dispatcher.forward(request, response);
				}
			} else {
				//Nhà hàng đăng nhập
				System.out.print("Restaurant register: " + email);
				Boss boss = new Boss();
				boss.setEmail(email);
				boss.setPassword(password);
				boss.setPhoneNumber(phonenumber);
				
				Boss temp = registerBoss(boss);
				if(temp != null){
					System.out.print("=====> ID boss: "
							+ temp.getIdBoss());
					System.out.print("=====> ID restaurant: "
							+ temp.getRestaurant().getIdRestaurant());
					
					//Put session
					HttpSession httpSession = request.getSession(true);
					httpSession.putValue("idBoss",
							temp.getIdBoss());
					httpSession.putValue("idRestaurant",
							temp.getRestaurant().getIdRestaurant());
					
					//forward to url update
					RequestDispatcher dispatcher = getServletContext()
							.getRequestDispatcher(
									"/UpdateInfoRestaurant");
					dispatcher.forward(request, response);
				}
			}
		}
	}

	private Customer registerCustomer(Customer customer) {
		

		return peopleDAO.registerCustomer(customer);
	}
	
	private Boss registerBoss(Boss boss) {
		PeopleDAO peopleDAO = new PeopleDAO();

		return peopleDAO.registerBoss(boss);
	}

}
