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
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        int adId = Integer.parseInt(request.getParameter("button"));
//
//        request.setAttribute("ads", DaoFactory.getAdsDao().da(adId));
//        User user = DaoFactory.getUsersDao().findUserByAdId(adId);
//        request.setAttribute("user", user);
//        }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        int adId = Integer.parseInt(request.getParameter("button"));

        request.setAttribute("ads", DaoFactory.getAdsDao().da(adId));
        User user = DaoFactory.getUsersDao().findUserByAdId(adId);
        request.setAttribute("user", user);
    }
}