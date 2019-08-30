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

@WebServlet(name = "controllers.RegisterServlet", urlPatterns = "/register")
public class RegisterServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User userCache =(User) request.getSession().getAttribute("failed");
//        if(userCache != null) {
//            response.s
//        }
        request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String password = request.getParameter("password");
        String passwordConfirmation = request.getParameter("confirm_password");

        // validate input
        boolean inputHasErrors =
               username.isEmpty()
            || email.isEmpty()
            || name.isEmpty()
            || address.isEmpty()
            || password.isEmpty()
            || (! password.equals(passwordConfirmation));

        if (inputHasErrors) {
            User user = new User(username, email, name, address);
            request.getSession().setAttribute("failed",user);
            response.sendRedirect("/register");
            return;
        }
        String hash = BCrypt.hashpw(password, BCrypt.gensalt());
        // create and save a new user
        User user = new User(username, email, hash, name, address);
        DaoFactory.getUsersDao().insert(user);
        response.sendRedirect("/login");
    }
}
