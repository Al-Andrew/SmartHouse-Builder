package basic.structure;

import basic.structure.exceptions.InvalidFavoritePost;

import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

public class Favorite {

  //TODO: List sau Map?
  List<Post> posts = new ArrayList<>();

  private boolean isLogged;

  public Favorite() {
    //TODO: cautam in baza de date toate post-urile care sunt favorite si le adaugam (in cazul in care user-ul s-a deconectat)

  }
  public boolean addPost(Post post) {
    //TODO: Adaugam in baza de date ID-ul postului si al user-ului
    if (posts.contains(post)) throw new InvalidFavoritePost();
    posts.add(post);
    return true;
  }
  public boolean isLogged() {
    //in baza de date va fi o variabila ce va retine daca user-ul va fi logat sau nu
    return isLogged;
  }
}