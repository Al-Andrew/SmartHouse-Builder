package com.smarthousebuilder.forum.comment;


import javax.persistence.*;


@Entity
@Table(name = "comment")
public class Comment {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "id")
  protected int id;
  @Column(name = "id_user")
  protected int id_user;
  @Column(name = "id_post")
  protected int id_post;
  @Column(name = "posted_date")
  protected String date;
  @Column(name = "content")
  protected String content;
  @Column(name = "number_reacts")
  protected int numberReacts;

  public Comment(int id_user, int id_post, String date, String content, int numberReacts) {
    this.id_user = id_user;
    this.id_post = id_post;
    this.date = date;
    this.content = content;
    this.numberReacts = numberReacts;
  }

  public Comment(){

  }

  @Override
  public String toString() {
    return "Comment{" +
            "id=" + id +
            ", id_user=" + id_user +
            ", id_post=" + id_post +
            ", date='" + date + '\'' +
            ", content='" + content + '\'' +
            ", numberReacts=" + numberReacts +
            '}';
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