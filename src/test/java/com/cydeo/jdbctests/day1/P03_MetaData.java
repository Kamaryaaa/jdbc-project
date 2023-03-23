package com.cydeo.jdbctests.day1;

import org.junit.jupiter.api.Test;

import java.sql.*;

public class P03_MetaData {

    //CONNECTION STRING
    String dbUrl = "jdbc:oracle:thin:@54.160.111.35:1521:XE";
    String dbUsername = "hr";
    String dbPassword = "hr";

    @Test
    public void task1() throws SQLException {
        Connection conn = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
        Statement statement = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        ResultSet rs = statement.executeQuery("select * from EMPLOYEES");


        DatabaseMetaData dbMetaData = conn.getMetaData();

        System.out.println(dbMetaData.getUserName());
        System.out.println(dbMetaData.getDatabaseProductName());
        System.out.println(dbMetaData.getDriverName());
        System.out.println(dbMetaData.getDatabaseProductVersion());

        //resultsETmETAdATA
        ResultSetMetaData rsmd = rs.getMetaData();


        int columnCount = rsmd.getColumnCount();
        System.out.println(columnCount);

        //geting column name for index 4
        System.out.println(rsmd.getColumnName(2));

        //printAllTheName dynamically
        for (int i = 1; i <= columnCount; i++) {
            System.out.println(rsmd.getColumnName(i));

        }
        /*
        resultSet --> it holds table data
        rs.next() --> it iterate each row dynamically ( with while loop)
           rs.getString(columnName or columnIndex) --> to retrieve data itself
           resultSetMetaData --> it holds table information (columnName,columnCount)
           rsmd.getColumnCount()--> how many column are there
           rsmd.getColumnName(index) --> it will give specific column name
         */
/*
//write a code, that print whole table information for every query.
        //Column Name - Column value
        //EMPLOYEE_ID - 100
        //FIRST_NAME - Steven
 */
        while (rs.next()) {
            for (int i = 1; i <= columnCount; i++) {
                System.out.print(rsmd.getColumnName(i) + "-" + rs.getString(i) + " ");
            }
            System.out.println();
        }


        //close connection
        rs.close();
        statement.close();
        conn.close();
    }
}


