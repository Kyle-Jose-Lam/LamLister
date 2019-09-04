package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.UpdateAdServlet", urlPatterns = "/ads/updateAd")
public class EditAdsServlet extends HttpServlet {
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
            String title = request.getParameter("editedTitle");
            String description = request.getParameter("editedDescription");
            Long id = Long.parseLong(request.getParameter("adId"));

            Ad ad = new Ad(
                    title,
                    description,
                    id
            );
            DaoFactory.getAdsDao().updateAds(ad);
            try {
                request.getRequestDispatcher("/WEB-INF/profile.jsp").forward(request, response);
            } catch (ServletException e) {
                e.printStackTrace();
                response.sendRedirect("/error");
            }
        }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {

        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("/login");
            return;
        }

        long adId = (long) Long.parseLong(request.getParameter("adId"));
        System.out.println(adId);
        Ad ad = DaoFactory.getAdsDao().findAdById(adId);
        System.out.println(ad);
        request.setAttribute("ad", ad);
        try {
            request.getRequestDispatcher("/WEB-INF/ads/editAd.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
            response.sendRedirect("/error");
        }
    }
}


