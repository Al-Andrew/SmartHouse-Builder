package com.smarthousebuilder.forum.report;




import forum.exceptions.InvalidLength;

import javax.persistence.*;

@Entity
@Table(name = "report")
public class Report {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  //limita de caractere: 1_000
  protected int id;
  protected int id_post;
  protected int id_author;
  protected String title;
  protected String motivation;
  protected String date;



  public Report(int id,int id_post,int id_author,String title, String motivation, String date) {
    this.id=id;
    this.id_post=id_post;
    this.id_author=id_author;
    this.title = title;
    this.motivation = motivation;
    this.date = date;
  }

  public Report() {

  }

  public boolean modifyMotivation(String motivation){
    //TODO: modificam in baza de date noul report
    if (motivation.length() > 1000) throw new InvalidLength();
    this.motivation = motivation;
    return true;
  }
  public String getTitle() {
    return title;
  }
  public String getDate() {
    return date;
  }
  public String getMotivation() {
    return motivation;
  }

  public int getId() {
    return id;
  }

  public int getId_post() {
    return id_post;
  }

  public int getId_author() {
    return id_author;
  }
}