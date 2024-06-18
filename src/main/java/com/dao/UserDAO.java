package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


import com.entity.User;


public class UserDAO {

    private Connection con;
    
    public UserDAO(Connection con) {
        super();
        this.con =con;
    }

    public boolean register(User u) 
    {
        boolean f = false;

        try {
            String sql = "insert into user_details(full_name, email,password) values(?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, u.getFullName());
            ps.setString(2, u.getEmail());
            ps.setString(3, u.getPassword());

            int i = ps.executeUpdate();

            if (i ==1){
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    public User login(String em,String psw)
    {
        User u = null;

        try {
            String sql = "select * from user_details where email=? and password=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, em);
            ps.setString(2, psw);

            ResultSet rs = ps.executeQuery();

            while(rs.next())
            {
                u =new User();
                u.setId(rs.getInt(1));
                u.setFullName(rs.getString(2));
                u.setEmail(rs.getString(3));
                u.setPassword(rs.getString(4));
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }

        return u;
    }

    public boolean checkOldPassword(int userId,String oldPassword){
        boolean f = false;

        try {
            String sql = "select * from user_details where id=? and password=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, userId);
            ps.setString(2, oldPassword);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                f= true;
            }


        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;   
    }

    public boolean changePassword(int userId,String newPassword){
        boolean f = false;

        try {
            String sql = "update user_details set password = ? where id = ?";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, newPassword);
            ps.setInt(2, userId);
            
            int i = ps.executeUpdate();

            if (i == 1) {
                f=true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;   
    }
}
