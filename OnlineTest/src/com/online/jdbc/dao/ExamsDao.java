package com.online.jdbc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.online.jdbc.dto.ExamsDto;
import com.online.jdbc.dto.StudentsDto;
import com.online.jdbc.exception.DBException;
import com.online.jdbc.util.DBUtil;

public class ExamsDao {
	 static int eid=getEid();

	private static int getEid(){
		 int x=0;
		 String sqlQuery="SELECT examid FROM exams ORDER BY TO_NUMBER(examid) DESC";
		 try{
			 Connection con = DBUtil.connect();
			 PreparedStatement ps = con.prepareStatement(sqlQuery);
			 ResultSet rs = ps.executeQuery();
			 if(rs.next()){
				 x = rs.getInt(1);
			 }else
			     x = 0;
			 }catch(Exception e){
				 System.out.println("ExamsDao.getId(): "+e);
			 }
			 finally{
				 return x;
			 }
		 }
	     
	public static ExamsDto getExamById(String examid) throws DBException{
		ExamsDto exam = null;
		try{
			Connection con = DBUtil.connect();
			String sqlQuery = "SELECT * FROM Exams WHERE examid = ?";
			PreparedStatement ps = con.prepareStatement(sqlQuery);
			ps.setString(1,examid);
			ResultSet rs = ps.executeQuery();
		    if (rs.next()) {
		            exam = new ExamsDto();
		            exam.setExamid(rs.getString(1));
		            exam.setTopic(rs.getString(2));
		            exam.setLevel(rs.getString(3));
		            exam.setDuration(rs.getInt(4));
		            exam.setDescription(rs.getString(5));
		    }
		    return exam;
		} catch (Exception e){
			System.out.println("ExamsDao.getExamById(): "+e);
			throw new DBException("Unable to fetch exam details!");
		}
	}
	
     public static boolean updateExams(ExamsDto exams) throws DBException{
    	 try {
    		 Connection con = DBUtil.connect();
    		 String sqlQuery = "UPDATE Exams SET topic = ? WHERE examid = ?";
    		 PreparedStatement ps = con.prepareStatement(sqlQuery);
    		 ps.setString(1,exams.getTopic());
    		 ps.setString(2, exams.getExamid());
    		 
    		 return ps.executeUpdate() >0;
    	 } catch (Exception e) {
    		 System.out.println("ExamsDao.updateExams(): "+e);
    		 throw new DBException("We Cant Update the test at this Time !");
    	 }
     }
     
     public static ArrayList<ExamsDto> selectAllExams() throws DBException {
    	 try {
    		 Connection con = DBUtil.connect();
    		 String sqlQuery = "SELECT * FROM Exams ORDER BY to_Number(examid)";
    		 PreparedStatement ps = con.prepareStatement(sqlQuery);
    		 ResultSet rs = ps.executeQuery();
    		 ArrayList<ExamsDto> list = new ArrayList<ExamsDto>();
    		 ExamsDto exams = null;
    		 while(rs.next()) {
    			 exams = new ExamsDto();
    			 exams.setExamid(rs.getString(1));
    			 exams.setTopic(rs.getString(2));
    			 exams.setLevel(rs.getString(3));
    			 exams.setDuration(rs.getInt(4));
    			 exams.setDescription(rs.getString(5));
    			 list.add(exams);
    		 }
    		 return list;
    	 } catch (Exception e) {
    		 System.out.println("ExamsDao.selectAllExams(): "+e);
    		 throw new DBException("We are Unable to Provide the Exams Detail at this Time !");
    	 }
     }
    
    public static boolean deleteExamsFromQuestion(String examid) throws DBException{
    	try {
    		Connection con = DBUtil.connect();
    		String sqlQuery="DELETE FROM Questions WHERE examid=?";
    		PreparedStatement ps = con.prepareStatement(sqlQuery);
    		ps.setString(1, examid);
    		return ps.executeUpdate() > 0;
    	} catch(Exception e) {
    		System.out.println("ExamsDao.deleteExamsFromQuestion(): "+e);
    		throw new DBException("We cant remove the question at this time!");
    	}
    }
 	public static boolean deleteExams(String examid) throws DBException {
		try {
			deleteExamsFromQuestion(examid);
			Connection con = DBUtil.connect();
			String sqlQuery = "DELETE FROM Exams WHERE examid = ?";
			PreparedStatement ps = con.prepareStatement(sqlQuery);
			ps.setString(1, examid);

			return ps.executeUpdate() > 0;
		} catch (Exception e) {
			System.out.println("ExamsDao.deletetExams(): " + e);
			throw new DBException("We cant remove the test at this time!");
		}
	}

 	public static int insertExams(ExamsDto exams) throws DBException {
 		int newId = eid + 1;
 		try {
 			Connection con = DBUtil.connect();
 			String sqlQuery = "INSERT INTO Exams VALUES(?,?,?,?,?)";
 			PreparedStatement ps = con.prepareStatement(sqlQuery);
 			ps.setString(1, String.valueOf(newId));
 			ps.setString(2, exams.getTopic());
 			ps.setString(3,exams.getLevel());
 			ps.setInt(4,exams.getDuration());
 			ps.setString(5,exams.getDescription());

 			if (ps.executeUpdate() == 1)
 			{
 				eid = newId;
 				return newId;
 			}
 			else 
 				return -1;
 		} catch (Exception e) {
 			System.out.println("ExamsDao.insertExams(): " + e);
 			throw new DBException("New Exam Cant Create At This Time!");
 		}
 	}
 	
	     
}
