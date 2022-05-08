package forum.comment;

import exceptions.InvalidLength;
import working.structure.Report;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "comment")
public class Comment {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  protected int id;
  protected int id_user;
  protected int id_post;
  protected String date;
  protected String content;
  protected int numberReacts;

  public Comment(int id, int id_user, int id_post, String date, String content) {
    this.id = id;
    this.id_user = id_user;
    this.id_post = id_post;
    this.date = date;
    this.content = content;
    this.numberReacts = 0;
  }

  public Comment(){

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

  public int getId() {
    return id;
  }
  public void setId(int id) {
    this.id = id;
  }

  public String getDate() {
    return date;
  }

  public void setDate(String date) {
    this.date = date;
  }

  public int getNumberReacts() {
    return numberReacts;
  }

  public void setNumberReacts(int numberReacts) {
    this.numberReacts = numberReacts;
  }

  public int getId_post() {
    return id_post;
  }

  public int getId_user() {
    return id_user;
  }

  public void setId_post(int id_post) {
    this.id_post = id_post;
  }

  public void setId_user(int id_user) {
    this.id_user = id_user;
  }
}