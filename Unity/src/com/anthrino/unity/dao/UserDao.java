package com.anthrino.unity.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.anthrino.unity.dto.UserDto;
import com.anthrino.unity.server.ConnectionProvider;

public class UserDao 
{
	public boolean isExists(UserDto user,int choice) 
	{
		String EXISTS_USER = "SELECT * FROM [dbo].[Userlist] WHERE [Email-Id] = ?";

		try 
		{
			Connection con = ConnectionProvider.getConnection();
			PreparedStatement pstmt = con.prepareStatement(EXISTS_USER);
			pstmt.setString(1, user.getEmail());
			ResultSet rs = pstmt.executeQuery();
			if (choice == 2) 
			{
				if(rs.next())
					return false;
				else 
					return true;
			}
			else
			{
				rs.next();
				System.out.println(rs.getString("Password")+user.getPassword());
				if(rs.getString("Password").equals(user.getPassword()))
				{
					return true;
				}
			}

			rs.close();
			pstmt.close();
			con.close();
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return false;
	}

	public int insertUser(UserDto user) 
	{
		String INSERT_USER = "INSERT INTO [dbo].[Userlist]"
				+ "VALUES(?,?,?,?,?,?,?)";
		Connection con = ConnectionProvider.getConnection();
		PreparedStatement pstmt;
		int x = 0;
		try 
		{
			pstmt = con.prepareStatement(INSERT_USER);
			pstmt.setString(1, user.getEmail());
			pstmt.setString(2, user.getPassword());
			pstmt.setString(3, user.getF_name());
			pstmt.setString(4, user.getL_name());
			pstmt.setString(5, user.getM_no());
			pstmt.setString(6, user.getAddress());
			pstmt.setBoolean(7,true);
			x = pstmt.executeUpdate();
			pstmt.close();
			con.close();
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return x;
	
	}

	public int updateUser(UserDto user) 
	{
		String UPDATE_USER = "UPDATE [dbo].[Userlist] SET [Email-Id] = ?,[Password] = ?, [First Name] = ?"
					+", [Last Name] = ?, [Mobile No.] = ? WHERE [Email-Id] = ?";
		Connection con = ConnectionProvider.getConnection();
		PreparedStatement pstmt;
		int x = 0;
		try 
		{
			pstmt = con.prepareStatement(UPDATE_USER);
			pstmt.setString(1, user.getEmail());
			pstmt.setString(2, user.getPassword());
			pstmt.setString(3, user.getF_name());
			pstmt.setString(4, user.getL_name());
			pstmt.setString(5, user.getM_no());
			pstmt.setString(6, user.getEmail());
			x = pstmt.executeUpdate();
			pstmt.close();
			con.close();
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return x;
	}
	public UserDto getUser(String email)
	{
		String SELECT_USER = "SELECT * FROM [dbo].[Userlist] WHERE [Email-Id] = '"+email +"'";
		UserDto user = new UserDto();
		try 
		{
			Connection con = ConnectionProvider.getConnection();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(SELECT_USER);
			while(rs.next())
			{
				user.setUser_id(rs.getInt("User_ID"));
				user.setPassword(rs.getString("Password"));
				user.setEmail(rs.getString("Email-Id"));
				user.setF_name(rs.getString("First Name"));
				user.setL_name(rs.getString("Last Name"));
				user.setM_no(rs.getString("Mobile No."));
				user.setAddress(rs.getString("Address"));
				user.setPrime(rs.getBoolean("Prime"));
			}
			rs.close();
			stmt.close();
			con.close();
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return user;
	}

}
