package app.service.message;

import app.entity.CustomUser;
import app.entity.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

public class MessageServiceImpl implements MessageService{
    @Autowired
    MessageRepository massageRepository;
    @Override
    @Transactional(readOnly = true)
    public List<Message> getMessageAll() {
        List<Message> messages = new ArrayList<>();
        messages = massageRepository.findAll();
        Collections.sort(messages,(a,b) -> b.getDate().compareTo(a.getDate()));
        return messages;
    }

    @Override
    @Transactional(readOnly = true)
    public List<Message> getMessageByUser(CustomUser customUser) {
        List<Message> messages = new ArrayList<>();
        messages = massageRepository.findAll();
        for (Message message: messages){
            if(!message.getUser().equals(customUser)) messages.remove(message);
        }
        Collections.sort(messages,(a,b) -> b.getDate().compareTo(a.getDate()));
        return messages;
    }

    @Override
    @Transactional
    public void addMessage(Message message) {
        message.setDate(new Date(System.currentTimeMillis()));
        massageRepository.save(message);
    }

    @Override
    @Transactional
    public void deleteMessage(Message message) {
        massageRepository.delete(message);
    }
}
