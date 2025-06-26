package com.online.jdbc.dto;

import java.io.Serializable;

public class ExamsDto implements Serializable {
	private String examid;
    private String topic;
    private String level;
    private String description;
    private int duration;
    
    public String getExamid() {
		return examid;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getDuration() {
		return duration;
	}
	public void setDuration(int duration) {
		this.duration = duration;
	}
	public void setExamid(String examid) {
		this.examid = examid;
	}
	public String getTopic() {
		return topic;
	}
	public void setTopic(String topic) {
		this.topic = topic;
	}
	   
}
