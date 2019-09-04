package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.DetailedAdServlet", urlPatterns = "/da")
public class DetailedAdServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws  IOException {
        request.setAttribute("ads", DaoFactory.getAdsDao().showAd(1));
        try {
            request.getRequestDispatcher("/WEB-INF/ads/DetailedAd.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
            response.sendRedirect("/error");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        int adId = Integer.parseInt(request.getParameter("button"));

        request.setAttribute("ads", DaoFactory.getAdsDao().showAd(adId));
//        User user = DaoFactory.getUsersDao().findUserByAdId(adId);
//        request.setAttribute("user", user);

        try {
            request.getRequestDispatcher("/WEB-INF/ads/DetailedAd.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
            response.sendRedirect("/error");
        }

    }
}