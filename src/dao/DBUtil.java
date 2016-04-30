package dao;

import java.sql.*;

/**
 * time: 16-4-27.
 * author: han
 */
public class DBUtil {
    private Connection conn = null;
    public Connection getConn() {
        /** 数据库配置 */
        String driver = "com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/blogDB";
        String username = "root";
        String password = "1234";
        try {
            Class.forName(driver); //classLoader,加载对应驱动
            conn = DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return conn;
    }

    /**
     * 执行SQL语句，并返回一个结果集
     * @param sql
     * @return 查询的结果集
     */
    public ResultSet getResultSet(String sql){
        getConn();
        ResultSet res = null;
        try {
            Statement stm = conn.createStatement();
            res = stm.executeQuery(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return res;
    }

    /**
     * 执行一条SQL语句（增删改）
     * @param sql
     */
    public void executeSQL(String sql){
        getConn();
        try {
            Statement stm = conn.createStatement();
            stm.executeUpdate(sql);
            this.conn.close();
            this.conn = null;
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
