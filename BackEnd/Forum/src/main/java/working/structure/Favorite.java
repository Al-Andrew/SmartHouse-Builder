package working.structure;

import exceptions.InvalidFavoritePost;
import forum.comment.Comment;

import java.util.ArrayList;
import java.util.List;

public class Favorite {

  //TODO: List sau Map? (Nu conteaza)
  List<Comment> comments = new ArrayList<>();

  private boolean isLogged;

  public Favorite() {
    //TODO: cautam in baza de date toate post-urile care sunt favorite si le adaugam (in cazul in care user-ul s-a deconectat)

  }
  public boolean addPost(Comment comment) {
    //TODO: Adaugam in baza de date ID-ul postului si al user-ului
    if (comments.contains(comment)) throw new InvalidFavoritePost();
    comments.add(comment);
    return true;
  }
  public boolean isLogged() {
    //in baza de date va fi o variabila ce va retine daca user-ul va fi logat sau nu
    return isLogged;
  }
}