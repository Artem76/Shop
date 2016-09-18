package app.service.message;

import app.entity.CustomUser;
import app.entity.Message;

import java.util.List;

public interface MessageService {
    List<Message> getMessageAll();
    List<Message> getMessageByUser(CustomUser customUser);
    void addMessage(Message message);
    void deleteMessage(Message message);
}
