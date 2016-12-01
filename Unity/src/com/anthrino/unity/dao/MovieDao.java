package com.anthrino.unity.dao;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.nio.charset.Charset;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.anthrino.unity.dto.MovieDto;
import com.anthrino.unity.server.ConnectionProvider;
import com.anthrino.unity.server.JDBCCloser;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

public class MovieDao 
{
	public boolean insertMovie(MovieDto movie)
	{
		String INSERT_MOVIE = "INSERT INTO [dbo].[Movies] VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,'Movie')";
		try 
		{
			Connection con = ConnectionProvider.getConnection();
			PreparedStatement pstmt = con.prepareStatement(INSERT_MOVIE);
			pstmt.setString(1,movie.getTitle());
			pstmt.setInt(2,movie.getPrice());
			pstmt.setInt(3,movie.getRent());
			pstmt.setString(4,movie.getGenre());
			pstmt.setString(5,movie.getPlot());
			pstmt.setString(6,movie.getCast());
			pstmt.setString(7,movie.getDirector());
			pstmt.setString(8,movie.getPoster_link());
			pstmt.setString(9,movie.getType());
			pstmt.setString(10,movie.getRuntime());
			pstmt.setFloat(11,movie.getRating());
			pstmt.setString(12,movie.getLanguage());
			pstmt.setString(13,movie.getRelease_year());
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
	public ArrayList<MovieDto> getMovieList(String searchparam)
	{
		ArrayList<MovieDto> list = new ArrayList<>();
		String FILTER_SELECT = "SELECT [Title] FROM [dbo].[Movies] WHERE [Title] LIKE '"+searchparam+"%'";
		if(!searchparam.equals(""))
		{try 
		{
			Connection con = ConnectionProvider.getConnection();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(FILTER_SELECT);
			while(rs.next())
			{
				MovieDto movie = new MovieDto();
				movie.setTitle(rs.getString("Title"));
				list.add(movie);
			}
			rs.close();
			stmt.close();
			con.close();
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		}
		return list;
	}
	public MovieDto getMovie(String moviename, int choice)
	{
		MovieDto movie = new MovieDto();
		movie.setTitle(moviename);
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try 
		{
			if((isExists(movie))&&(choice == 1))
			{
				String SELECT_MOVIE = "SELECT * FROM [dbo].[Movies] WHERE [Title] = ?";
				con = ConnectionProvider.getConnection();
				pstmt = con.prepareStatement(SELECT_MOVIE);
				pstmt.setString(1, moviename);
				rs = pstmt.executeQuery();
				while (rs.next())
				{
					movie.setMovie_id(rs.getInt("Movie_Id"));
					movie.setTitle(rs.getString("Title"));
					movie.setPoster_link(rs.getString("Poster_Link"));
					movie.setGenre(rs.getString("Genre"));
					movie.setPrice(rs.getInt("Price"));
					movie.setRent(rs.getInt("Rent"));
					movie.setPlot(rs.getString("Plot"));
					movie.setCast(rs.getString("Cast"));
					movie.setDirector(rs.getString("Director"));
					movie.setRelease_year(rs.getString("Release_year"));
					movie.setType(rs.getString("Director"));
					movie.setRating(rs.getFloat("Rating"));
					movie.setLanguage(rs.getString("Language"));
					movie.setRuntime(rs.getString("Runtime"));
				}
			}
			else
				choice = 2;
			if(choice == 2)
			{
				moviename = moviename.replaceAll("\\s","+");
				System.out.println("imdb api : "+moviename);
				String imdburl = "http://www.omdbapi.com/?t=";
				String ext = "&y=&plot=short&r=json";
				imdburl += moviename += ext;
				URL url = new URL(imdburl);
				InputStream istream = url.openStream();
				BufferedReader rd = new BufferedReader(new InputStreamReader(istream, Charset.forName("UTF-8")));
				StringBuilder sb = new StringBuilder();
				String jsonString = null;
				while((jsonString = rd.readLine()) != null)
					sb.append(jsonString + "\n");
				jsonString = sb.toString();
				JsonObject json = new JsonParser().parse(jsonString).getAsJsonObject(); 
				System.out.println(jsonString);
				if(json.get("Title") != null)
				{
					movie.setTitle(json.get("Title").getAsString());
					movie.setPoster_link(json.get("Poster").getAsString());
					movie.setGenre(json.get("Genre").getAsString());
					movie.setPlot(json.get("Plot").getAsString());
					movie.setCast(json.get("Actors").getAsString());
					movie.setDirector(json.get("Director").getAsString());
					movie.setType(json.get("Type").getAsString());
					movie.setRating(json.get("imdbRating").getAsFloat());
					movie.setLanguage(json.get("Language").getAsString());
					movie.setRuntime(json.get("Runtime").getAsString());
					movie.setRelease_year(json.get("Year").getAsString());
					if(json.get("Year").getAsString().contains("2016"))
					{
						movie.setPrice(499);
						movie.setRent(149);
					}
					else if(json.get("Year").getAsString().contains("2015"))
					{
						movie.setPrice(299);
						movie.setRent(99);
					}
					else
					{
						movie.setPrice(149);
						movie.setRent(49);
					}
					insertMovie(movie);
				}
				else
					movie.setTitle(json.get("Error").getAsString());
			}
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}finally {
		JDBCCloser.close(rs);
		JDBCCloser.close(pstmt);
		JDBCCloser.close(con);

	}
	return movie; 
		
	}
	public boolean isExists(MovieDto movie) 
	{
		String EXISTS_MOVIE = "SELECT * FROM [dbo].[Movies] WHERE [Title] = ?";
		boolean c = false;
		try 
		{
			Connection con = ConnectionProvider.getConnection();
			PreparedStatement pstmt = con.prepareStatement(EXISTS_MOVIE);
			pstmt.setString(1, movie.getTitle());
			ResultSet rs = pstmt.executeQuery();

			if(rs.next())
				c = true;
			else 
				c = false;
			rs.close();
			pstmt.close();
			con.close();
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return c;
	}
	
}
