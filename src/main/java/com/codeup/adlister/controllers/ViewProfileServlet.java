package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.ViewProfileServlet", urlPatterns = "/profile")
public class ViewProfileServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        User user = (User) request.getSession().getAttribute("user");
        System.out.println(user.getPhoto());
        if (user == null) {
            response.sendRedirect("/login");
            return;
        }

        request.setAttribute("myads", DaoFactory.getAdsDao().findAdsByUser(user));
        try {
            request.getRequestDispatcher("/WEB-INF/profile.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
            response.sendRedirect("/error");
        }
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {



    }

}
