package org.snnu.edu.utils;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class DealSql {
    /**
     * connect to MySQL
     */
    private static Connection conn = null;
    private static Statement statement = null;

    public static void connSQL() {
        String url = "jdbc:mysql://120.78.175.168:3306/java_web?characterEncoding=UTF-8&useSSL=false";
        String username = "yefan";
        // 加载驱动程序以连接数据库
        String password = "root";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(url, username, password);
        }
        //捕获加载驱动程序异常
        catch (ClassNotFoundException cnfex) {
            System.err.println(
                    "装载 JDBC/ODBC 驱动程序失败。");
            cnfex.printStackTrace();
        }
        //捕获连接数据库异常
        catch (SQLException sqlex) {
            System.err.println("无法连接数据库");
            sqlex.printStackTrace();
        }
    }

    public static void deconnSQL() {
        try {
            if (conn != null) {
                conn.close();
            }
        } catch (Exception e) {
            System.out.println("关闭数据库问题 ：");
            e.printStackTrace();
        }
    }


    public static List<Map<String, Object>> resultQuery(String sql){
        List<Map<String, Object>> list = new ArrayList<>();
        try {
            //创建Statement对象
            statement = conn.createStatement();
            ResultSet rs = statement.executeQuery(sql);
            //获取得到结果集(rs)的结构，比如字段数、字段名等。
            ResultSetMetaData rsmd = rs.getMetaData();
            while (rs.next()) {
                Map<String, Object> map = new HashMap<>();
                for (int i = 1; i <= rsmd.getColumnCount(); i++) {
                    String fieldName = rsmd.getColumnName(i);
                    map.put(fieldName, rs.getString(fieldName));
                }
                list.add(map);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    public static int resultUpdate(String sql){
        int result=0;
        try {
            statement=conn.createStatement();
            result=statement.executeUpdate(sql);

        }catch (Exception e){
            e.printStackTrace();
        }
        return result;
    }
    //查询全部
    public static List<Map<String, Object>> queryAll(String tableName) {
        String sql="select * from "+tableName+";";
        return resultQuery(sql);
    }

    //按条件查询
    public static List<Map<String, Object>> queryByTerms(String tabelName, List<String> fields, Map<String, Object> map) {
        StringBuilder terms = new StringBuilder();
        StringBuilder field= new StringBuilder();
        String sql = "";
        boolean flag = true;
        for (String key : map.keySet()) {
            if (flag) {
                terms.append(key + "= '" + map.get(key)+"' ");
                flag=false;
            }
            else {
                terms.append(" AND " + key + "= '" + map.get(key)+"' ");
            }
        }
        flag=true;
        for(int i=0;i<fields.size();i++){
            if(flag){
                field.append(fields.get(i));
                flag=false;
            }
            else{
                field.append(","+fields.get(i));
            }
        }
        System.out.println("terms=   " + terms.toString());
        sql = "select " + field + " from " + tabelName + " WHERE " + terms.toString()+";";
        System.out.println("sql=  "+sql);

        return resultQuery(sql);
    }

    public static int delete(String tableName,Map<String,Object> map){
        StringBuilder terms=new StringBuilder();
        String sql;
        Boolean flag=true;
        for (String key : map.keySet()) {
            if (flag) {
                terms.append(key + "= '" + map.get(key)+"' ");
                flag=false;
            }
            else {
                terms.append(" AND " + key + "= '" + map.get(key)+"' ");
            }
        }
        sql="delete from "+tableName+" WHERE "+terms+";";
        System.out.println("sql=="+sql);
        return resultUpdate(sql);
    }

    public static int insert(String tableName,List<String> field,List<List<String>>value){
        StringBuilder values=new StringBuilder();
        StringBuilder fields=new StringBuilder();
        boolean flag=true;
        int j=0;
        for (List<String> list:value) {
            j++;
            StringBuilder val=new StringBuilder();
            for(int i=0;i<list.size();i++){
                if(flag){
                    val.append("('"+list.get(i)+"'");
                    flag=false;
                }else {
                    val.append(",'" + list.get(i)+"'");
                }
            }
            flag=true;
            System.out.println("val======"+val);
            if(j==value.size()){
                values.append(val+")");
            }else {
                values.append(val + "),");
            }
        }
        System.out.println("==============="+values);
        flag=true;
        for (String s:field){
            if(flag){
                fields.append(s);
                flag=false;
            }else {
                fields.append(","+s);
            }

        }
        String sql="insert into "+tableName+" ("+fields+") "+"values "+values;
        System.out.println("==============="+sql);
        return resultUpdate(sql);
    }

    public static int update(String tableName,Map<String,Object>map,Map<String,Object>termsMap){
        StringBuilder value= new StringBuilder();
        StringBuilder terms=new StringBuilder();
        Boolean flag=true;
        for (String key : termsMap.keySet()) {
            if (flag) {
                terms.append(key + "= '" + termsMap.get(key)+"' ");
                flag=false;
            }
            else {
                terms.append(" AND " + key + "= '" + termsMap.get(key)+"' ");
            }
        }
        flag=true;
        for (String key : map.keySet()) {
            if (flag) {
                value.append(key + "= '" + map.get(key)+"' ");
                flag=false;
            }
            else {
                value.append(" ," + key + "= '" + map.get(key)+"' ");
            }
        }
        String sql="update "+tableName+" set "+value+" where "+terms+";";
        return resultUpdate(sql);
    }

}
