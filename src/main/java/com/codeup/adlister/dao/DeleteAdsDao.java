package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;

import java.util.List;

public abstract class DeleteAdsDao implements Ads{
    @Override
    public List<Ad> all() {
        return null;
    }

    @Override
    public Long insert(Ad ad) {
        return null;
    }

    @Override
    public List<Ad> da(int id) {
        return null;
    }

    @Override
    public List<Ad> findbyid(int id) {
        return null;
    }

    @Override
    public void deleteAd(int id) {

    }

}

