package app.service.message;

import app.entity.CustomUser;
import app.entity.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

public class MessageServiceImpl implements MessageService{
    @Autowired
    MessageRepository massageRepository;

    @Override
    @Transactional(readOnly = true)
    public List<Message> getMessageAll() {
        return massageRepository.findAllSort();
    }

    @Override
    @Transactional(readOnly = true)
    public List<Message> getMessageByUser(CustomUser customUser) {
        return massageRepository.findByCustomUser(customUser);
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
