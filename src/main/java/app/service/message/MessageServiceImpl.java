package app.service.message;

import app.entity.CustomUser;
import app.entity.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

@Service
public class MessageServiceImpl implements MessageService{
    @Autowired
    private MessageRepository massageRepository;

    @Override
    @Transactional(readOnly = true)
    public List<Message> getMessageAllSort() {
        return massageRepository.findAllSort();
    }

    @Override
    @Transactional(readOnly = true)
    public List<Message> getMessageByUserSort(CustomUser customUser) {
        return massageRepository.findByUserSort(customUser);
    }

    @Override
    public Message detOne(long id) {
        return massageRepository.findOne(id);
    }

    @Override
    @Transactional
    public void addMessage(Message message) {
        message.setDate(new Date(System.currentTimeMillis()));
        massageRepository.save(message);
    }

    @Override
    public void updateMessage(Message message) {
        massageRepository.save(message);
    }

    @Override
    @Transactional
    public void deleteMessage(Message message) {
        massageRepository.delete(message);
    }
}
