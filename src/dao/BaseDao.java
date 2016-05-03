package dao;

import java.lang.reflect.Field;
import java.sql.*;

/**
 * 我自己实现的ORM框架
 * time: 16-4-27.
 * author: han
 */
public class BaseDao {
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

    /**
     * 原子操作
     * 将ｔ存到数据库
     * @param t
     * @param <T>
     */
    public <T> void save(T t) {
//        StringBuffer sql = new StringBuffer();
//        sql.append(" insert into ");
        Class cl = t.getClass();
        /********** SQL 拼接部分 ****************/
        String nn = cl.getName();
        String table_name = nn.substring(nn.lastIndexOf(".") + 1).toLowerCase();
        String clumName = "";
        String valueSql = "";
        /***********    END     ***********/
        Field[] fields = cl.getDeclaredFields();
        try {
            for (Field f : fields) {
                String fname = f.getName();
                /**  忽略id 保持自增  */
                if (fname.equals("id")) continue;
                if (fname.equals("created_time")) continue;
                clumName = clumName + fname + ",";
                /**  修改访问权限，可以访问private   */
                f.setAccessible(true);
                valueSql = valueSql + "'" + f.get(t) + "'" + ",";
            }
            clumName = clumName.substring(0, clumName.lastIndexOf(","));
            valueSql = valueSql.substring(0, valueSql.lastIndexOf(","));
//            String sql = " insert into " +table_name+ "("+clumName+")"+" values("+valueSql+")";
            String sql = String.format(" insert into %s(%s) values(%s)", table_name, clumName, valueSql);
//            System.out.println(sql);
            //数据库操作
//            DBUtil du = new DBUtil();
//            getConn();
//            du.executeSQL(sql);
            DBUtil db = new DBUtil();
            Connection conn = db.getConn();
            PreparedStatement pstmt = null;
            try {
                pstmt = conn.prepareStatement(sql);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            if (pstmt != null) {
                pstmt.execute(sql);
                pstmt.close();
            }
            conn.close();
        } catch ( IllegalAccessException | SQLException e) {
            e.printStackTrace();
        }
//        } catch (IllegalAccessException e) {
//            e.printStackTrace();
//        }
    }
}