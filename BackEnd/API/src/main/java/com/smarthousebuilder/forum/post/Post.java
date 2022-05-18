package com.smarthousebuilder.forum.post;

import com.smarthousebuilder.forum.comment.Comment;
import com.smarthousebuilder.forum.report.Report;
import forum.exceptions.InvalidLength;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "post")
public class Post {

  //limita de caractere: 10_000 la post-uri
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  protected int id;
  protected int id_user;
  @Column(name = "type")
  protected String typePost;
  protected String title;

  @Column(name = "posted_date")
  protected String date;
  protected String content;

  @Transient
  protected String author;
  //alegi intre String si LocalTime -> de intrebat


  @Transient
  List<Comment> comments = new ArrayList<>();
  @Transient
  List<Report> reports = new ArrayList<>();

  public Post(int id, int id_user, String typePost,
              String title, String date, String content) {
    this.id = id;
    this.id_user = id_user;
    this.typePost = typePost;
    this.title = title;
    this.date = date;
    this.content = content;
  }

  public Post() {

  }

  @Override
  public String toString() {
    return "Post{" +
            "id=" + id +
            ", id_user=" + id_user +
            ", typePost='" + typePost + '\'' +
            ", title='" + title + '\'' +
            ", date='" + date + '\'' +
            ", content='" + content + '\'' +
            ", author='" + author + '\'' +
            ", comments=" + comments +
            ", reports=" + reports +
            '}';
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

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public int getId_user() {
    return id_user;
  }

  public void setId_user(int id_user) {
    this.id_user = id_user;
  }

  public String getTypePost() {
    return typePost;
  }

  public void setTypePost(String typePost) {
    this.typePost = typePost;
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public String getDate() {
    return date;
  }

  public void setDate(String date) {
    this.date = date;
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

  public void setAuthor(String author) {
    this.author = author;
  }

  public List<Comment> getComments() {
    return comments;
  }

  public void setComments(List<Comment> comments) {
    this.comments = comments;
  }

  public List<Report> getReports() {
    return reports;
  }

  public void setReports(List<Report> reports) {
    this.reports = reports;
  }
}