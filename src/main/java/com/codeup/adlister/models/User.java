package com.codeup.adlister.models;

import com.codeup.adlister.util.Password;

public class User {
    private long id;
    private String username;
    private String email;
    private String password;
    private String full_name;
    private String address;
    private String photo;

    public User() {}

    public User(long id, String username, String email, String password, String name, String address, String photo) {
        this.id = id;
        this.username = username;
        this.email = email;
        this.password = password;
        this.full_name = name;
        this.address = address;
        this.photo = photo;
    }
    public User(String username, String email, String password, String name, String address, String photo) {
        this.username = username;
        this.email = email;
        this.password = password;
        this.full_name = name;
        this.address = address;
        this.photo = photo;
    }

    public User(String username, String email, String name, String address, String photo) {
        this.username = username;
        this.email = email;
        this.full_name = name;
        this.address = address;
        this.photo = photo;
    }

    public User(long id, String username, String email, String password) {
    }

    public User(String username, String email, long id) {
        this.username = username;
        this.email = email;
        this.id = id;
    }


    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = Password.hash(password);
    }

    public String getFull_name() { return full_name; }

    public void setFull_name(String full_name) { this.full_name = full_name; }

    public String getAddress() { return address; }

    public void setAddress(String address) { this.address = address; }

    public String getPhoto() { return this.photo; }

    public void setPhoto(String photo) { this.photo = photo; }

}