package com.svalero.artmarket.servlet;
import com.svalero.artmarket.dao.Database;
import com.svalero.artmarket.dao.SculptureDao;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/remove-sculpture")
public class RemoveSculpture extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        try {
            Database.connect();
            int affectedRows = Database.jdbi.withExtension(SculptureDao.class,
                    dao -> dao.removeSculpture(id));

            if (affectedRows > 0) {
                response.getWriter().write("{\"status\":\"success\", \"message\":\"Sculpture removed successfully\"}");
            } else {
                response.getWriter().write("{\"status\":\"error\", \"message\":\"Sculpture not found\"}");
            }
        } catch (ClassNotFoundException cnfe) {
            cnfe.printStackTrace();
            response.getWriter().write("{\"status\":\"error\", \"message\":\"Internal Server Error\"}");
        } catch (SQLException sqle) {
            sqle.printStackTrace();
            response.getWriter().write("{\"status\":\"error\", \"message\":\"Database connection error\"}");
        }
    }
}

