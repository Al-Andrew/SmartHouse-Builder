package basic.structure;

import basic.structure.exceptions.InvalidTag;

import java.util.ArrayList;
import java.util.List;

public class PostQuestion extends Post {

  public List<Tag> tags = new ArrayList<>();

  public PostQuestion(String content, String title, String author, String date) {
    super(content, title, author, date);
  }

  public boolean addTag(Tag tag) {
    if (tags.contains(tag)) throw new InvalidTag();
    return false;
  }

}