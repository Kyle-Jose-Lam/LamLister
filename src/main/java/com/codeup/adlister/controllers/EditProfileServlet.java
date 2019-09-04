package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;
import org.mindrot.jbcrypt.BCrypt;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet(name = "controllers.UpdateServlet", urlPatterns = "/updateProfile")
public class EditProfileServlet  extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        User user = (User) request.getSession().getAttribute("user");
        request.setAttribute("user", user);
        try {
            request.getRequestDispatcher("/WEB-INF/editUser.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
            response.sendRedirect("/error");
        }

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        User user = (User) request.getSession().getAttribute("user");

        String username = request.getParameter("username");
        String email = request.getParameter("email");

        User updatedUser = new User(
                username,
                email,
                user.getId()
        );

        DaoFactory.getUsersDao().updateProfile(updatedUser);
        user.setUsername(updatedUser.getUsername());
        request.setAttribute("user", user);
        try {
            request.getRequestDispatcher("WEB-INF/profile.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
            response.sendRedirect("/error");
        }
    }
}