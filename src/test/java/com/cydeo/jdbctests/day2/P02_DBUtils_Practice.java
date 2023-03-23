package com.cydeo.jdbctests.day2;

import com.cydeo.jdbctests.utility.DB_Util;
import org.junit.jupiter.api.Test;

import java.util.Map;

public class P02_DBUtils_Practice {



    @Test
    public void task1(){
        //create connection
        DB_Util.createConnection();


        DB_Util.runQuery("select first_name,last_name,salary from employees");

        System.out.println("======GET ME FIRST ROW FIRST COLUM===============");
        System.out.println(DB_Util.getFirstRowFirstColumn());

        System.out.println("========GET ME ALL COLUMN NAMES=======");
        System.out.println(DB_Util.getAllColumnNamesAsList());

        System.out.println("=========GET ME ALL FIRST NAMES========");
        System.out.println(DB_Util.getColumnDataAsList("first_name"));

        System.out.println("======GET ME HOW MANY ROWS WE HAVE================");
        System.out.println(DB_Util.getRowCount());

        System.out.println("=========GET ME CERTAIN ROW INFO AS A MAP===========");

        System.out.println(DB_Util.getRowMap(8));
        System.out.println("=========GET ME CERTAIN ROW INFO AS A LIST===========");
        System.out.println(DB_Util.getRowDataAsList(1));

        System.out.println("=========GET ME ALL ROW AS A LIST OF MAP===========");
        System.out.println(DB_Util.getAllRowAsListOfMap());
        System.out.println("=====ITERATE THE MAP OF LIST========");
        for (Map<String, String> eachMap : DB_Util.getAllRowAsListOfMap()) {
            System.out.println(eachMap);

        }

        //close connection
        DB_Util.destroy();
    }







}
