package com.cydeo.jdbctests;

import java.sql.*;

public class P01_TestConnection {
    public static void main(String[] args) throws SQLException {
        //CONNECTION STRING
        String dbUrl = "jdbc:oracle:thin:@54.160.111.35:1521:XE";
        String dbUsername ="hr";
        String dbPassword = "hr";

        //Create the connection
        //DriverManager class getConnection Method will help to connect database
        Connection conn = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);

        //It will help us to execute queries
        Statement statement = conn.createStatement();

        //ResultSet will store data after execution. It stores only data(there is no table info)
        ResultSet rs = statement.executeQuery("select country_id,country_name from COUNTRIES");
        //retrive data
        // as a default it shoues before first
        // use next() method to jump in first row

/*
        rs.next();// true if the new current row is valid; false if there are nomore rows

        //print country id from first column
        System.out.println("rs.getString(1) = " + rs.getString(1));
        System.out.println("rs.getString(\"country_id\") = " + rs.getString("country_id"));
        //print country _name from second column (country name
        System.out.println("rs.getString(2) = " + rs.getString(2));
        System.out.println("rs.getString(\"country_name\") = " + rs.getString("country_name"));

        rs.next();

        //print country_id and country_name in following format
        //country_id-country_name

        System.out.println(rs.getString(1)+"-"+rs.getString(2));

        rs.next();
        System.out.println(rs.getString(1)+"-"+rs.getString(2));

        rs.next();
        System.out.println(rs.getString(1)+"-"+rs.getString(2));

 */

        //what if we have 1000 row

        while (rs.next()){
            System.out.println(rs.getString(1)+"-"+rs.getString(2));

        }

        rs.close();
        statement.close();
        conn.close();



    }
}
