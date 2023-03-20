package com.cydeo.jdbctests;

import javax.xml.transform.Result;
import java.sql.*;

public class TestOracleConnection {
    public static void main(String[] args) throws SQLException {

        //connection string
        String dbUrl="jdbc:oracle:thin:@54.160.111.35:1521:XE";
        String dbUsername = "hr";
        String dbPassword="hr";

        //Driver Manager class getConnection Method help to connect database
        Connection conn = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);

// it will help us to excute queires
        Statement statement = conn.createStatement();

        ///this will store the result, it only stores data
        ResultSet rs = statement.executeQuery("select * from regions");

        //getting data
        //System.out.println("rs.next() = " + rs.next());

        /*System.out.println("====first row=======");
        // pointer is in the first now
        System.out.println(rs.getInt(1));
        System.out.println(rs.getString(2));

        // same info using columnName insteadOd index number
        System.out.println(rs.getInt("REGION_ID"));
        System.out.println(rs.getString("REGION_NAME"));

        // task: get me the second row result in following format: 2 - Americas

         */
        /*System.out.println("====second row=======");
        rs.next();
        System.out.println(rs.getInt(1)+" - "+rs.getString(2));

        System.out.println("====third row=======");
        rs.next();
        System.out.println(rs.getInt(1)+" - "+rs.getString(2));

        System.out.println("====fourth row=======");
        rs.next();
        System.out.println(rs.getInt(1)+" - "+rs.getString(2));

         */

        while (rs.next()){
            System.out.println(rs.getInt(1)+" - "+rs.getString(2));

        }




        //close connection
         rs.close();
         statement.close();
         conn.close();



    }
}
