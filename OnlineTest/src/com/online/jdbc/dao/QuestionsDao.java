package com.online.jdbc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.online.jdbc.dto.QuestionsDto;
import com.online.jdbc.exception.DBException;
import com.online.jdbc.util.DBUtil;

public class QuestionsDao {

		private static int getQid(String examid){
			 int x=0;
			 String sqlQuery="SELECT qid FROM questions where examid = ?  ORDER BY TO_NUMBER(qid) DESC";
			 try{
				 Connection con = DBUtil.connect();
				 PreparedStatement ps = con.prepareStatement(sqlQuery);
				 ps.setString(1, examid);
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
    public static boolean insertQuestion(QuestionsDto que) throws DBException{
    	 boolean status = false;
    	   try {
    		   Connection con = DBUtil.connect();
    		   String sqlQuery = "INSERT INTO Questions(qid,examid,que,a,b,c,d,answer) VALUES(?,?,?,?,?,?,?,?)";
    		   PreparedStatement ps = con.prepareStatement(sqlQuery);
    		   int newQid = getQid(que.getExamid()) + 1;
    		   ps.setInt(1, newQid);
    		   ps.setString(2, que.getExamid());
    		   ps.setString(3,que.getQue());
    		   ps.setString(4,que.getA());
    		   ps.setString(5, que.getB());
    		   ps.setString(6, que.getC());
    		   ps.setString(7, que.getD());
    		   ps.setString(8, que.getAnswer());
    		   
    		   status = (ps.executeUpdate() == 1); 
        	   return status;
    	   } catch(Exception e) {
    		   System.out.println("QuestionDao.insertQuestion(): "+e);
    		   throw new DBException("Failed to insert new question");
    	   }
    }
    
    public static boolean deleteQuestion(QuestionsDto que) throws DBException{
    	try {
    		Connection con = DBUtil.connect();
    		String sqlQuery ="DELETE FROM questions WHERE examid=? and qid = ?";
    		PreparedStatement ps = con.prepareStatement(sqlQuery);
    		ps.setString(1, que.getExamid());
    		ps.setInt(2, que.getQid());
    		return ps.executeUpdate() > 0;
    	} catch(Exception e) {
    		System.out.println("ExamsDao.deleteQuestions(): " + e);
    		throw new DBException("We cant remove the question at this time!");
    	}
    }
    public static ArrayList<QuestionsDto> selectAllQuestions(String examid)throws DBException{
    	try {
    		Connection con = DBUtil.connect();
    		String sqlQuery = "SELECT * FROM Questions WHERE examid=?";
    		PreparedStatement ps = con.prepareStatement(sqlQuery);
    		ps.setString(1, examid);
    		ResultSet rs = ps.executeQuery();
    		
    		ArrayList<QuestionsDto> list = new ArrayList<QuestionsDto>();
    		QuestionsDto que = null;
    		
    		while(rs.next()) {
    			que = new QuestionsDto();
    			que.setQid(rs.getInt(1));
    			que.setExamid(rs.getString(2));
    			que.setQue(rs.getString(3));
    			que.setA(rs.getString(4));;
    			que.setB(rs.getString(5));
    			que.setC(rs.getString(6));
    			que.setD(rs.getString(7));
    			que.setAnswer(rs.getString(8));
    			
    			list.add(que);
    		}
    		return list;
    	} catch(Exception e) {
    		System.out.println("QuestionDao.selectAllQuestion(): "+e);
    		throw new DBException("Unable to Provide all Question at this Time !");
    	}
    }
    
}
