package dao;

import entity.*;
import util.DBconnect;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProcedureDaoImpl implements ProcedureDao{
    public boolean deliverMoments(Moments mmt,String name){
        boolean flag = false;
        try {
            try{
                DBconnect.init();
            }catch (Exception e){
                e.printStackTrace();
            }
            ResultSet rs = DBconnect.selectSql("select userId from Users where username='"+name+"'");
            int userId=0;
            while (rs.next()) {
                userId=rs.getInt("userId");
            }
            mmt.setuserId(userId);
            String sql="insert into Moments(userId,momentWord,pictureUrl,havePicture,momentAddr) " +
                    "values('" + mmt.getuserId()+"','" + mmt.getmomentWord() + "','" + mmt.getpictureUrl() + "'," + mmt.gethavePicture() +",'" +mmt.getmomentAddr() +"')";
            System.out.println(sql);
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

    public boolean sentMessages(Messages mmt, String name){
        boolean flag = false;
        try {
            try{
                DBconnect.init();
            }catch (Exception e){
                e.printStackTrace();
            }
            ResultSet rs = DBconnect.selectSql("select userId from Users where username='"+name+"'");
            int userId=0;
            while (rs.next()) {
                userId=rs.getInt("userId");
            }
            mmt.setfomUserId(userId);
            rs = DBconnect.selectSql("select userId from Users where username='"+mmt.gettousername()+"'");
            while (rs.next()) {
                userId=rs.getInt("userId");
            }
            mmt.settoUserId(userId);
            String sql="insert into Messages(fromUserId,toUserId,messageWords,pictureUrl,havaPicture) " +
                    "values('" + mmt.getfomUserId()+"','" + mmt.gettoUserId() + "','" + mmt.getmessageWord() + "','"
                    + mmt.getpictureUrl() +"','" +mmt.gethavePicture() +"')";
            System.out.println(sql);
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

    public List<Moments> getMomentsAllofMine(String name){
        List<Moments> list = new ArrayList<>();
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
            String sql1="select Moments.*,Users.username,Users.headUrl from Moments,Friendslist,Users where Friendslist.friendId="+ userId +" " +
                    "and Friendslist.userId=Moments.userId and Users.userId=Moments.userId order by Moments.momentId desc;";
            ResultSet rs = DBconnect.selectSql(sql1);
            while (rs.next()) {
                Moments mmt=new Moments();
                mmt.setmomentId(rs.getInt("momentId"));
                mmt.setuserId(rs.getInt("userId"));
                mmt.setmomentTime(rs.getString("momentTime"));
                mmt.setmomentWord(rs.getString("momentWord"));
                mmt.setpictureUrl(rs.getString("pictureUrl"));
                mmt.sethavePicture(rs.getInt("havePicture"));
                mmt.setUsername(rs.getString("username"));
                mmt.setheadUrl(rs.getString("headUrl"));
                mmt.setmomentAddr(rs.getString("momentAddr"));
                mmt.setlikeNum(rs.getInt("likeNum"));
                List<User> ul=getaLikeList(""+mmt.getmomentId()+"");
                List<Comments> cmt=getCommentList(""+mmt.getmomentId()+"");
                mmt.setUseroflikeList(ul);
                mmt.setCommentlist(cmt);
                list.add(mmt);
            }
            DBconnect.closeConn();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Messages> getMessagesAllofMine_sent(String name){
        List<Messages> list = new ArrayList<>();
        try {
            try{
                DBconnect.init();
            }catch (Exception e){
                e.printStackTrace();
            }
            ResultSet rs0 = DBconnect.selectSql("select userId from Users where username='"+name+"'");
            int fuserId=1;
            while (rs0.next()) {
                fuserId=rs0.getInt("userId");
            }
            String sql1="select Messages.*,Users.username,Users.headUrl from Messages,Users where Messages.fromUserId="+ fuserId +" " +
                    "and Messages.toUserId=Users.userId order by Messages.messageId desc;";
            ResultSet rs = DBconnect.selectSql(sql1);
            while (rs.next()) {
                Messages mmt=new Messages();
                mmt.setmessageId(rs.getInt("messageId"));
                mmt.setfomUserId(rs.getInt("fromUserId"));
                mmt.settoUserId(rs.getInt("toUserId"));
                mmt.setmessageWord(rs.getString("messageWords"));
                mmt.setpictureUrl(rs.getString("pictureUrl"));
                mmt.sethavePicture(rs.getInt("havaPicture"));
                mmt.setmessageTime(rs.getString("momentTime"));
                mmt.settousername(rs.getString("username"));
                mmt.setheadUrl(rs.getString("headUrl"));
                list.add(mmt);
            }
            DBconnect.closeConn();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Messages> getMessagesAllofMine_copy(String name){
        List<Messages> list = new ArrayList<>();
        try {
            try{
                DBconnect.init();
            }catch (Exception e){
                e.printStackTrace();
            }
            ResultSet rs0 = DBconnect.selectSql("select userId from Users where username='"+name+"'");
            int tuserId=1;
            while (rs0.next()) {
                tuserId=rs0.getInt("userId");
            }
            String sql1="select Messages.*,Users.username,Users.headUrl from Messages,Users where Messages.toUserId="+ tuserId +" " +
                    "and Messages.toUserId=Users.userId order by Messages.messageId desc;";
            ResultSet rs = DBconnect.selectSql(sql1);
            while (rs.next()) {
                Messages mmt=new Messages();
                mmt.setmessageId(rs.getInt("messageId"));
                mmt.setfomUserId(rs.getInt("fromUserId"));
                mmt.settoUserId(rs.getInt("toUserId"));
                mmt.setmessageWord(rs.getString("messageWords"));
                mmt.setpictureUrl(rs.getString("pictureUrl"));
                mmt.sethavePicture(rs.getInt("havaPicture"));
                mmt.setmessageTime(rs.getString("momentTime"));
                mmt.setfromusername(rs.getString("username"));
                mmt.setheadUrl(rs.getString("headUrl"));
                list.add(mmt);
            }
            DBconnect.closeConn();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public User getUserInfor(String name){
        User mmt=new User();
        try {
            try{
                DBconnect.init();
            }catch (Exception e){
                e.printStackTrace();
            }
            ResultSet rs = DBconnect.selectSql("select * from Users where username='"+name+"'");
            while (rs.next()) {
                mmt.setuserId(rs.getInt("userId"));
                mmt.setusername(rs.getString("username"));
                mmt.setpassword(rs.getString("password"));
                mmt.setbirthday(rs.getString("birthday"));
                mmt.setheadUrl(rs.getString("headUrl"));
                mmt.setfield(rs.getString("field"));
                mmt.setdegree(rs.getString("degree"));
                mmt.setschool(rs.getString("school"));
            }
            DBconnect.closeConn();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return mmt;
    }

    public boolean addLikelist(String momentId,String username){
        boolean flag = false;
        try {
            try{
                DBconnect.init();
            }catch (Exception e){
                e.printStackTrace();
            }
            ResultSet rs = DBconnect.selectSql("select userId from Users where username='"+username+"'");
            int userId=1;
            while (rs.next()) {
                userId=rs.getInt("userId");
            }
            rs = DBconnect.selectSql("select likeNum from Moments where momentId='"+momentId+"'");
            int likeNUm=1;
            while (rs.next()) {
                likeNUm=rs.getInt("likeNum")+1;
            }
            String sqls="insert into LikeList(momentId,userId) values('"+momentId+"','"+userId+"')";
            int i = DBconnect.addUpdateDelete(sqls);
            if (i > 0) {
                flag = true;
            }
            if (flag) {
                DBconnect.addUpdateDelete("UPDATE Moments set likeNum="+likeNUm+" WHERE momentId="+momentId);
            }
            DBconnect.closeConn();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }

    public boolean addComments(String momentId,String username,String commentswords){
        boolean flag = false;
        try {
            try{
                DBconnect.init();
            }catch (Exception e){
                e.printStackTrace();
            }
            ResultSet rs = DBconnect.selectSql("select userId from Users where username='"+username+"'");
            int userId=1;
            while (rs.next()) {
                userId=rs.getInt("userId");
            }
            String sqls="insert into Comments(momentId,userId,commentswords) values("+momentId+","+userId+",'"+commentswords+"')";
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

    public boolean undoLike(String momentId,String username){
        boolean flag = false;
        try {
            try{
                DBconnect.init();
            }catch (Exception e){
                e.printStackTrace();
            }
            ResultSet rs = DBconnect.selectSql("select userId from Users where username='"+username+"'");
            int userId=1;
            while (rs.next()) {
                userId=rs.getInt("userId");
            }
            rs = DBconnect.selectSql("select likeNum from Moments where momentId='"+momentId+"'");
            int likeNUm=1;
            while (rs.next()) {
                likeNUm=rs.getInt("likeNum")-1;
            }
            if(likeNUm<0){
                likeNUm=0;
            }
            String sqls="delete from LikeList where momentId="+momentId+" and userId="+userId;
            int i = DBconnect.addUpdateDelete(sqls);
            if (i > 0) {
                flag = true;
            }
            if (flag) {
                DBconnect.addUpdateDelete("UPDATE Moments set likeNum="+likeNUm+" WHERE momentId="+momentId);
            }
            DBconnect.closeConn();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }
    public List<User> getaLikeList(String momentId){
        List<User> list = new ArrayList<>();
        try {
            try{
                DBconnect.init();
            }catch (Exception e){
                e.printStackTrace();
            }
            String sql1="select Users.* from LikeList,Users where LikeList.momentId="+ momentId +" " +
                    "and Users.userId=LikeList.userId;";
            ResultSet rs = DBconnect.selectSql(sql1);
            while (rs.next()) {
                User user=new User();
                user.setusername(rs.getString("username"));
                list.add(user);
            }
            DBconnect.closeConn();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    public List<Comments> getCommentList(String momentId){
        List<Comments> list = new ArrayList<>();
        try {
            try{
                DBconnect.init();
            }catch (Exception e){
                e.printStackTrace();
            }
            String sql1="select Users.*,Comments.commentswords from Comments,Users where Comments.momentId="+ momentId +" " +
                    "and Users.userId=Comments.userId;";
            ResultSet rs = DBconnect.selectSql(sql1);
            while (rs.next()) {
                Comments cmt=new Comments();
                cmt.setcommentsword(rs.getString("commentswords"));
                cmt.setUsername(rs.getString("username"));
                list.add(cmt);
            }
            DBconnect.closeConn();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    public boolean addQuestionReview(QuestionReview q){
        boolean flag = false;
        try{
            DBconnect.init();
        }catch (Exception e){
            e.printStackTrace();
        }
        String sqls="insert into Question_review(name,mail,title,question) values("+q.getName()+","+q.getEmil()+",'"+q.getTitle()+",'"+q.getWords()+"')";
        int i = DBconnect.addUpdateDelete(sqls);
        if (i > 0) {
            flag = true;
        }
        DBconnect.closeConn();
        return flag;
    }
}
