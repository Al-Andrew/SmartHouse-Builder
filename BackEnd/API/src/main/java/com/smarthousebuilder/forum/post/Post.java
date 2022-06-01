package com.smarthousebuilder.forum.post;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.smarthousebuilder.forum.comment.Comment;
import com.smarthousebuilder.forum.report.Report;
import com.smarthousebuilder.forum.tag.Tag;
import forum.exceptions.InvalidLength;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Entity
@Table(name = "post")
@JsonIgnoreProperties(ignoreUnknown = true)
public class Post {

  //limita de caractere: 10_000 la post-uri
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  protected int id;
  @Column(name = "id_user")
  protected int id_user;
  @Column(name = "title")
  protected String title;

  @Column(name = "posted_date")
  protected String date;
  @Column(name = "content")
  protected String content;

  @Transient
  protected String author;
  //alegi intre String si LocalTime -> de intrebat


  @Transient
  List<Comment> comments = new ArrayList<>();
  @Transient
  List<Report> reports = new ArrayList<>();
  @Transient
  @JsonProperty("tags")
  Tag tag = new Tag();

  public Post(int id, int id_user,
              String title, String date, String content) {
    this.id = id;
    this.id_user = id_user;
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
            ", title='" + title + '\'' +
            ", date='" + date + '\'' +
            ", content='" + content + '\'' +
            ", author='" + author + '\'' +
            ", comments=" + comments +
            ", reports=" + reports +
            ", tag=" + tag +
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

  public Tag getTag() {
    return tag;
  }

  public void setTag(Tag tag) {
    this.tag = tag;
  }
}