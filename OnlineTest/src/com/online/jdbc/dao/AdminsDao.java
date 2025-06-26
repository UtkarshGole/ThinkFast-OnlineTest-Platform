package com.online.jdbc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.online.jdbc.dto.AdminsDto;
import com.online.jdbc.dto.StudentsDto;
import com.online.jdbc.exception.DBException;
import com.online.jdbc.util.DBUtil;

public class AdminsDao {
	 static int id=getId();

	private static int getId(){
		 int x=0;
		 String sqlQuery="SELECT adminid FROM Admin ORDER BY TO_NUMBER(adminid) DESC";
		 try{
			 Connection con = DBUtil.connect();
			 PreparedStatement ps = con.prepareStatement(sqlQuery);
			 ResultSet rs = ps.executeQuery();
			 if(rs.next()){
				 x = rs.getInt(1);
			 }else
			     x = 0;
			 }catch(Exception e){
				 System.out.println("AdminsDao.getId(): "+e);
			 }
			 finally{
				 return x;
			 }
		 }
	 
	 
	
	 
	 
	 public static String adminLogin(AdminsDto admins) throws DBException{
		 try{
			 Connection con = DBUtil.connect();
			 String sqlQuery = "Select adminName" +
			 		" FROM admin WHERE email=? and password = ?";
			 PreparedStatement ps = con.prepareStatement(sqlQuery);
			 ps.setString(1,admins.getEmail());
			 ps.setString(2, admins.getPassword());
			 
			 ResultSet rs = ps.executeQuery();                             
			 
			 if(rs.next()){
				 return rs.getString(1);
			 }
			 else 
				 return null;
	     } catch(Exception e){
	    	 System.out.println("AdminsDao.adminLogin(): " + e);
	    	 throw new DBException("Unable to insert the new admin at this Time!");
	     }
	 }

    	  
	 public static ArrayList<AdminsDto> selectAllAdmin() throws DBException{
		 try{
			 Connection con = DBUtil.connect();
			 String sqlQuery = "SELECT * FROM Admin";
			 PreparedStatement ps = con.prepareStatement(sqlQuery);
			 ResultSet rs = ps.executeQuery();
			 ArrayList<AdminsDto> list = new ArrayList<AdminsDto>();
			 AdminsDto admin = null;
			 
			 while(rs.next()){
				 admin = new AdminsDto();
				 admin.setAdminId(rs.getString(1));
				 admin.setAdminName(rs.getString(2));
				 admin.setPassword(rs.getString(3));
				 admin.setEmail(rs.getString(4));
				 list.add(admin);
			 }
			 return list;
		 } catch(Exception e){
			 System.out.println("AdminsDao.selectAllAdmin() : "+ e);
			 throw new DBException("Error:Unable to fetch the all admin details");
		 }
	 }
	 
	 public static AdminsDto selectAdmin(String email) throws DBException{
		 try{
			 Connection con = DBUtil.connect();
			 String sqlQuery = "SELECT * FROM Admin where email=?";
			 PreparedStatement ps = con.prepareStatement(sqlQuery);
			 ps.setString(1, email);
			 ResultSet rs = ps.executeQuery();
			 
			 AdminsDto admin = null;
	     	 if(rs.next()){
	     		admin = new AdminsDto();
			    admin.setAdminId(rs.getString(1));
			    admin.setAdminName(rs.getString(2));
			    admin.setPassword(rs.getString(3));
			    admin.setEmail(rs.getString(4));
			 }
			 return admin;
		 } catch(Exception e){
			 System.out.println("AdminsDao.selectAdmin() : "+ e);
			 throw new DBException("Error:Unable to fetch the admin details");
		 }
	 }
     public static boolean deleteAdmin(String email) throws DBException{
    	 try{
    		 Connection con = DBUtil.connect();
    		 String sqlQuery = "DELETE FROM ADMIN WHERE email=?";
    		 PreparedStatement ps = con.prepareStatement(sqlQuery);
    		 ps.setString(1,email);
    		 
    		 return ps.executeUpdate() > 0;
    	 } catch(Exception e){
    		 System.out.println("AdminsDao.deleteStudent():" + e);
    		 throw new DBException("Error in removing a  data!");
    	 }
     }
	 
     public static int insertAdmin(AdminsDto admin,String email,String password) throws DBException {
    	boolean status = false;
    	int newId = id + 1;
    	
    	if(!("Super@gmail.com".equals(email) && "Owner".equals(password)))
    		return -1;
    	if(selectAdmin(admin.getEmail()) != null)
    		return 0;
    	try{
    		Connection con = DBUtil.connect();
    		String sqlQuery = "INSERT INTO Admin VALUES(?,?,?,?)";
    		PreparedStatement ps = con.prepareStatement(sqlQuery);
    		
    		ps.setString(1, String.valueOf(newId));
    		ps.setString(2, admin.getAdminName());
    		ps.setString(3, admin.getPassword());
    		ps.setString(4, admin.getEmail());
    		
    		status = (ps.executeUpdate() == 1);
    		
    		if(status) {
    			id = newId;
    			return id;
    		} else
				return -1;
    	} catch(Exception e){
    		System.out.println("AdminsDao.insertAdmin(): "+e);
    		throw new DBException("Failed to register new admin");
    	}
     }
}
