package com.svalero.artmarket.servlet;

import com.svalero.artmarket.dao.Database;
import com.svalero.artmarket.dao.UserDao;
import com.svalero.artmarket.domain.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

import static com.svalero.artmarket.util.ErrorUtil.sendError;


@WebServlet("/login")
public class Login extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            Database.connect();
            User user = Database.jdbi.withExtension(UserDao.class,
                    dao -> dao.getUser(username, password));
            if (user != null) {
                HttpSession session = request.getSession();
                session.setAttribute("id", user.getId());
                session.setAttribute("username", user.getUsername());
                session.setAttribute("role", user.getRole());
                response.getWriter().print("ok");

            } else {
                sendError("the username or password is not correct", response);
            }
        } catch (ClassNotFoundException cnfe) {
            cnfe.printStackTrace();
            response.getWriter().print("error");
        } catch (SQLException sqle) {
            sqle.printStackTrace();
            response.getWriter().print("error");
        }
    }
}


