package com.anthrino.unity.server;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.anthrino.unity.dao.CartDao;
import com.anthrino.unity.dao.GameDao;
import com.anthrino.unity.dao.MovieDao;
import com.anthrino.unity.dao.SoftwareDao;
import com.anthrino.unity.dto.CartDto;
import com.anthrino.unity.dto.GameDto;
import com.anthrino.unity.dto.MovieDto;
import com.anthrino.unity.dto.SoftwareDto;
import com.anthrino.unity.dto.UserDto;

@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		CartDao dbaccess = new CartDao();
		HttpSession s = request.getSession();
		UserDto user = (UserDto) s.getAttribute("user");
		if(user.getUser_id() == 0)
		{
			request.setAttribute("message","Please Login/Sign-Up to view cart and make purchases.");
			request.getRequestDispatcher("/Login.jsp").include(request, response);
		}
		else if( request.getRequestURL().toString().contains("cart"))
		{
			ArrayList<CartDto> list = dbaccess.getProductList(user);
			//System.out.print("getting list :");

			request.setAttribute("product_list",list);
			request.getRequestDispatcher("/Cart.jsp").include(request, response);
		}
		else if( request.getRequestURL().toString().contains("addtoCart"))
		{
			//System.out.print("adding to cart :");
			if( request.getParameter("type").equals("buy"))
			{
				System.out.println(dbaccess.insertProduct(user,Integer.parseInt(request.getParameter("id")),request.getParameter("title"),
						Integer.parseInt(request.getParameter("price")),request.getParameter("category")));
			}
			else if( request.getParameter("type").equals("rent"))
			{
				System.out.println(dbaccess.insertProduct(user,Integer.parseInt(request.getParameter("id")),request.getParameter("title"),
						Integer.parseInt(request.getParameter("rent")),request.getParameter("category")));
			}
			ArrayList<CartDto> list = dbaccess.getProductList(user);
			request.setAttribute("product_list",list);
			request.getRequestDispatcher("/Cart.jsp").include(request, response);
		}
		if( request.getRequestURL().toString().contains("productpage"))
		{
			String P_Title = (String) request.getParameter("title");
			//System.out.println("in pp:"+P_Title);
			if(request.getParameter("category").equals("game"))
			{
				GameDto game = new GameDao().getGame(P_Title);
				request.setAttribute("game",game);
				request.getRequestDispatcher("/GameTemplate.jsp").include(request, response);
			}
			if(request.getParameter("category").equals("movie"))
			{
				MovieDto movie = new MovieDao().getMovie(P_Title,1);
				request.setAttribute("movie",movie);
				request.getRequestDispatcher("/MovieTemplate.jsp").include(request, response);
			}
			if(request.getParameter("category").equals("software"))
			{
				SoftwareDto software = new SoftwareDao().getSoftware(P_Title);
				request.setAttribute("software",software);
				request.getRequestDispatcher("/SoftwareTemplate.jsp").include(request, response);
			}
			
		}
		if( request.getRequestURL().toString().contains("deleteproduct"))
		{
			String P_Title = (String) request.getParameter("title");
			int P_ID = Integer.parseInt(request.getParameter("id"));

			//System.out.println("deleting product : "+P_Title);
			dbaccess.deleteProduct(user,P_ID, P_Title);
			ArrayList<CartDto> list = dbaccess.getProductList(user);
			request.setAttribute("product_list",list);
			request.getRequestDispatcher("/Cart.jsp").include(request, response);
			
		}
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGet(request, response);
	}

}
