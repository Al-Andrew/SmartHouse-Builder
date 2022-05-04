package exceptions;

public class InvalidFavoritePost extends RuntimeException{
    public InvalidFavoritePost(){
        super("Deja il ai la favourite. Nu te supara frate 尗");
    }
}
