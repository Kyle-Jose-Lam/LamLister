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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");
        request.setAttribute("user", user);
        request.getRequestDispatcher("/WEB-INF/updateProfile.jsp").forward(request,response);

    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");

        String password = req.getParameter("password");
        String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());

        User updatedUser = new User(
                user.getId(),
                req.getParameter("username"),
                req.getParameter("email"),
                hashedPassword

        );
        DaoFactory.getUsersDao().updateProfile(user);
        user.setUsername(updatedUser.getUsername());
        req.getRequestDispatcher("WEB-INF/login.jsp").forward(req, resp);
    }
}