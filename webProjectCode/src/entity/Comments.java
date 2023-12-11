package entity;

public class Comments {
    private int commentId;
    private int userId;
    private String commentsword;
    private int momentId;
    private String havacomment;
    private String username;

    public int getcommentId(){
        return commentId;
    }
    public void setcommentId(int ci){
        this.commentId=ci;
    }

    public int getuserId(){
        return userId;
    }
    public void setuserId(int ui){
        this.userId=ui;
    }

    public String getcommentsword(){
        return commentsword;
    }
    public void setcommentsword(String cw){
        this.commentsword=cw;
    }

    public int getmomentId(){
        return momentId;
    }
    public void setmomentId(int mi){
        this.momentId=mi;
    }

    public String gethavacomment(){
        return havacomment;
    }
    public void sethavacomment(String havacomment){
        this.havacomment=havacomment;
    }

    public String getUsername(){
        return username;
    }
    public void setUsername(String username){
        this.username=username;
    }
}
