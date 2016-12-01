package com.anthrino.unity.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.anthrino.unity.dto.SoftwareDto;
import com.anthrino.unity.server.ConnectionProvider;
import com.anthrino.unity.server.JDBCCloser;

public class SoftwareDao 
{
	public ArrayList<SoftwareDto> getSoftwareList(String searchparam)
	{
		ArrayList<SoftwareDto> list = new ArrayList<SoftwareDto>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String FILTER_SELECT = "SELECT [Title],[Price],[Company] FROM [dbo].[Software] WHERE [Title] LIKE '"+searchparam+"%'";
		if(!searchparam.equals(""))
		{
			try {
			con = ConnectionProvider.getConnection();
			pstmt = con.prepareStatement(FILTER_SELECT);
			rs = pstmt.executeQuery();
			while(rs.next())
			{
				SoftwareDto software = new SoftwareDto();
				software.setTitle(rs.getString("Title"));
				software.setCompany(rs.getString("Company"));
				software.setPrice(rs.getInt("Price"));
				list.add(software);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCCloser.close(rs);
			JDBCCloser.close(pstmt);
			JDBCCloser.close(con);

		}
		}
		
		return list;
	}
	public SoftwareDto getSoftware(String title)
	{
		SoftwareDto software = new SoftwareDto();
		String SELECT_SOFTWARE = "SELECT * FROM [dbo].[Software] WHERE [Title] = '"+title+"'";

		try 
		{
			Connection con = ConnectionProvider.getConnection();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(SELECT_SOFTWARE);
			while(rs.next())
			{
				software.setSoftware_id(rs.getInt("Software_ID"));
				software.setTitle(rs.getString("Title"));
				software.setCompany(rs.getString("Company"));
				software.setPrice(rs.getInt("Price"));
				software.setRating(rs.getFloat("Rating"));
				software.setLaunch_year(rs.getInt("Launch_year"));
				software.setDescription(rs.getString("Description"));
				software.setPlatform(rs.getString("Platform"));
			}
			rs.close();
			stmt.close();
			con.close();
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return software;
			
	}
}
