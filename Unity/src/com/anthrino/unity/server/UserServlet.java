package com.anthrino.unity.server;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.anthrino.unity.dao.UserDao;
import com.anthrino.unity.dto.UserDto;

public class UserServlet extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	@Override
	public void init() throws ServletException 
	{
		super.init();
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		doPost(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		UserDto user = new UserDto();
		UserDao dbaccess = new UserDao();
		try 
		{
			System.out.println("GOT TO THE USERSERVLET");

			if(req.getRequestURL().toString().endsWith("login"))
			{
				String email = req.getParameter("email");
				user.setEmail(email);
				String password = req.getParameter("passwd");
				user.setPassword(password);
				if(dbaccess.isExists(user,1))
				{
					user = dbaccess.getUser(email);
					HttpSession s = req.getSession();
					s.setAttribute("user",user);
					req.getRequestDispatcher("/Games.jsp").forward(req, resp);
					//resp.sendRedirect("/Webpages/Home.html");
				}
				else
				{
					System.out.println("Login failed.");
					req.setAttribute("status","fail");
					req.getRequestDispatcher("/Login.jsp").include(req, resp);
				}
			}
			else if(req.getRequestURI().endsWith("signup"))
			{
				user.setPassword(req.getParameter("passwd"));
				user.setEmail(req.getParameter("email"));
				user.setF_name(req.getParameter("fname"));
				user.setL_name(req.getParameter("lname"));
				user.setM_no(req.getParameter("mob"));
				user.setAddress(req.getParameter("address"));
				user.setPrime(Boolean.parseBoolean(req.getParameter("prime")));
				HttpSession s = req.getSession();
				if(dbaccess.isExists(user,2))
				{
					if (dbaccess.insertUser(user) == 1) {
						System.out.println("Signup success.");
						s.setAttribute("user", user);
						req.getRequestDispatcher("/Games.jsp").forward(req, resp);
					} 
					else 
					{
						System.out.println("Signup failed.");
						req.setAttribute("signupstatus", "fail");
						req.getRequestDispatcher("/Login.jsp").include(req, resp);
					} 
				}
				else
				{
					System.out.println("Signup failed.");
					req.setAttribute("signupstatus", "fail");
					req.getRequestDispatcher("/Login.jsp").include(req, resp);
				}
				
			}
			else if(req.getRequestURI().endsWith("account"))
			{
				user.setPassword(req.getParameter("passwd"));
				user.setEmail(req.getParameter("email"));
				user.setF_name(req.getParameter("fname"));
				user.setL_name(req.getParameter("lname"));
				user.setM_no(req.getParameter("mob"));
//				user.setAddress(req.getParameter("address"));
//				user.setPrime(Boolean.parseBoolean(req.getParameter("prime")));
				HttpSession s = req.getSession();
				if(dbaccess.updateUser(user) == 1)
				{
					s.setAttribute("user",user);
					req.setAttribute("updatestatus","success");
				}
				else
				{
					System.out.println("Account Update failed.");
					req.setAttribute("updatestatus","failed");
				}
				req.getRequestDispatcher("/Account.jsp").include(req, resp);

			}
			else if(req.getRequestURI().endsWith("logout"))
			{
				HttpSession session = req.getSession(false);
				if (session != null) {
				    session.invalidate();
				}
				req.getRequestDispatcher("/Unity.jsp").forward(req, resp);
			}
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		
	
	}
	@Override
	public void destroy()
	{
		super.destroy();
	}
}
