package com.anthrino.unity.server;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.nio.charset.Charset;
//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//import java.sql.Statement;
import java.util.Scanner;

//import com.anthrino.unity.dao.MovieDao;
//import com.anthrino.unity.dto.MovieDto;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

public class IMDbApi
{
	public static void main(String args[])
	{
		
//		Connection connect;
//		String connectionUrl = "jdbc:sqlserver://localhost:1433;databaseName=Unity_CentralDb;integratedSecurity=true;";
//		String SELECT_GAME = "SELECT * FROM [dbo].[Games]";
//		try 
//		{
//			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
//			connect = DriverManager.getConnection(connectionUrl,"","");
//			Statement stmt = connect.createStatement();
//			ResultSet rs = stmt.executeQuery(SELECT_GAME);
//			while(rs.next())
//			{
//				System.out.println(rs.getString("Title")+" "+rs.getInt("Price"));
//			}
//			rs.close();
//			stmt.close();
//			connect.close();
//			
//		}
//		catch (ClassNotFoundException | SQLException e)
//		{
//			e.printStackTrace();
//		}
//	
		String title;
		String imdburl = "http://www.omdbapi.com/?t=";
		String ext = "&y=&plot=short&r=json";
		Scanner sc = new Scanner(System.in);
		System.out.print(" Enter title : ");
		title = sc.nextLine();
		imdburl += title += ext;
		System.out.println(imdburl);
		try {
			URL url = new URL(imdburl);
//			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
//			connection.setRequestMethod("GET");
//			connection.setRequestProperty("Accept", "application/xml");
//			InputStream xml = connection.getInputStream();
			InputStream istream = url.openStream();
			BufferedReader rd = new BufferedReader(new InputStreamReader(istream, Charset.forName("UTF-8")));
			StringBuilder sb = new StringBuilder();
			String jsonString = null;
			while((jsonString = rd.readLine()) != null)
				sb.append(jsonString + "\n");
			jsonString = sb.toString();
			JsonObject json = new JsonParser().parse(jsonString).getAsJsonObject(); 
			
//			MovieDao dbaccess = new MovieDao();
//			MovieDto movie = new MovieDto();
//			if(json.get("Error") == null)
//			{
//				movie.setTitle(json.get("Title").getAsString());
//				movie.setPoster_link(json.get("Poster").getAsString());
//				movie.setGenre(json.get("Genre").getAsString());
//				movie.setPlot(json.get("Plot").getAsString());
//				movie.setCast(json.get("Actors").getAsString());
//				movie.setDirector(json.get("Director").getAsString());
//				movie.setType(json.get("Type").getAsString());
//				movie.setRating(json.get("imdbRating").getAsFloat());
//				movie.setLanguage(json.get("Language").getAsString());
//				movie.setRuntime(json.get("Runtime").getAsInt());
//				movie.setRelease_date(json.get("Year").getAsInt());
//				if(json.get("Year").getAsInt() >= 2015)
//				{
//					movie.setPrice(499);
//					movie.setRent(199);
//				}
//				else
//				{
//					movie.setPrice(249);
//					movie.setRent(99);
//				}
//				
//			}
//			boolean x = false;
//			if(!dbaccess.isExists(movie))
//				x = dbaccess.insertMovie(movie);
//			System.out.println(x);
			System.out.println(jsonString);
			System.out.println(json.get("Title"));

		} catch (Exception e) {
		}
		sc.close();
	}
}
