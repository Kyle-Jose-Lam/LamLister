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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        User userCache = (User) request.getSession().getAttribute("failed");

        try {
            request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
            response.sendRedirect("/error");
        }

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String password = request.getParameter("password");
        String passwordConfirmation = request.getParameter("confirm_password");
        String photo = request.getParameter("file");
        // validate input
        boolean inputHasErrors =
               username.isEmpty()
            || email.isEmpty()
            || name.isEmpty()
            || address.isEmpty()
            || password.isEmpty()
            || photo.isEmpty()
            || (! password.equals(passwordConfirmation))
            || (DaoFactory.getUsersDao().findByUsername(username) != null);

        if (inputHasErrors) {
            String error = "Please make sure the following forms are properly filled out: ";
            if(username.isEmpty()){
                error += "Username, ";
            }
            if(email.isEmpty()){
                error += "Email, ";
            }
            if(name.isEmpty()){
                error += "Full name, ";
            }
            if(address.isEmpty()){
                error += "Address, ";
            }
            if(password.isEmpty()){
                error += "Password, ";
            }
            if(photo.isEmpty()){
                error += "Photo, ";
            }
            error = error.substring(0,error.length()-2)+".";
            if(! password.equals(passwordConfirmation)){
                error += "<br>Passwords do not match.";
            }
            if(DaoFactory.getUsersDao().findByUsername(username) != null){
                error += "<br>Username is already taken.";
                username = null;
            }
            User user = new User(username, email, name, address);
            request.getSession().setAttribute("failed",user);
            request.getSession().setAttribute("error",error);
            response.sendRedirect("/register");
            return;
        }
        String hash = BCrypt.hashpw(password, BCrypt.gensalt());
        request.getSession().setAttribute("failed", null);
        User user = new User(username, email, hash, name, address, photo);
        DaoFactory.getUsersDao().insert(user);
        response.sendRedirect("/login");
    }
}
