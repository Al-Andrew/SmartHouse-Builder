package exceptions;

public class InvalidTag extends RuntimeException{
    public InvalidTag(){
        super("E un tag invalid!");
    }
}
