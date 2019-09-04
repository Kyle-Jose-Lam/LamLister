package com.codeup.adlister.models;

public class Ad {
    private long id;
    private long userId;
    private String title;
    private String description;
    private String photo;

    public Ad(long id, long userId, String title, String description, String photo) {
        this.id = id;
        this.userId = userId;
        this.title = title;
        this.description = description;
        this.photo = photo;
    }

    public Ad(long userId, String title, String description, String photo) {
        this.userId = userId;
        this.title = title;
        this.description = description;
        this.photo = photo;
    }
    public Ad( String title, String description) {
        this.title = title;
        this.description = description;
    }
    // Updating ads constructor
    public Ad(String title, String description, Long id) {
        this.title = title;
        this.description = description;
        this.id = id;
    }

    public long getId() {
        return this.id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getUserId() { return this.userId; }

    public void setUserId(long userId) {
        this.userId = userId;
    }

    public String getTitle() {
        return this.title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return this.description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPhoto() { return this.photo; }

    public void setPhoto(String photo) { this.photo = photo; }

}
