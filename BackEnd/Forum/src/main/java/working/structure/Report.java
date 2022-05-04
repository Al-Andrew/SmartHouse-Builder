package working.structure;


import exceptions.InvalidLength;

public class Report {

  //limita de caractere: 1_000
  private final String title;
  private final String author;
  private final String date;
  private String motivation;

  public Report(String title, String author, String motivation, String date) {
    this.title = title;
    this.author = author;
    this.motivation = motivation;
    this.date = date;
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
  public String getAuthor() {
    return author;
  }
  public String getDate() {
    return date;
  }
  public String getMotivation() {
    return motivation;
  }
}