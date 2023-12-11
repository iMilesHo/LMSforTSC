package entity;

import java.util.List;

public class Moments {
    private int momentId;
    private int userId;
    private String username;
    private String momentTime;
    private String momentWord;
    private String pictureUrl;
    private int havePicture;
    private String momentAddr;
    private String headUrl;
    private int likeNum;
    private List<User> useroflikeList;
    private List<Comments> commentsList;

    public int getmomentId() {
        return momentId;
    }
    public void setmomentId(int mi) {
        this.momentId=mi;
    }

    public int getuserId() {
        return userId;
    }
    public void setuserId(int ui) {
        this.userId=ui;
    }

    public String getmomentTime() {
        return momentTime;
    }
    public void setmomentTime(String mt) {
        this.momentTime=mt;
    }

    public String getmomentWord() {
        return momentWord;
    }
    public void setmomentWord(String mw) {
        this.momentWord=mw;
    }

    public String getpictureUrl() {
        return pictureUrl;
    }
    public void setpictureUrl(String pu) {
        this.pictureUrl=pu;
    }

    public int gethavePicture() {
        return havePicture;
    }
    public void sethavePicture(int hp) {
        this.havePicture=hp;
    }

    public String getmomentAddr() {
        return momentAddr;
    }
    public void setmomentAddr(String momentAddr) {
        this.momentAddr=momentAddr;
    }

    public String getUsername() {
        return username;
    }
    public void setUsername(String un) {
        this.username=un;
    }

    public String getheadUrl() {
        return headUrl;
    }
    public void setheadUrl(String hu) {
        this.headUrl=hu;
    }

    public int getlikeNum() {
        return likeNum;
    }
    public void setlikeNum(int ln) {
        this.likeNum=ln;
    }

    public List<User> getUseroflikeList(){
        return useroflikeList;
    }
    public void setUseroflikeList(List<User> ul){
        this.useroflikeList=ul;
    }

    public List<Comments> getCommentlist(){
        return commentsList;
    }
    public void setCommentlist(List<Comments> cmt){
        this.commentsList=cmt;
    }

}
