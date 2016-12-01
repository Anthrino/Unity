package com.anthrino.unity.server;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.anthrino.unity.dao.GameDao;
import com.anthrino.unity.dto.GameDto;
import com.google.gson.Gson;

@WebServlet("/GamesServlet")
public class GamesServlet extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	GameDao gd = new GameDao();
		
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		if( request.getRequestURL().toString().contains("gamesearch") && !(request.getParameter("search").isEmpty()))
		{
			String search = request.getParameter("search");
			//System.out.println("In Games Servlet"+search);
			ArrayList<GameDto> games = gd.getGameList(search);
			String json = new Gson().toJson(games);
			//System.out.println(json);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(json);
			// Use AJAX to display data without the refresh
		}
		if(request.getRequestURL().toString().contains("gamepage"))
		{
			System.out.println("In Games Servlet bitches");
			System.out.println(request.getParameter("title"));
			GameDto game = gd.getGame(request.getParameter("title"));
			request.setAttribute("game", game);
			System.out.println(game.getCompany()+game.getTitle());
			request.getRequestDispatcher("/GameTemplate.jsp").include(request, response);
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doGet(request, response);
	}

}
