package com.online.jdbc.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;

public class DBUtil {
	static Connection con = null;
    private static String url;
    private static Properties p;
    static { 
    	 try {
    		 p = new Properties();
    		 p.load(DBUtil.class.getClassLoader().getResourceAsStream("oracle.properties"));
    		 String driver = p.getProperty("driver");
    		 url = p.getProperty("url");
    		 
    		 Class.forName(driver);
    	 } catch (Exception e) {
    		 System.out.println("DBUtil.Static Block: "+e);
    	 }
    }
    
    public static Connection connect() {
    	try {
    		if(con != null)
    			return con;
    		con = DriverManager.getConnection(url,p);
    		return con;
    	} catch(Exception e) {
    		System.out.println("DBUtil.connect()" + e);
    	}
    	return null;
    }
}
