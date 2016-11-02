package app.entity.enums;

public enum UserRole {
    ADMIN, MANAGER, USER, NOT_ACTIVATED_USER;

    @Override
    public String toString() {
        return "ROLE_" + name();
    }
}
