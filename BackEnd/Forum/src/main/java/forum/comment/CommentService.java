package forum.comment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class CommentService {
    private final CommentRepository commentRepository;

    @Autowired
    public CommentService(CommentRepository commentRepository) {
        this.commentRepository = commentRepository;
    }

    public Optional<Comment> getComment(Integer commentId){
        boolean exists = commentRepository.existsById(commentId);
        if(!exists){
            throw new IllegalStateException("Comment with id " + commentId + "does not exists!");
        }
        return commentRepository.findCommentById(commentId);
    }
    public void addNewComment(Comment comment) {
        Optional<Comment> userOptional= commentRepository.findCommentById(comment.getId());
        if(userOptional.isPresent())
            throw new IllegalStateException("Comment already send!");
        commentRepository.save(comment);
    }

    public void deleteComment(Integer commentId) {
        Optional<Comment> userOptional= commentRepository.findCommentById(commentId);
        if(!userOptional.isPresent())
            throw new IllegalStateException("Comment with id "+commentId+" does not exist!");
        commentRepository.deleteById(commentId);
    }
    public void updateComment(Comment comment) {
        commentRepository.findById(comment.getId()).map(comment1 ->
        {
            comment1.setId(comment.getId());
            comment1.setDate(comment.getDate());
            comment1.setContent(comment.getContent());
            comment1.setNumberReacts(comment.getNumberReacts());
            return commentRepository.save(comment1);
        });
    }
}
