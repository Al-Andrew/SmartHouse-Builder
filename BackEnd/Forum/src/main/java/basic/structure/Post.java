package basic.structure;


import basic.structure.exceptions.InvalidLength;

import java.util.ArrayList;
import java.util.List;

public abstract class Post {

  //limita de caractere: 10_000 la post-uri
  protected String content;
  protected String title;
  protected String author;
  //alegi intre String si LocalTime -> de intrebat
  protected String date;

  List<Comment> comments = new ArrayList<>();
  List<Report> reports = new ArrayList<>();

  public Post(String content, String title, String author, String date) {
    this.content = content;
    this.title = title;
    this.author = author;
    this.date = date;
  }

  public boolean modifyContent(String newPostContent) {
    //TODO: modificam in baza de date contentul post-ului
    if (newPostContent.length() >= 10_000) throw new InvalidLength();
    content = newPostContent;
    return true;
  }
  public boolean deletePostDB(){
    //TODO: stergem din baza de date postul
    return false;
  }

  public boolean addComent(Comment comment) {
    //TODO: adaugam un comment in baza de date
    this.comments.add(comment);
    return true;
  }

  public boolean addReport(Report report) {
    //TODO: Oadaugam un report in baza de date
    this.reports.add(report);
    return true;
  }

  public String getContent() {
    return content;
  }

  public String getTitle() {
    return title;
  }

  public String getAuthor() {
    return author;
  }

  public String getDate() {
    return date;
  }

  public List<Comment> getComments() {
    return comments;
  }

  public List<Report> getReports() {
    return reports;
  }
}