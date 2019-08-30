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

}

