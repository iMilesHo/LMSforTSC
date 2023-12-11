package dao;

import entity.User;
import util.DBconnect;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDaoImpl implements UserDao {
    public int login(String name, String password) {
        int flag = 0;
        if(name.equals("admin")&&password.equals("123456")){
            return 2;
        }
        try {
            try{
                DBconnect.init();
            }catch (Exception e){
                e.printStackTrace();
            }
            //注意查询语句中的单引号双引号
            ResultSet rs = DBconnect.selectSql("select * from Users where username='" + name + "'and password='" + password + "';");
            while (rs.next()) {
                if (rs.getString("username").equals(name) && rs.getString("password").equals(password)) {
                    flag = 1;
                }
            }
            DBconnect.closeConn();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }

    public boolean register(User user) {
        boolean flag = false;
        try{
            DBconnect.init();
        }catch (Exception e){
            e.printStackTrace();
        }
        String sqls="INSERT INTO `Users` (`userId`, `username`, `password`, `field`) VALUES (" + user.getuserId() +
                ",'" + user.getusername() + "','"+ user.getpassword() + "','"+user.getfield()+"')";
        int i = DBconnect.addUpdateDelete(sqls);
        if (i > 0) {
            flag = true;
        }
        DBconnect.closeConn();
        return flag;
    }

    public boolean updateUserInfor(User user){
        boolean flag = false;
        try{
            DBconnect.init();
        }catch (Exception e){
            e.printStackTrace();
        }
        String sqls="UPDATE  `Users` set password = '" +user.getpassword() + "', birthday= '" + user.getbirthday()
                + "', headUrl= '" + user.getheadUrl() + "', field= '" + user.getfield() + "', degree= '" + user.getdegree()
                + "', school= '" + user.getSchool() + "' where userId="+user.getuserId()+";";
        System.out.println(sqls);
        int i = DBconnect.addUpdateDelete(sqls);
        if (i > 0) {
            flag = true;
        }
        DBconnect.closeConn();
        return flag;
    }

    public List<User> getUserAll() {//返回用户信息集合
        List<User> list = new ArrayList<>();
        try {
            try{
                DBconnect.init();
            }catch (Exception e){
                e.printStackTrace();
            }
            ResultSet rs = DBconnect.selectSql("select * from Users");
            while (rs.next()) {
                User user=new User();
                user.setuserId(rs.getInt("userId"));
                user.setusername(rs.getString("username"));
                user.setpassword(rs.getString("password"));
                user.setbirthday(rs.getString("birthday"));
                user.setheadUrl(rs.getString("headUrl"));
                list.add(user);
            }
            DBconnect.closeConn();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean delete(int id) {//根据id删除{
        boolean flag = false;
        try{
            DBconnect.init();
        }catch (Exception e){
            e.printStackTrace();
        }
        String sql = "delete from Users where userId='" + id+"'";
        int i = DBconnect.addUpdateDelete(sql);//i的意义：
        if (i > 0) {
            flag = true;
        }
        DBconnect.closeConn();
        return flag;
    }

    public boolean update(String name, int id) {
        boolean flag = false;
        try{
            DBconnect.init();
        }catch (Exception e){
            e.printStackTrace();
        }
        String sql = "update Users set username ='" + name

                +"'"+"where userId = '" + id+"'";

        int i = DBconnect.addUpdateDelete(sql);
        if (i > 0) {
            flag = true;
        }
        DBconnect.closeConn();
        return flag;
    }

    @Override
    public List<User> searchUsers(String name) {
        List<User> list = new ArrayList<>();
        try {
            try{
                DBconnect.init();
            }catch (Exception e){
                e.printStackTrace();
            }

            String sql="select * from Users where concat(`username`) like " +
                    "'%" + name+ "%' "+
                    "ORDER BY LOCATE('" + name + "',concat(username));";
            ResultSet rs = DBconnect.selectSql(sql);
            while (rs.next()) {
                User user=new User();
                user.setuserId(rs.getInt("userId"));
                user.setusername(rs.getString("username"));
                user.setpassword(rs.getString("password"));
                user.setbirthday(rs.getString("birthday"));
                user.setheadUrl(rs.getString("headUrl"));
                list.add(user);
            }
            DBconnect.closeConn();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}

