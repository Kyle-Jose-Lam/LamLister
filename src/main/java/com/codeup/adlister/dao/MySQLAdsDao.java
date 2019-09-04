package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;
import com.mysql.cj.jdbc.Driver;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MySQLAdsDao implements Ads {
    private Connection connection = null;

    public MySQLAdsDao(Config config) {
        try {
            DriverManager.registerDriver(new Driver());
            connection = DriverManager.getConnection(
                config.getUrl(),
                config.getUsername(),
                config.getPassword()
            );
        } catch (SQLException e) {
            throw new RuntimeException("Error connecting to the database!", e);
        }
    }

    public List<Ad> findAdsByUser(User user) {
        String query = "SELECT * FROM ads WHERE user_id = ?";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setInt(1, (int)user.getId());
            ResultSet rs = stmt.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error finding a user", e);
        }
    }
    @Override
    public List<Ad> all() {
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement("SELECT * FROM ads");
            ResultSet rs = stmt.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all ads.", e);
        }
    }

    @Override
    public Long insert(Ad ad) {
        try {
            String insertQuery = "INSERT INTO ads(user_id, title, description) VALUES (?, ?, ?)";
            PreparedStatement stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
            stmt.setLong(1, ad.getUserId());
            stmt.setString(2, ad.getTitle());
            stmt.setString(3, ad.getDescription());
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
            return rs.getLong(1);
        } catch (SQLException e) {
            throw new RuntimeException("Error creating a new ad.", e);
        }
    }

    @Override
    public List<Ad> da(int id) {
        return null;
    }


    @Override
    public Ad findById(long id) {
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement("SELECT * FROM ads WHERE id="+id);
            ResultSet rs = stmt.executeQuery();
            return extractAd(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving ad.", e);
        }
    }

    @Override
    public void deleteAd(int id) {
        try {
            String insertQuery = "DELETE FROM ads WHERE id = ?";
            PreparedStatement stmt = connection.prepareStatement(insertQuery);
            stmt.setLong(1, id);
            stmt.executeUpdate();
        }catch (SQLException e){
            throw new RuntimeException("Error deleting ad", e);
        }
    }


    private Ad extractAd(ResultSet rs) throws SQLException {
        return new Ad(
            rs.getLong("id"),
            rs.getLong("user_id"),
            rs.getString("title"),
            rs.getString("description")
        );
    }

    private List<Ad> createAdsFromResults(ResultSet rs) throws SQLException {
        List<Ad> ads = new ArrayList<>();
        while (rs.next()) {
            ads.add(extractAd(rs));
        }
        return ads;
    }

    public Ad showAd (long id){
        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement("SELECT * FROM ads WHERE id = ?");
            statement.setLong(1, id);
            ResultSet rs = statement.executeQuery();
            rs.next();
            return extractAd(rs);
        } catch (SQLException e) {
            throw new RuntimeException("error loading ad",e);
        }
    }


    @Override
    public void updateAds(Ad ad) {
        try{
            String query = "UPDATE ads set title = ?, description = ? where id = ?";
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setString(1,ad.getTitle());
            stmt.setString(2,ad.getDescription());
            stmt.setLong(3,ad.getId());
            stmt.executeUpdate();
        }catch (SQLException e){
            throw new RuntimeException("Unable to edit ad, e");
        }
    }
    public Ad findRecentAd(User user) {
        try{
            String query = "SELECT * FROM ads WHERE user_id = ? ORDER BY id DESC Limit 1";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setLong(1,+ user.getId());
            ResultSet rs = ps.executeQuery();
            rs.next();
            return extractAd(rs);
        }catch (SQLException e){

            throw new RuntimeException("Not able to find ad, e");
        }
    }


    @Override
    public Ad findAdById(Long id) {
        String query = "Select * from ads where id = ?";
        try{
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setLong(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            rs.next();
            return extractAd(rs);
        }catch (SQLException e){
            throw new RuntimeException("Error finding a ad by title", e);
        }

    }
}



