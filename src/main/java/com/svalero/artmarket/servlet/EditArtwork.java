package com.svalero.artmarket.servlet;

import com.svalero.artmarket.dao.ArtworkDao;
import com.svalero.artmarket.dao.Database;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;

@WebServlet("/edit-artwork")

public class EditArtwork extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String title = request.getParameter("title");
            String description = request.getParameter("description");
            float price = Float.parseFloat(request.getParameter("price"));
            String picture = request.getParameter("picture");

            Database.connect();
            int affectRows = Database.jdbi.withExtension(ArtworkDao.class,
                    dao -> dao.addArtwork(title, description, price, picture));
            response.getWriter().println("<div class='alert alert-success' role='alert'>" +
                    "Registrado correctamente </div>");
        } catch (NumberFormatException nfe) {
            nfe.printStackTrace();
            response.getWriter().println("<div class='alert alert-danger' role='alert'>" +
                    "El formato de precio no es correcto </div>");
        } catch (ClassNotFoundException cnfe){
            cnfe.printStackTrace();
            response.getWriter().println("<div class='alert alert-danger' role='alert'>" +
                    "Internal Server Error </div>");
        } catch (SQLException sqle) {
            sqle.printStackTrace();
            response.getWriter().println("<div class='alert alert-danger' role='alert'>" +
                    "Error al conectar con la base de datos </div>");
        }
    }
}
