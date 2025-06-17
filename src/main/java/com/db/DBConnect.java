package com.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {

    private static Connection con;

    public static Connection getCon() {
        con = SingleObject.getInstance().getConnection();
        return con;
    }

    public static class SingleObject {
        private static SingleObject instance = new SingleObject();

        private Connection connection;

        private SingleObject() {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital", "root", "root");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        public static SingleObject getInstance() {
            return instance;
        }

        public Connection getConnection() {
            return connection;
        }

        public void showMessage() {
            System.out.println("Connection successfull.");
        }
    }
}