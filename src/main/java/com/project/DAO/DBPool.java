package com.project.DAO;

import java.io.FileInputStream;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.Properties;

import com.mysql.jdbc.CallableStatement;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;
import com.project.log.Logger;

public class DBPool {
	private static Logger logger = new Logger("DBPool"); // biến logger của lớp
															// Logger trên
	private static LinkedList<java.sql.Connection> pool = new LinkedList<java.sql.Connection>(); // pool connections
	public final static int MAX_CONNECTIONS = 10; // số connection tối đa trong // pool là 10, tuỳ ý!!
	public final static int INI_CONNECTIONS = 2;

	/**
	 * Make connection
	 * @return
	 * @throws SQLException
	 */
	public static Connection makeDBConnection() throws SQLException {
		Connection conn = null;
		Properties defaultProps = new Properties();
		FileInputStream in;
		try {
			in = new FileInputStream("DBCongfig.properties");
			defaultProps.load(in);
			in.close();
			Class.forName(defaultProps.getProperty("jdbc_driver"));
			logger.log("URL:" + defaultProps.getProperty("db_url"));
			logger.log("User:" + defaultProps.getProperty("username"));
			conn = (Connection) DriverManager.getConnection(
					defaultProps.getProperty("db_url"),
					defaultProps.getProperty("username"),
					defaultProps.getProperty("password"));

		} catch (ClassNotFoundException ex) {
			throw new SQLException(ex.getMessage());
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return conn;
	}

	/**
	 * Build: pas is number connection pool 
	 * @param number
	 */
	public static void build(int number) {
		logger.log("Establishing " + number + " connections...");
		Connection conn = null;
		release();
		for (int i = 0; i < number; i++) {
			try {
				conn = makeDBConnection();
			} catch (SQLException ex) {
				logger.log("Error: " + ex.getMessage());
			}
			if (conn != null) {
				pool.addLast(conn);
			}
		}
		logger.log("Number of connection: " + number);
	}

	/**
	 * Get connection in list pool
	 * @return
	 */
	public static Connection getConnection() {
		Connection conn = null;
		try {
			synchronized (pool) {
				conn = (Connection) pool.removeFirst();
			}
			if (conn == null) {
				conn = makeDBConnection();
			}
			try {
				conn.setAutoCommit(true);
			} catch (Exception ex) {
			}

		} catch (Exception e) {
			logger.error("Method getConnection(): Error executing >>>"
					+ e.toString());
			try {
				logger.log("Make connection again.");
				conn = makeDBConnection();
				conn.setAutoCommit(true);
			} catch (SQLException e1) {
			}
			logger.log("" + conn);
		}
		return conn;
	}

	/**
	 * put conenction
	 * @param conn
	 */
	public static void putConnection(java.sql.Connection conn) {
		try { // Ignore closed connection
			if (conn == null || conn.isClosed()) {
				logger.log("putConnection: conn is null or closed: " + conn);
				return;
			}
			if (pool.size() >= MAX_CONNECTIONS) {
				conn.close();
				return;
			}
		} catch (SQLException ex) {
		}

		synchronized (pool) {
			pool.addLast(conn);
			pool.notify();
		}
	}

	/**
	 * Auto release all conenction 
	 */
	public static void release() {
		logger.log("Closing connections in pool...");
		synchronized (pool) {
			for (Iterator<java.sql.Connection> it = pool.iterator(); it.hasNext();) {
				Connection conn = (Connection) it.next();
				try {
					conn.close();
				} catch (SQLException e) {
					logger.error("release: Cannot close connection! (maybe closed?)");
				}
			}
			pool.clear();
		}
		logger.log("Release connection OK");
	}

	/**
	 * release connection
	 * @param conn
	 * @param preStmt
	 */
	public static void releaseConnection(Connection conn,
			PreparedStatement preStmt) {
		putConnection(conn);
		try {
			if (preStmt != null) {
				preStmt.close();
			}
		} catch (SQLException e) {
		}
	}

	/**
	 * release connection
	 * @param conn
	 * @param preStmt
	 * @param rs
	 */
	public static void releaseConnection(Connection conn,
			PreparedStatement preStmt, ResultSet rs) {
		releaseConnection(conn, preStmt);
		try {
			if (rs != null) {
				rs.close();
			}
		} catch (SQLException e) {
		}
	}

	/**
	 * release connection
	 * @param conn
	 * @param preStmt
	 * @param stmt
	 * @param rs
	 */
	public static void releaseConnection(Connection conn,
			PreparedStatement preStmt, Statement stmt, ResultSet rs) {
		releaseConnection(conn, preStmt, rs);
		try {
			if (stmt != null) {
				stmt.close();
			}
		} catch (SQLException e) {
		}
	}

	/**
	 * release connection
	 * @param conn
	 * @param cs
	 * @param rs
	 */
	public static void releaseConnection(Connection conn, CallableStatement cs,
			ResultSet rs) {
		putConnection(conn);
		try {
			if (cs != null) {
				cs.close();
			}
			if (rs != null) {
				rs.close();
			}
		} catch (SQLException e) {
		}
	}
}
