package com.anthrino.unity.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.anthrino.unity.dto.CartDto;
import com.anthrino.unity.dto.UserDto;
import com.anthrino.unity.server.ConnectionProvider;
import com.anthrino.unity.server.JDBCCloser;

public class CartDao 
{
	public boolean insertProduct(UserDto user, int Product_ID, String P_Title, int Price, String Category)
	{
		System.out.println("in insert product");
		String query = "INSERT INTO [dbo].[Cart] VALUES (?,?,?,?,?,?)";
		try 
		{
			Connection con = ConnectionProvider.getConnection();
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Product_ID);
			pstmt.setInt(2, user.getUser_id());
			pstmt.setString(3, P_Title);
			pstmt.setString(4, Category);
			pstmt.setInt(5, Price);
			pstmt.setInt(6, 1);

			pstmt.executeUpdate();
			pstmt.close();
			con.close();
			return true;
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return false;
	}
	public ArrayList<CartDto> getProductList(UserDto user)
	{
		System.out.println("in list product");
		ArrayList<CartDto> list = new ArrayList<>();
		String query = "SELECT * FROM dbo.Cart WHERE [User_ID] = ?";
		int price_total = 0;
		Connection con = ConnectionProvider.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try 
		{
			
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1,user.getUser_id());
			rs = pstmt.executeQuery();
			while(rs.next())
			{
				CartDto product = new CartDto();
				product.setTitle(rs.getString("P_Title"));
				product.setCategory(rs.getString("Category"));
				product.setPrice(rs.getInt("Price"));
				product.setProduct_id(rs.getInt("Product_ID"));
				price_total += product.getPrice();
				list.add(product);
			}
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		finally {	
			JDBCCloser.close(rs);
			JDBCCloser.close(pstmt);
			JDBCCloser.close(con);
		}
		CartDto temp = new CartDto();
		temp.setPrice((int) price_total);
		list.add(temp);
		return list;
	}
	public boolean deleteProduct(UserDto user, int Product_ID, String P_Title)
	{
		String query = "DELETE FROM [dbo].[Cart] WHERE User_ID = "+user.getUser_id()+" AND "
				+ "Product_ID = "+Product_ID+" AND P_Title = '"+P_Title+"'";
		try 
		{
			Connection con = ConnectionProvider.getConnection();
			Statement stmt = con.createStatement();
			boolean status = stmt.execute(query);
			stmt.close();
			con.close();
			if(status)
				return status;
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return false;
	}	
}
