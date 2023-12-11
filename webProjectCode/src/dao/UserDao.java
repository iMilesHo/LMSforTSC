package dao;
import entity.User;

import java.util.List;

public interface UserDao {
    public int login(String name,String password);
    public boolean register(User user);
    public boolean updateUserInfor(User user);
    public List<User> getUserAll();//返回论文信息集合
    public boolean delete(int id);//根据id删除
    public boolean update(String name, int id);
    public List<User> searchUsers(String name);
}

