package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;

import java.util.List;

public interface Ads {
    List<Ad> all();
    Long insert(Ad ad);
    Ad findById(long id);
    List<Ad> findAdsByUser(User user);
    void deleteAd(int id);
    Ad showAd(long adId);
    Ad findAdById(Long id);
    Ad findRecentAd(User user);
    void updateAds(Ad ad);

}
