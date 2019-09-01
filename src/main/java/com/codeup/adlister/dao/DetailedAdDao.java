package com.codeup.adlister.dao;

import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class DetailedAdDao {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("ads", DaoFactory.getAdsDao().da(1));
        request.getRequestDispatcher("/WEB-INF/ads/DetailedAd.jsp").forward(request, response);
    }




    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        int adId = Integer.parseInt(request.getParameter("button"));

        request.setAttribute("ads", DaoFactory.getAdsDao().da(adId));
        User user = DaoFactory.getUsersDao().findUserByAdId(adId);
        request.setAttribute("user", user);

        request.getRequestDispatcher("/WEB-INF/ads/DetailedAd.jsp").forward(request, response);

    }
}