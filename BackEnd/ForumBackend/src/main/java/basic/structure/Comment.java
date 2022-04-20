package basic.structure;

import java.util.Vector;

public class Comment {

  private final String author;

  //alegi intre LocalTime si String
  private final String date;

  private String content;
  //avem numai like-uri 👍
  private int numberReacts;

  public Comment(String content, String author, String date) {
    this.content = content;
    this.author = author;
    this.date = date;
    this.numberReacts = 0;
  }
  public void userAddReact() {
      //TODO: setam in baza de date ca user-ul a dat react
      numberReacts++;
  }
  public void userRemoveReact(){
    //TODO: setam in baza de date ca user-ul si-a schimbat opinia (trebuie verificat daca a dat like)
    numberReacts--;
  }
  public String getContent() {
    return content;
  }
  public void setContent(String content) {
    this.content = content;
  }
  public String getAuthor() {
    return author;
  }
  public String getDate() {
    return date;
  }

  public int getNumberReacts() {
    return numberReacts;
  }

}