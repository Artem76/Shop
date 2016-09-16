package app.entity;

import javax.persistence.*;

@Entity
public class Message {
    @Id
    @GeneratedValue
    private long id;

    private String message;
    private Long time;

    @ManyToOne(fetch = FetchType.EAGER)
    private CustomUser user;

    public Message(String message, Long time, CustomUser user) {
        this.message = message;
        this.time = time;
        this.user = user;
    }

    public Message() { }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Long getTime() {
        return time;
    }

    public void setTime(Long time) {
        this.time = time;
    }
    public CustomUser getUser() {
        return user;
    }

    public void setUser(CustomUser user) {
        this.user = user;
    }
}
