package com.online.jdbc.dto;

import java.io.Serializable;
import java.sql.Date;

public class ResultsDto implements Serializable {
      private String testId;
      private String studentId;
      private String examId;
      private String rightAnswers;
      private String wrongAnswers;
      private Date examDate;
      private String totalQues;
    
    public void setTotalQues(String totalQues){
    	this.totalQues = totalQues;
    }
    public String getTotalQues(){
    	return totalQues;
    }
	public String getTestId() {
		return testId;
	}
	public void setTestId(String testId) {
		this.testId = testId;
	}
	public String getStudentId() {
		return studentId;
	}
	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}
	public String getExamId() {
		return examId;
	}
	public void setExamId(String examId) {
		this.examId = examId;
	}
	public String getRightAnswers() {
		return rightAnswers;
	}
	public void setRightAnswers(String rightAnswers) {
		this.rightAnswers = rightAnswers;
	}
	public String getWrongAnswers() {
		return wrongAnswers;
	}
	public void setWrongAnswers(String wrongAnswers) {
		this.wrongAnswers = wrongAnswers;
	}
	public Date getExamDate() {
		return examDate;
	}
	public void setExamDate(Date examDate) {
		this.examDate = examDate;
	}
      
    public String toString() {
    	return "result is: "+testId+","+examId+","+studentId+","+rightAnswers+","+wrongAnswers+".";
    }
    
    public String hashcode() {
    	return testId;
    }
    
    public boolean equals(Object obj) {
    	return this.testId == ((ResultsDto)obj).testId;
    }
    

}
