package com.cydeo.jdbctests.day2;

import org.junit.jupiter.api.Test;

import java.sql.*;
import java.util.*;

public class P01_ListOfMaps {

    String dbUrl = "jdbc:oracle:thin:@54.160.111.35:1521:XE";
    String dbUsername ="hr";
    String dbPassword = "hr";
    @Test
    public void task1(){
        Map<String,Object> rowMap1=new HashMap<>();// if we want to keep insertion order, we can use LinkedHashMap(); // for storing the value of each row
        System.out.println("======Row MAp 1======");
        rowMap1.put("FIRST_NAME","Steven");
        rowMap1.put("LAST_NAME","King");
        rowMap1.put("Salary",24000);
        System.out.println("rowMap1 = " + rowMap1);

        Map<String,Object> rowMap2=new HashMap<>();// if we want to keep insertion order, we can use LinkedHashMap();
        System.out.println("======Row MAp 2======");
        rowMap2.put("FIRST_NAME","Neena");
        rowMap2.put("LAST_NAME","Kochhar");
        rowMap2.put("Salary",17000);
        System.out.println("rowMap1 = " + rowMap1);

        System.out.println("=====List==============");
        List<Map<String,Object>> dataList = new ArrayList<>();// for storing the map
        dataList.add(rowMap1);
        dataList.add(rowMap2);
        System.out.println(dataList);
        //retrieving specific data from the list:lastname=King
        System.out.println(dataList.get(0).get("LAST_NAME"));
    }
    @Test
    public void task2() throws SQLException {
        Connection conn = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
        Statement statement = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        ResultSet rs = statement.executeQuery("select * from EMPLOYEES");
        ResultSetMetaData rsmd = rs.getMetaData();// create rsmd to get column name and count


        Map<String,Object> rowMap1=new HashMap<>();// if we want to keep insertion order, we can use LinkedHashMap(); // for storing the value of each row
        System.out.println("======Row MAp 1======");
        rs.next();// move to first row to fill rowMap1
        rowMap1.put(rsmd.getColumnName(1),rs.getString(1));
        rowMap1.put(rsmd.getColumnName(2),rs.getString(2));
        rowMap1.put(rsmd.getColumnName(3),rs.getString(3));
        System.out.println("rowMap1 = " + rowMap1);

        Map<String,Object> rowMap2=new HashMap<>();// if we want to keep insertion order, we can use LinkedHashMap();
        System.out.println("======Row MAp 2======");
        rs.next();
        rowMap2.put(rsmd.getColumnName(1),rs.getString(1));
        rowMap2.put(rsmd.getColumnName(2),rs.getString(2));
        rowMap2.put(rsmd.getColumnName(3),rs.getString(3));
        System.out.println("rowMap2 = " + rowMap2);

        Map<String,Object> rowMap3=new HashMap<>();// if we want to keep insertion order, we can use LinkedHashMap();
        System.out.println("======Row MAp 3======");
        rs.next();
        rowMap3.put(rsmd.getColumnName(1),rs.getString(1));
        rowMap3.put(rsmd.getColumnName(2),rs.getString(2));
        rowMap3.put(rsmd.getColumnName(3),rs.getString(3));
        System.out.println("rowMap3 = " + rowMap3);

        System.out.println("=====List==============");
        List<Map<String,Object>> dataList = new ArrayList<>();// for storing the map
        dataList.add(rowMap1);
        dataList.add(rowMap2);
        dataList.add(rowMap3);
        System.out.println(dataList);
        //retrieving specific data from the list:lastname=King
        System.out.println(dataList.get(0).get("LAST_NAME"));



        //close connection
        rs.close();
        statement.close();
        conn.close();
    }
    @Test
    public void task3() throws SQLException {
        Connection conn = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
        Statement statement = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        ResultSet rs = statement.executeQuery("select * from regions");
        ResultSetMetaData rsmd = rs.getMetaData();// create rsmd to get column name and count


        //create the list ofMaps to keep information
        int columnCount=rsmd.getColumnCount();// how many columns we have
        List<Map<String,Object>> dataList = new ArrayList<>();

        while (rs.next()){  //iterate through arch row
            Map<String,Object> rowMap = new LinkedHashMap<>();

            for (int i = 1; i <= columnCount; i++) {  //iterate each column dynamically to fill the map
                rowMap.put(rsmd.getColumnName(i),rs.getString(i));
            }
            dataList.add(rowMap);

        }
        System.out.println(dataList);
        for (Map<String, Object> row : dataList) {
            System.out.println(row);
        }

        //close connection
        rs.close();
        statement.close();
        conn.close();
    }


}
