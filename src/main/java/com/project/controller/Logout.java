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

/**
 * Servlet implementation class Logout
 */
public class Logout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Logout() {
        super();

        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
		HttpSession httpSession = request.getSession();
		 System.out.print("Have client Logout");
		httpSession.invalidate();
		
		RequestDispatcher dispatcher = getServletContext()
				.getRequestDispatcher("/index.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String status = request.getParameter("logout");
		if(status.equals("true")){
			HttpSession httpSession = request.getSession();
			httpSession.invalidate();
			JsonObject data = new JsonObject();
		    data.addProperty("data", "true");
		    
			response.setContentType("application/json");
			request.setCharacterEncoding("utf-8");
			response.getWriter().write(new Gson().toJson(data));
			//Đăng nhập thành công
		}
	}

}
