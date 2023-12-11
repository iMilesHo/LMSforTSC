package dao;

import entity.Papers;
import java.util.List;

public interface PaperDao {
    public List<Papers> getPaperAll();//返回论文信息集合
    public List<Papers> getPaperAllofMine(String name);//返回论文信息集合
    public boolean delete(int id);//根据id删除
    public boolean addpaper(Papers paper);
    public List<Papers> getPaperSearch(String kd);
    public boolean addcollectionlist(String name,String paperid);
}
