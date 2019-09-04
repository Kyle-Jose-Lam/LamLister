package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.Category;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.CreateAdServlet", urlPatterns = "/ads/create")
public class CreateAdServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("/login");
            return;
        }
        try {
            request.getRequestDispatcher("/WEB-INF/ads/create.jsp")
                .forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
            response.sendRedirect("/error");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        User user = (User) request.getSession().getAttribute("user");
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String category = request.getParameter("category");
        String photo = request.getParameter("file");
        boolean inputHasErrors = title.isEmpty() || description.isEmpty();
        String error= "Make sure the following forms are properly filled out: ";
        if(title.isEmpty()){
            error += "Title, ";
        }
        if(description.isEmpty()){
            error += "Description, ";
        }
        if(category.isEmpty()){
            error += "Category, ";
        }
        if(photo.isEmpty()){
            error += "Photo, ";
        }
        error = error.substring(0,error.length()-2)+".";
        request.getSession().setAttribute("error",error);

//        Category cat = new Category(user.getId(),category);
        if(inputHasErrors){
            Ad ad = new Ad(title,description);
            request.getSession().setAttribute("failed",ad);
            response.sendRedirect("/ads/create");
            return;
        }
        Ad ad = new Ad(user.getId(),title,description, photo);
        DaoFactory.getAdsDao().insert(ad);
        long adId = DaoFactory.getAdsDao().findRecentAd(user).getId();
        Category cat = new Category(adId,category);
        DaoFactory.getCategoriesDao().insert(cat);
        response.sendRedirect("/ads");
    }
}
