package com.anthrino.unity.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.anthrino.unity.dto.GameDto;
import com.anthrino.unity.server.ConnectionProvider;
import com.anthrino.unity.server.JDBCCloser;

public class GameDao {
	public GameDto getGame(String title)

	{
		String SELECT_GAME = "SELECT * FROM [dbo].[Games] WHERE [Title]= ?";
		GameDto game = new GameDto();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ConnectionProvider.getConnection();
			pstmt = con.prepareStatement(SELECT_GAME);
			pstmt.setString(1, title);
			rs = pstmt.executeQuery();
			rs.next();
			System.out.println(rs.getString("Title"));
			game.setGame_id(rs.getInt("Game_ID"));
			game.setTitle(rs.getString("Title"));
			game.setPrice(rs.getInt("Price"));
			game.setCompany(rs.getString("Company"));
			game.setRent(rs.getInt("Rent"));
			game.setPlatform(rs.getString("Platform"));
			game.setLaunch_Year(rs.getInt("Launch_Year"));
			game.setDescription(rs.getString("Description"));
			game.setRating(rs.getFloat("Rating"));
			game.setTrailer_link(rs.getString("Trailer_Link"));
			System.out.println("ID " + game.getGame_id() + "Rating" + game.getRating());
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCCloser.close(rs);
			JDBCCloser.close(pstmt);
			JDBCCloser.close(con);

		}
		return game;

	}

	public ArrayList<GameDto> getGameList(String searchparam) {
		ArrayList<GameDto> list = new ArrayList<>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String FILTER_SELECT = "SELECT [Title],[Price],[Company] FROM [dbo].[Games] WHERE [Title] LIKE '"
				+ searchparam + "%'";
		if(!searchparam.equals(""))
		{
			try {
			con = ConnectionProvider.getConnection();
			pstmt = con.prepareStatement(FILTER_SELECT);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				GameDto game = new GameDto();
				game.setTitle(rs.getString("Title"));
				game.setCompany(rs.getString("Company"));
				game.setPrice(rs.getInt("Price"));
				list.add(game);
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
}
