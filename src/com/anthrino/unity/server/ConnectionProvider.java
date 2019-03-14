package com.anthrino.unity.server;

import java.sql.Connection;

import com.microsoft.sqlserver.jdbc.SQLServerDataSource;

public class ConnectionProvider
{
	static SQLServerDataSource ds = new SQLServerDataSource();
	public static Connection connect;
	public static String connectionUrl = "jdbc:sqlserver://localhost:1433;databaseName=Unity_CentralDb;integratedSecurity=true;";
	public static Connection getConnection()
	{
		try 
		{
			ds.setURL(connectionUrl);
			connect = ds.getConnection();
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return connect;
	}
	
}
