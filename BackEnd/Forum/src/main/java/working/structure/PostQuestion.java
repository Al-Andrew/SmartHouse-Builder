package working.structure;

import forum.exceptions.InvalidTag;
import forum.post.Post;

import java.util.ArrayList;
import java.util.List;

public class PostQuestion extends Post {

  public List<Tag> tags = new ArrayList<>();

  public PostQuestion(int id, String content, String title, String author, String date) {
    super(id, content, title, author, date);
  }

  public boolean addTag(Tag tag) {
    if (tags.contains(tag)) throw new InvalidTag();
    return false;
  }

}