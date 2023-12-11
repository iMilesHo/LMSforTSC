package entity;

public class Messages {
    private int messageId;
    private int fomUserId;
    private int toUserId;
    private String fromusername;
    private String tousername;
    private String messageTime;
    private String messageWord;
    private String pictureUrl;
    private int havePicture;
    private String headUrl;

    public int getmessageId() {
        return messageId;
    }
    public void setmessageId(int mi) {
        this.messageId=mi;
    }

    public int getfomUserId() {
        return fomUserId;
    }
    public void setfomUserId(int ui) {
        this.fomUserId=ui;
    }

    public int gettoUserId() {
        return toUserId;
    }
    public void settoUserId(int ui) {
        this.toUserId=ui;
    }

    public String getmessageTime() {
        return messageTime;
    }
    public void setmessageTime(String mt) {
        this.messageTime=mt;
    }

    public String getmessageWord() {
        return messageWord;
    }
    public void setmessageWord(String mw) {
        this.messageWord=mw;
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

    public String getfromusername() {
        return fromusername;
    }
    public void setfromusername(String un) {
        this.fromusername=un;
    }

    public String gettousername() {
        return tousername;
    }
    public void settousername(String un) {
        this.tousername=un;
    }

    public String getheadUrl() {
        return headUrl;
    }
    public void setheadUrl(String hu) {
        this.headUrl=hu;
    }
}
