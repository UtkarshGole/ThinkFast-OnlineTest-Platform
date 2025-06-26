package com.online.jdbc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.online.jdbc.dto.StudentsDto;
import com.online.jdbc.exception.DBException;
import com.online.jdbc.util.DBUtil;

public class StudentsDao {
	 static int id=getId();
	 @SuppressWarnings("finally")
	public static int getId(){
		 int x=0;
		 String sqlQuery="SELECT Studid FROM Student ORDER BY TO_NUMBER(Studid) DESC";
		 try{
			 Connection con = DBUtil.connect();
			 PreparedStatement ps = con.prepareStatement(sqlQuery);
			 ResultSet rs = ps.executeQuery();
			 if(rs.next()){
				 x = rs.getInt(1);
			 }else
			     x = 0;
			 }catch(Exception e){
				 System.out.println("StudentsDao.getId(): "+e);
			 }
			 finally{
				 return x;
			 }
		 }
	 
	 
	 public static StudentsDto selectStudent(String email) throws DBException{
		 try{
			 Connection con = DBUtil.connect();
			 String sqlQuery = "SELECT * FROM Student where email=?";
			 PreparedStatement ps = con.prepareStatement(sqlQuery);
			 ps.setString(1, email);
			 ResultSet rs = ps.executeQuery();
			 
			 StudentsDto student = null;
	     	 if(rs.next()){
	     		student= new StudentsDto();
			    student.setStudid(rs.getString(1));
			    student.setSname(rs.getString(2));
			    student.setPassword(rs.getString(3));
			    student.setEmail(rs.getString(4));
			 }
			 return student;
		 } catch(Exception e){
			 System.out.println("StudentsDao.selectAdmin() : "+ e);
			 throw new DBException("Error:Unable to fetch the student details");
		 }
	 }
	 
	 public static int insertStudent(StudentsDto student) throws DBException {
	    	boolean status = false;
	    	int newId = id + 1;
	    	
	    	if(selectStudent(student.getEmail()) != null)
	     		return 0;
	    	try{
	    		Connection con = DBUtil.connect();
	    		String sqlQuery = "INSERT INTO STUDENT VALUES(?,?,?,?)";
	    		PreparedStatement ps = con.prepareStatement(sqlQuery);
	    		
	    		ps.setString(1, String.valueOf(newId));
	    		ps.setString(2, student.getSname());
	    		ps.setString(3, student.getPassword());
	    		ps.setString(4, student.getEmail());
	    		
	    		status = (ps.executeUpdate() == 1);
	    		
	    		if(status) {
	    			id = newId;
	    			return id;
	    		} else {
	    			return -1;
	    		}
	    	} catch(Exception e){
	    		System.out.println("StudentDao.insertStudent(): "+e);
	    		throw new DBException("Failed to register new Student");
	    	}
	     }
	 
	   public static boolean deleteStudent(String email) throws DBException{
	    	 try{
	    		 Connection con = DBUtil.connect();
	    		 String sqlQuery = "DELETE FROM Student WHERE email = ?";
	    		 PreparedStatement ps = con.prepareStatement(sqlQuery);
	    		 ps.setString(1,email);
	    		 
	    		 return ps.executeUpdate() > 0;
	    	 } catch(Exception e){
	    		 System.out.println("StudentDao.deleteStudent():" + e);
	    		 throw new DBException("Error in removing a student data!");
	    	 }
	     }
//	 ==============================================================================================================================================
	 public static String studentLogin(StudentsDto student)throws DBException{
		 try{
			 Connection con = DBUtil.connect();
			 String sqlQuery = "SELECT sname FROM Student WHERE email=? AND password=?";
			 PreparedStatement ps = con.prepareStatement(sqlQuery);
			 ps.setString(1,student.getEmail());
			 ps.setString(2,student.getPassword());
			 
			 ResultSet rs = ps.executeQuery();
			 if(rs.next()){
				 return rs.getString(1);
			 } 
			 else
				 return null;
		 } catch (Exception e){
			 System.out.println("StudentsDao.studentLogin(): "+e);
			 throw new DBException("Cant Login at this Time ! Try Again Later");
		 }
	 }
	 

	 
	 public static String adminLogin(StudentsDto students) throws DBException{
		 try{
			 Connection con = DBUtil.connect();
			 String sqlQuery = "Select sname FROM admin WHERE studid=? and password = ?";
			 PreparedStatement ps = con.prepareStatement(sqlQuery);
			 ps.setString(1,students.getStudid());
			 ps.setString(2, students.getPassword());
			 
			 ResultSet rs = ps.executeQuery();                             
			 
			 if(rs.next()){
				 return rs.getString(1);
			 }
			 else 
				 return null;
	     } catch(Exception e){
	    	 System.out.println("StudentsDao.adminLogin(): " + e);
	    	 throw new DBException("Unable to insert the new admin at this Time!");
	     }
	 }

    	  
	 public static ArrayList<StudentsDto> selectAllStudent() throws DBException{
		 try{
			 Connection con = DBUtil.connect();
			 String sqlQuery = "SELECT studid,sname,password FROM Student";
			 PreparedStatement ps = con.prepareStatement(sqlQuery);
			 ResultSet rs = ps.executeQuery();
			 ArrayList<StudentsDto> list = new ArrayList<StudentsDto>();
			 StudentsDto student = null;
			 
			 while(rs.next()){
				 student = new StudentsDto();
				 student.setStudid(rs.getString(1));
				 student.setSname(rs.getString(2));
				 student.setPassword(rs.getString(3));
				 list.add(student);
			 }
			 return list;
		 } catch(Exception e){
			 System.out.println("StudentDao.selectAllStudent(): "+ e);
			 throw new DBException("Error:Unable to fetch the student details");
		 }
	 }
	 
  
	 
     
     
    
}
