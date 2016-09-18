package app.service.message;

import app.entity.CustomUser;
import app.entity.Message;

import java.util.List;

public interface MessageService {
    List<Message> getMessageAllSort();
    List<Message> getMessageByUserSort(CustomUser customUser);
    void addMessage(Message message);
    void deleteMessage(Message message);
}
