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


@WebServlet("/logout")
public class Logout extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();
        session.invalidate();
        response.sendRedirect("/ArtMarket");
    }
}