package com.online.jdbc.dao;
import java.util.ArrayList;

import com.online.jdbc.dto.ResultsDto;
import com.online.jdbc.exception.DBException;
import com.online.jdbc.util.DBUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ResultsDao {
     public static ArrayList<ResultsDto> getResultsByStudid(String studid) throws DBException{
		try{
			  Connection con = DBUtil.connect();
			  String sqlQuery = "SELECT * FROM Results where studid = ? ORDER BY TO_NUMBER(testid)";
		      PreparedStatement ps = con.prepareStatement(sqlQuery);
			  ps.setString(1,studid);
			  ResultSet rs = ps.executeQuery();
				ArrayList<ResultsDto> rlist = new ArrayList<ResultsDto>();
				ResultsDto result ;
				
				while(rs.next()){
					 result = new ResultsDto();
					 result.setTestId(rs.getString("TESTID"));
					 result.setStudentId(rs.getString("STUDID"));
					 result.setExamId(rs.getString("EXAMID"));
					 result.setRightAnswers(rs.getString("RIGHT"));
					 result.setWrongAnswers(rs.getString("WRONG"));
					 result.setExamDate(rs.getDate("EDATE"));
					 rlist.add(result); 
				} 
				return rlist;
			} catch(Exception e){
				System.out.println("ResultsDao.getResultsByStudid() :"+ e);
				throw new DBException("Unable to display the result at this Time!");
			}

     }
     
     public static ArrayList<ResultsDto> getAllExamsResult() throws DBException{
    	 try{
    		 Connection con = DBUtil.connect();
    		 String sqlQuery = "SELECT * FROM Results ORDER BY TO_NUMBER(testid)";
 			 PreparedStatement ps = con.prepareStatement(sqlQuery);
 			 ResultSet rs = ps.executeQuery();
 			 ArrayList<ResultsDto> rlist = new ArrayList<ResultsDto>();
 			 ResultsDto result ;
 			 
 			 while(rs.next()){
 				 result = new ResultsDto();
 				 result.setTestId(rs.getString("TESTID"));
				 result.setStudentId(rs.getString("STUDID"));
				 result.setExamId(rs.getString("EXAMID"));
				 result.setRightAnswers(rs.getString("RIGHT"));
				 result.setWrongAnswers(rs.getString("WRONG"));
				 result.setExamDate(rs.getDate("EDATE"));
				 result.setTotalQues(rs.getString("TOTAL"));
				 rlist.add(result); 
 			 }
 			 return rlist;
    	 } catch(Exception e){
    		 System.out.println("ResultsDao.getAllExamsResult() :"+ e);
 			throw new DBException("Unable to display the result at this Time!"); 
    	 }
     }
     
     public static boolean insertResults(ResultsDto result){
     	try{
     		Connection con = DBUtil.connect();
     		String sqlQuery = "INSERT INTO Results(TESTID, STUDID, EXAMID, RIGHT, WRONG, EDATE,Total) VALUES(testid_seq.nextval,?,?,?,?,sysdate,?)";
     	    PreparedStatement ps = con.prepareStatement(sqlQuery);
     	    ps.setString(1,result.getStudentId());
     	    ps.setString(2, result.getExamId());
     	    ps.setString(3, result.getRightAnswers());
     	    ps.setString(4, result.getWrongAnswers());
     	    ps.setString(5, result.getTotalQues());
     	    
     	    return ps.executeUpdate() == 1;
     	} catch(Exception e){
     		System.out.println("ResultsDao.insertResults() : "+ e);
     		return false;
     	}
     }
}
