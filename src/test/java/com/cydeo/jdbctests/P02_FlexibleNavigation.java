package com.cydeo.jdbctests;

import org.junit.jupiter.api.Test;

import java.sql.*;

public class P02_FlexibleNavigation {
    String dbUrl = "jdbc:oracle:thin:@54.160.111.35:1521:XE";
    String dbUsername ="hr";
    String dbPassword = "hr";


    @Test
    public void flexibleNavigation() throws SQLException {
        Connection conn = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
        Statement stmn = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
        ResultSet rs=stmn.executeQuery("select country_id,country_name from countries");

        //retrive data
        rs.next();
        System.out.println("=====first Row======");
        System.out.println(rs.getString(1)+" - "+rs.getString(2));

        rs.next();
        System.out.println("=====second Row======");
        System.out.println(rs.getString(1)+" - "+rs.getString(2));

        //get data from row 10
        System.out.println("=====tenth Row======");
        rs.absolute(10);
        System.out.println(rs.getString(1)+" - "+rs.getString(2));

        System.out.println("=====getRow Row======");
        System.out.println(rs.getRow());


        //how many row we have
        //first we neeed to point last row then we are gonna use get row method
        rs.last();
        System.out.println(rs.getString(1)+" - "+rs.getString(2));
        System.out.println(rs.getRow());

        System.out.println("=====previouse Row======");
        rs.previous();
        System.out.println(rs.getString(1)+" - "+rs.getString(2));

        rs.first();
        System.out.println("=====first Row======");
        System.out.println(rs.getString(1)+" - "+rs.getString(2));


        System.out.println("=====get all country_id snd country name======");
        rs.beforeFirst();
        System.out.println("=====brfore first used ======");

        while (rs.next()){
            System.out.println(rs.getString(1)+"-"+rs.getString(2));

        }






        rs.close();
        stmn.close();
        conn.close();
    }



}
