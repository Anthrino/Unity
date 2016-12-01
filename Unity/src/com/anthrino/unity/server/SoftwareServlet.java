package com.anthrino.unity.server;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.anthrino.unity.dao.SoftwareDao;
import com.anthrino.unity.dto.SoftwareDto;
import com.google.gson.Gson;

@WebServlet("/SoftwareServlet")
public class SoftwareServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	SoftwareDao sd = new SoftwareDao();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
			
 		if(request.getRequestURL().toString().contains("search"))
		{
			String search = request.getParameter("search");
			ArrayList<SoftwareDto> list = sd.getSoftwareList(search);
			String json = new Gson().toJson(list);
			//System.out.println(json);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(json);
			// Use AJAX to display data without the refresh

		}
 		if(request.getRequestURL().toString().contains("softwarepage"))
		{
			SoftwareDto software = sd.getSoftware(request.getParameter("title"));
			request.setAttribute("software", software);
			request.getRequestDispatcher("/SoftwareTemplate.jsp").include(request, response);
		}
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		doGet(request, response);
	}

}
