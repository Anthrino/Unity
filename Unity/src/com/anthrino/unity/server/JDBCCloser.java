package com.anthrino.unity.server;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public final class JDBCCloser {

	/**
	 * Closes given result set hard
	 */
	public static void close(ResultSet rs) {
		if (rs != null) {
			try {
				rs.close();
			} catch (Exception excp) {
				// Ignore, we don't care, we do care when we
				// open it
			}
		}
	}

	/**
	 * Closes given PreparedStatement set hard
	 */
	public static void close(PreparedStatement ps) {
		if (ps != null) {
			try {
				ps.close();
			} catch (Exception excp) {
				// Ignore, we don't care, we do care when we
				// open it
			}
		}
	}

	/**
	 * Closes given Connection set hard
	 */
	public static void close(Connection cn) {
		if (cn != null) {
			try {
				cn.close();
			} catch (Exception excp) {
				// Ignore, we don't care, we do care when we
				// open it
			}
		}
	}

	/**
	 * Closes given Statement set hard
	 */
	public static void close(Statement stmt) {
		if (stmt != null) {
			try {
				stmt.close();
			} catch (Exception excp) {
				// Ignore, we don't care, we do care when we
				// open it
			}
		}
	}

	public static void close(ResultSet rs, PreparedStatement ps, Connection conn) {
		close(rs);
		close(ps);
		close(conn);
	}
}
