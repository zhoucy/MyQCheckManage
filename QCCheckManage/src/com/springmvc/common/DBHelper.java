package com.springmvc.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBHelper {
     private static String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
     private static String url = "jdbc:sqlserver://127.0.0.1;DatabaseName=test";
   /* 
    String driver = "com.mysql.jdbc.Driver";
    String url = "jdbc:mysql://127.0.0.1:3306/javenforexcel";
    
    */
     private static  Connection con = null;
     private static  ResultSet res = null;

    public static void DataBase() {
            try {
                Class.forName(driver);
                con = DriverManager.getConnection(url, "sa", "123");
            } catch (ClassNotFoundException e) {
                // TODO Auto-generated catch block
                  System.err.println("װ�� JDBC/ODBC ��������ʧ�ܡ�" );  
                e.printStackTrace();
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                System.err.println("�޷��������ݿ�" ); 
                e.printStackTrace();
            }
    }

    // ��ѯ
    public  static ResultSet  Search(String sql, String str[]) {
        DataBase();
        try {
            PreparedStatement pst =con.prepareStatement(sql);
            if (str != null) {
                for (int i = 0; i < str.length; i++) {
                    pst.setString(i + 1, str[i]);
                }
            }
            res = pst.executeQuery();

        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return res;
    }

    // ��ɾ�޸�
    public static int AddU(String sql, String str[]) {
        int a = 0;
        DataBase();
        try {
            PreparedStatement pst = con.prepareStatement(sql);
            if (str != null) {
                for (int i = 0; i < str.length; i++) {
                    pst.setString(i + 1, str[i]);
                }
            }
            a = pst.executeUpdate();
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return a;
    }
    
public static void main(String[] args) {
	DBHelper.DataBase();
}

}