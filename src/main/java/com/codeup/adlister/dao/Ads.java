package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;

import java.util.List;

public interface Ads {
    // get a list of all the ads
    List<Ad> all();
    // insert a new ad and return the new ad's id
    Long insert(Ad ad);
    List<Ad> da(int id);
    List<Ad> findbyid(int id);
    List<Ad> findAdsByUser(User user);
    void deleteAd(int id);

    Ad showAd(long adId);

    void updateAds(Long id, String editedTitle, String editedDescription);
}
