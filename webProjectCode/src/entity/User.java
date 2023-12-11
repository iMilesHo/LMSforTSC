package entity;

public class User {
    private int userId;
    private String username;
    private String password;
    private String birthday;
    private String headUrl;
    private String field;
    private String degree;
    private String school;

    public User(int userId, String username, String password, String birthday, String headUrl, String field, String degree) {
        this.userId=userId;
        this.username=username;
        this.password=password;
        this.birthday=birthday;
        this.headUrl=headUrl;
        this.field=field;
        this.degree=degree;
    }

    public User() {

    }

    //get
    public int getuserId() {
        return userId;
    }
    public String getusername() {
        return username;
    }
    public String getpassword() {
        return password;
    }
    public String getbirthday() {
        return birthday;
    }
    public String getheadUrl() {
        return headUrl;
    }
    public String getfield() {
        return field;
    }
    public String getdegree() {
        return degree;
    }
    public String getSchool(){return school;}
    //set
    public void setuserId(int id) {
        this.userId=id;
    }
    public void setusername(String un) {
        this.username=un;
    }
    public void setpassword(String pw) {
        this.password=pw;
    }
    public void setbirthday(String bd) {
        this.birthday=bd;
    }
    public void setheadUrl(String hu) {
        this.headUrl=hu;
    }
    public void setfield(String f) {
        this.field=f;
    }
    public void setdegree(String d) {
        this.degree=d;
    }
    public void setschool(String s){
        this.school=s;
    }
}
