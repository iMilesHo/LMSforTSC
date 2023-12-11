package dao;

import entity.*;

import java.util.List;

public interface ProcedureDao {
    public boolean deliverMoments(Moments mmt,String name);//
    public boolean sentMessages(Messages m,String name);
    public List<Moments> getMomentsAllofMine(String name);
    public List<Messages> getMessagesAllofMine_sent(String name);
    public List<Messages> getMessagesAllofMine_copy(String name);
    public User getUserInfor(String name);
    public boolean addLikelist(String momentId,String username);
    public boolean addComments(String momentId,String username,String commentswords);
    public boolean undoLike(String momentId,String username);
    public List<User> getaLikeList(String momentId);
    public List<Comments> getCommentList(String momentId);
    public boolean addQuestionReview(QuestionReview q);
}
