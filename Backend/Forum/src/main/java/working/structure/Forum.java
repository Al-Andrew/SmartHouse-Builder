package working.structure;

import exceptions.IllegalAddingPost;
import backend.post.Post;

import java.util.ArrayList;
import java.util.List;

public class Forum {

  List<Post> posts = new ArrayList<>();

  private boolean isLogged;

  public Forum(){
    //TODO: selectezi in baza de date primele 100 de posturi si le afisezi;
  }
  public boolean addPost(Post post) {
    if (!isLogged) throw new IllegalAddingPost();
    posts.add(post);
    return true;
  }

  public boolean isLogged() {
    return isLogged;
  }
}