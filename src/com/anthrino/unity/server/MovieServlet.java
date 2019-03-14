package com.anthrino.unity.server;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.anthrino.unity.dao.MovieDao;
import com.anthrino.unity.dto.MovieDto;
import com.google.gson.Gson;

@WebServlet("/MovieServlet")
public class MovieServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	MovieDao md = new MovieDao();  
      	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		if( request.getRequestURL().toString().contains("moviesearch"))
		{
			String search = request.getParameter("search");
			ArrayList<MovieDto> list = md.getMovieList(search);
			String json = new Gson().toJson(list);
			System.out.println(json);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(json);
			// Use AJAX to display data without the refresh
		}
		if(request.getRequestURL().toString().contains("moviepage"))
		{
			MovieDto movie = md.getMovie(request.getParameter("title"),1);
			request.setAttribute("movie", movie);
			request.getRequestDispatcher("/MovieTemplate.jsp").include(request, response);
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doGet(request, response);
	}

}
