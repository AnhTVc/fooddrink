package com.project.DAO;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
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
	private static Logger logger = new Logger("DBPool"); // biến logger của lớp Logger trên
    private static LinkedList pool = new LinkedList(); // pool để chứa các connections
    public final static int MAX_CONNECTIONS = 10;  // số connection tối đa trong pool là 10, tuỳ ý!!
    public final static int INI_CONNECTIONS = 2; 
    
    public static Connection makeDBConnection() throws SQLException {
        Connection conn = null;
        Properties defaultProps = new Properties();
        FileInputStream in;
		try {
			in = new FileInputStream("DBCongfig.properties");
	        defaultProps.load(in);
	        in.close();
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

       /* 
        try {
            Class.forName(DBConfig.getProperties("_mf_driver", ""));
            logger.log("URL:" + DBConfig.getProperties("_mf_url", ""));
            logger.log("User:" + DBConfig.getProperties("_mf_user", ""));
            conn = DriverManager.getConnection(
             DBConfig.getProperties("_mf_url", ""),
             DBConfig.getProperties("_mf_user", ""),
                DBConfig.getProperties("_mf_passwd", ""));
             
        } catch (ClassNotFoundException ex) {
            throw new SQLException(ex.getMessage());
        }catch (Exception e) {
   // TODO: handle exception
  }*/
        return conn;
    }
    
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
    public static Connection getConnection() {
        Connection conn = null;
        try{
         synchronized (pool) {
             conn = (Connection) pool.removeFirst();
         }
         if (conn == null) {
          conn = makeDBConnection();
         }
         try {
             conn.setAutoCommit(true);
         } catch (Exception ex) {}
          
        } catch(Exception e){            
            logger.error("Method getConnection(): Error executing >>>" + e.toString());
            try {
             logger.log("Make connection again.");
    conn = makeDBConnection();
    conn.setAutoCommit(true);
   } catch (SQLException e1) {
   }
   logger.log(""+conn);
        }
        return conn;
    }

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
        } catch (SQLException ex) {}
  
        synchronized (pool) {
            pool.addLast(conn);
            pool.notify();
        }
    }
    public static void release() {
        logger.log("Closing connections in pool...");
        synchronized (pool) {
            for (Iterator it = pool.iterator(); it.hasNext(); ) {
                Connection conn = (Connection) it.next();
                try {
                    conn.close();
                }
                catch (SQLException e) {
                    logger.error(
                        "release: Cannot close connection! (maybe closed?)");
                }
            }
            pool.clear();
        }
        logger.log("Release connection OK");
    }
    
    public static void releaseConnection(Connection conn, PreparedStatement preStmt) {       
        putConnection(conn);
        try {
            if (preStmt != null) {
                preStmt.close();
            }
        } catch (SQLException e) {}
    }
 
    public static void releaseConnection(Connection conn, PreparedStatement preStmt, ResultSet rs) {
        releaseConnection(conn, preStmt);
        try {
            if (rs != null) {
                rs.close();
            }
        } catch (SQLException e) {}
    }
 
    public static void releaseConnection(Connection conn, PreparedStatement preStmt, Statement stmt, ResultSet rs) {
        releaseConnection(conn, preStmt, rs);
        try {
            if (stmt != null) {
                stmt.close();
            }
        } catch (SQLException e) {}
    }
    public static void releaseConnection(Connection conn, CallableStatement cs, ResultSet rs) {
     putConnection(conn);
        try {
            if (cs != null) {
             cs.close();
            }
            if(rs!=null){
             rs.close();
            }
        } catch (SQLException e) {}
    }
}
