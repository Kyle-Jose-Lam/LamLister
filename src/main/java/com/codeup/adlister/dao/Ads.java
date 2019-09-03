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
    Ad findById(long id);
    List<Ad> findAdsByUser(User user);
    void deleteAd(int id);

    Ad showAd(long adId);
    Ad findAdById(Long id);
    Ad findRecentAd(User user);
    void updateAds(Long id, String editTitle, String editDescription);
}
