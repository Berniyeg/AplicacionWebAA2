package com.svalero.artmarket.servlet;

import com.svalero.artmarket.dao.ArtworkDao;
import com.svalero.artmarket.dao.Database;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/edit-artwork")

public class EditArtwork extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        try {
            String title = request.getParameter("title");
            String description = request.getParameter("description");
            float price = Float.parseFloat(request.getParameter("price"));
            String picture = request.getParameter("picture");

            Database.connect();

            // Verificar si la obra ya existe
            int existingArtworkCount = Database.jdbi.withExtension(ArtworkDao.class,
                    dao -> dao.countArtworkByTitle(title));

            if (existingArtworkCount > 0) {
                response.getWriter().println("<div class='alert alert-warning' role='alert'>" +
                        "La obra de arte con ese título ya existe en la base de datos.</div>");
                return;
            }

            // Insertar la obra si no existe
            int affectedRows = Database.jdbi.withExtension(ArtworkDao.class,
                    dao -> dao.addArtwork(title, description, price, picture));

            if (affectedRows > 0) {
                response.getWriter().println("<div class='alert alert-success' role='alert'>" +
                        "Obra de arte subida correctamente.</div>");
            } else {
                response.getWriter().println("<div class='alert alert-danger' role='alert'>" +
                        "Error al subir la obra de arte.</div>");
            }

        } catch (NumberFormatException nfe) {
            nfe.printStackTrace();
            response.getWriter().println("<div class='alert alert-danger' role='alert'>" +
                    "El formato de precio no es correcto.</div>");
        } catch (ClassNotFoundException cnfe) {
            cnfe.printStackTrace();
            response.getWriter().println("<div class='alert alert-danger' role='alert'>" +
                    "Error interno del servidor.</div>");
        } catch (SQLException sqle) {
            sqle.printStackTrace();
            response.getWriter().println("<div class='alert alert-danger' role='alert'>" +
                    "Error al conectar con la base de datos.</div>");
        }
    }
}

