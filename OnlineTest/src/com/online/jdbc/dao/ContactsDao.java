package com.online.jdbc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.online.jdbc.dto.ContactsDto;
import com.online.jdbc.exception.DBException;
import com.online.jdbc.util.DBUtil;

public class ContactsDao {

    public static void insertContact(ContactsDto contact) throws DBException {
        Connection con = null;
        PreparedStatement ps = null;

        try {
            con = DBUtil.connect(); // Your DB connection method
            String sql = "INSERT INTO contact(name, email, subject, message) VALUES (?, ?, ?, ?)";

            ps = con.prepareStatement(sql);
            ps.setString(1, contact.getName());
            ps.setString(2, contact.getEmail());
            ps.setString(3, contact.getSubject());
            ps.setString(4, contact.getMessage());

            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            throw new DBException("Error inserting contact message: " + e.getMessage());
        } 
    }
}
