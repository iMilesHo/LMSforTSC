package dao;

import entity.Papers;
import util.DBconnect;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PaperDaoImpl implements PaperDao{
    @Override
    public List<Papers> getPaperAll() {
        List<Papers> list = new ArrayList<>();
        try {
            try{
                DBconnect.init();
            }catch (Exception e){
                e.printStackTrace();
            }
            ResultSet rs = DBconnect.selectSql("select * from Papers");
            while (rs.next()) {
                int paperId=rs.getInt("paperId");
                String titel=rs.getString("titel");
                String data=rs.getString("data");
                String task=rs.getString("task");
                String model=rs.getString("model");
                String authors=rs.getString("authors");
                String journal= rs.getString("journal");
                String volume=rs.getString("volume");
                String pages=rs.getString("pages");
                String year=rs.getString("year");
                String publisher=rs.getString("publisher");
                String keywords=rs.getString("keywords");
                String myabstracts=rs.getString("abstract");
                Papers paper=new Papers(paperId,titel,data,task,model,authors,journal,volume,pages,year,publisher,keywords,myabstracts);
                list.add(paper);
            }
            DBconnect.closeConn();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    @Override
    public List<Papers> getPaperAllofMine(String name){
        List<Papers> list = new ArrayList<>();
        try {
            try{
                DBconnect.init();
            }catch (Exception e){
                e.printStackTrace();
            }
            ResultSet rs0 = DBconnect.selectSql("select userId from Users where username='"+name+"'");
            int userId=1;
            while (rs0.next()) {
                userId=rs0.getInt("userId");
            }
            String sql1="select * from Papers,CollectionList where CollectionList.userId="+ userId +" " +
                    "and CollectionList.paperId=Papers.paperId;";
            ResultSet rs = DBconnect.selectSql(sql1);
            while (rs.next()) {
                int paperId=rs.getInt("paperId");
                String titel=rs.getString("titel");
                String data=rs.getString("data");
                String task=rs.getString("task");
                String model=rs.getString("model");
                String authors=rs.getString("authors");
                String journal= rs.getString("journal");
                String volume=rs.getString("volume");
                String pages=rs.getString("pages");
                String year=rs.getString("year");
                String publisher=rs.getString("publisher");
                String keywords=rs.getString("keywords");
                String myabstracts=rs.getString("abstract");
                Papers paper=new Papers(paperId,titel,data,task,model,authors,journal,volume,pages,year,publisher,keywords,myabstracts);
                list.add(paper);
            }
            DBconnect.closeConn();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<Papers> getPaperSearch(String kd) {
        List<Papers> list = new ArrayList<>();
        try {
            try{
                DBconnect.init();
            }catch (Exception e){
                e.printStackTrace();
            }
            String[] t=kd.split("\\s+");
            String sql="";
            if(t[0].equals("")){
                DBconnect.closeConn();
                return list;
            }else if(t.length==1){
                sql="select * from Papers where concat(`titel`,`abstract`) like " +
                        "'%" + t[0]+ "%'"+
                        "ORDER BY LOCATE('" + t[0] + "',concat(titel,abstract));";
            }else if(t.length==2){
                sql="select * from Papers where concat(`titel`,`abstract`) like " +
                        "'%" + t[0]+ "%' or '%" +t[1]+ "%'"+
                        "ORDER BY LOCATE('" + t[0] + t[1] +"',concat(titel,abstract));";
            }else {
                sql="select * from Papers where concat(`titel`,`abstract`) like " +
                        "'%" + t[0]+ "%' or '%" +t[1]+ "%' or '%" + t[2]+ "%'"+
                        "ORDER BY LOCATE('" + t[0] + t[1] + t[2] + "',concat(titel,abstract));";
            }
            ResultSet rs = DBconnect.selectSql(sql);
            while (rs.next()) {
                int paperId=rs.getInt("paperId");
                String titel=rs.getString("titel");
                String data=rs.getString("data");
                String task=rs.getString("task");
                String model=rs.getString("model");
                String authors=rs.getString("authors");
                String journal= rs.getString("journal");
                String volume=rs.getString("volume");
                String pages=rs.getString("pages");
                String year=rs.getString("year");
                String publisher=rs.getString("publisher");
                String keywords=rs.getString("keywords");
                String myabstracts=rs.getString("abstract");
                Papers paper=new Papers(paperId,titel,data,task,model,authors,journal,volume,pages,year,publisher,keywords,myabstracts);
                list.add(paper);
            }
            DBconnect.closeConn();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public boolean delete(int id) {
        boolean flag = false;
        try{
            DBconnect.init();
        }catch (Exception e){
            e.printStackTrace();
        }
        String sql = "delete from Papers where paperId='" + id+"'";
        int i = DBconnect.addUpdateDelete(sql);//i的意义：
        if (i > 0) {
            flag = true;
        }
        DBconnect.closeConn();
        return flag;
    }

    @Override
    public boolean addpaper(Papers paper) {
        boolean flag = false;
        try {
            try{
                DBconnect.init();
            }catch (Exception e){
                e.printStackTrace();
            }
            String sql="select max(paperId) as id from Papers";
            ResultSet rs = DBconnect.selectSql(sql);
            int paperid=0;
            //如果有ID，原有ID+1
            if(rs.next()) paperid = rs.getInt("id") + 1;
            paper.setpaperId(paperid);
            sql="insert into Papers(paperId,titel,data,task,journal,model,year,keywords) " +
                    "values('" + paper.getpaperId() + "','" + paper.gettitel() + "','"+paper.getData()+"','"+paper.getTask()+ "','"+paper.getjournal()+
                    "','"+paper.getModel()+"','"+paper.getyear()+"','"+paper.getkeywords()+ "' )";
            int i = DBconnect.addUpdateDelete(sql);
            if (i > 0) {
                flag = true;
            }
            DBconnect.closeConn();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }

    @Override
    public boolean addcollectionlist(String name,String paperid){
        boolean flag = false;
        try {
            try{
                DBconnect.init();
            }catch (Exception e){
                e.printStackTrace();
            }
            ResultSet rs = DBconnect.selectSql("select userId from Users where username='"+name+"'");
            int userId=1;
            while (rs.next()) {
                userId=rs.getInt("userId");
            }
            String sqls="insert into CollectionList(paperID,userId) values('"+paperid+"','"+userId+"')";
            int i = DBconnect.addUpdateDelete(sqls);
            if (i > 0) {
                flag = true;
            }
            DBconnect.closeConn();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }
}
