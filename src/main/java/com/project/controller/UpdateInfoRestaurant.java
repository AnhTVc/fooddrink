package com.project.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.POJO.Restaurant;

/**
 * Servlet implementation class UpdateInfoRestaurant
 */
public class UpdateInfoRestaurant extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public UpdateInfoRestaurant() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	/**
	 * Boss update info
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		String name = request.getParameter("name_restaurant");
		String address = request.getParameter("address_restaurant");
		String contact = request.getParameter("contact_restaurant");
		String avatar = request.getParameter("avatar_restaurant");
		
		if(name != null){
			HttpSession httpSession = request.getSession();
			String idRestaurant = (String) httpSession.getAttribute("idRestaurant");
			String idBoss = (String) httpSession.getAttribute("idRestaurant");
			
			if(idRestaurant != null){
				//Session exit
				
				Restaurant restaurant = new Restaurant();
				restaurant.setIdRestaurant(idRestaurant);
				restaurant.setName(name);
				restaurant.setContact(contact);
				restaurant.setAvatar(avatar);
				
			}else {
				//Session not exit
			}
			
		}else{
			//Trang login or register gui yeu cau toi
			RequestDispatcher dispatcher = getServletContext()
					.getRequestDispatcher("/url/updateInfoRestaurant.jsp");
			dispatcher.forward(request, response);
		}
	}

}
