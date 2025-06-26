package com.online.jdbc.dto;

import java.io.Serializable;

public class ContactsDto implements Serializable {

    private String name;
    private String email;
    private String subject;
    private String message;

    public ContactsDto() {
        // Default constructor
    }

    public ContactsDto(String name, String email, String subject, String message) {
        this.name = name;
        this.email = email;
        this.subject = subject;
        this.message = message;
    }

    // Getters and Setters

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    @Override
    public String toString() {
        return "ContactsDto [name=" + name + ", email=" + email + ", subject=" + subject + ", message=" + message + "]";
    }
}
