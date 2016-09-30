package app.entity.enums;

public enum UserRole {
    ADMIN, MANAGER, USER;

    @Override
    public String toString() {
        return "ROLE_" + name();
    }
}
