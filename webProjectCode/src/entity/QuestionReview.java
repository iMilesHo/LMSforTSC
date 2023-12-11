package entity;

public class QuestionReview {
    private int id;
    private String name;
    private String emil;
    private String title;
    private String words;

    public void setName(String n){
        this.name=n;
    }
    public void setEmil(String n){
        this.emil=n;
    }
    public void setTitle(String n){
        this.title=n;
    }
    public void setWords(String n){
        this.words=n;
    }

    public String getName(){return name;}
    public String getEmil(){return emil;}
    public String getTitle(){return title;}
    public String getWords(){return words;}
}
