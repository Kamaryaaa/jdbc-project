package com.cydeo.jdbctests.day1;

import org.junit.jupiter.api.Test;

import java.sql.*;

public class P02_FlexibleNavigation {

    //CONNECTION STRING
    String dbUrl = "jdbc:oracle:thin:@54.160.111.35:1521:XE";
    String dbUsername ="hr";
    String dbPassword = "hr";


        @Test
        public void task1() throws SQLException {
            Connection conn = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
            Statement statement = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            ResultSet rs = statement.executeQuery("select FIRST_NAME,LAST_NAME from EMPLOYEES");
            //first row
            rs.next();
            System.out.println(rs.getString(1) + " " + rs.getString(2));

            //second row
            rs.next();
            System.out.println(rs.getString(1) + " " + rs.getString(2));

            //what if I want to get last row data ?
            //last method
            /*
            ResultSet.TYPE_SCROLL_INSENSITIVE -> to do flexible navigation between rows
            ResultSet.CONCUR_READ_ONLY --> do not update anything from database, only read
             */
            rs.last();
            System.out.println(rs.getString(1) + " " + rs.getString(2));

            //how many rows we have(last+getrow
            int rowNumber=rs.getRow();
            System.out.println("rowNumber= "+ rowNumber);

            System.out.println("=======Absolute=========");

            System.out.println(rs.absolute(46));
            System.out.println(rs.getString(1) + " " + rs.getString(2));

            System.out.println("=======Previous=========");
            rs.previous();

            System.out.println(rs.getString(1) + " " + rs.getString(2));


            System.out.println("=======before first=========");

            rs.beforeFirst();
            while (rs.next()){
                System.out.println(rs.getString(1) + " " + rs.getString(2));

            }

            //close connection
            rs.close();
            statement.close();
            conn.close();
        }
}
