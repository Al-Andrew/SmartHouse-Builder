package forum.post;

import forum.exceptions.InvalidLength;
import working.structure.Comment;
import working.structure.Report;

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
  protected String typePost;
  protected String title;
  protected String date;
  protected String content;

  @Transient
  protected String author;
  //alegi intre String si LocalTime -> de intrebat


  @Transient
  List<Comment> comments = new ArrayList<>();
  @Transient
  List<Report> reports = new ArrayList<>();

  public Post(int id, String content, String title, String author, String date) {
    this.id = id;
    this.content = content;
    this.title = title;
    this.author = author;
    this.date = date;
  }

  public Post() {

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

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public void setContent(String content) {
    this.content = content;
  }
}