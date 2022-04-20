package basic.structure;


public class Tag {

  //TODO: care cautare e mai eficienta: cauti in java sau in baza de date?
  private final String nameTag;
  public Tag(String nameTag) {
    this.nameTag = nameTag;
  }
  public String getNameTag() {
    return nameTag;
  }
}