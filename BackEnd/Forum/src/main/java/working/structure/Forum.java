package working.structure;

import exceptions.IllegalAddingPost;
import forum.comment.Comment;

import java.util.ArrayList;
import java.util.List;

public class Forum {

  List<Comment> comments = new ArrayList<>();

  private boolean isLogged;

  public Forum(){
    //TODO: selectezi in baza de date primele 100 de posturi si le afisezi;
  }
  public boolean addPost(Comment comment) {
    if (!isLogged) throw new IllegalAddingPost();
    comments.add(comment);
    return true;
  }

  public boolean isLogged() {
    return isLogged;
  }
}