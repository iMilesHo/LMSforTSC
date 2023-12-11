package entity;

public class Papers {
    private int paperId;
    private String titel;
    private String data;
    private String task;
    private String model;
    private String authors;
    private String journal;
    private String volume;
    private String pages;
    private String year;
    private String publisher;
    private String keywords;
    private String abstrts;

    public Papers(int paperId, String titel, String data,String task,String model,String authors, String journal, String volume, String pages, String year, String publisher, String keywords, String myabstracts) {
        this.paperId=paperId;
        this.titel=titel;
        this.data=data;
        this.task=task;
        this.model=model;
        this.authors=authors;
        this.journal=journal;
        this.volume=volume;
        this.pages=pages;
        this.year=year;
        this.publisher=publisher;
        this.keywords=keywords;
        this.abstrts=myabstracts;
    }
    public Papers(){

    }

    public int getpaperId() {
        return paperId;
    }
    public void setpaperId(int pi) {
        this.paperId=pi;
    }

    public String gettitel() {
        return titel;
    }
    public void settitel(String t) {
        this.titel=t;
    }

    public String getData() {
        return data;
    }
    public void setData(String d) {
        this.data=d;
    }

    public String getTask() {
        return task;
    }
    public void setTask(String t) {
        this.task=t;
    }

    public String getModel() {
        return model;
    }
    public void setModel(String m) {
        this.model=m;
    }

    public String getauthors() {
        return authors;
    }
    public void setauthors(String a) {
        this.authors=a;
    }

    public String getjournal() {
        return journal;
    }
    public void setjournal(String j) {
        this.journal=j;
    }

    public String getvolume() {
        return volume;
    }
    public void setvolume(String v) {
        this.volume=v;
    }

    public String getpages() {
        return pages;
    }
    public void setpages(String p) {
        this.pages=p;
    }

    public String getyear() {
        return year;
    }
    public void setyear(String y) {
        this.year=y;
    }

    public String getpublisher() {
        return publisher;
    }
    public void setpublisher(String pr) {
        this.publisher=pr;
    }

    public String getkeywords() {
        return keywords;
    }
    public void setkeywords(String kw) {
        this.keywords=kw;
    }

    public String getabstrts() {
        return abstrts;
    }
    public void setabstrts(String ab) {
        this.abstrts=ab;
    }
}
