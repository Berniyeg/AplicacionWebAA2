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

            int id;
            if (request.getParameter("id") != null) {
                id = Integer.parseInt(request.getParameter("id"));
            } else {
                id = 0;
            }

            String title = request.getParameter("title");
            String description = request.getParameter("description");
            float price = Float.parseFloat(request.getParameter("price"));
            String picture = request.getParameter("picture");

            Database.connect();

            // Verificar si la obra ya existe
            int existingArtworkCount = Database.jdbi.withExtension(ArtworkDao.class,
                    dao -> dao.countArtworkByTitle(title));

            // Si la obra ya existe y se está intentando crear una nueva, mostrar un mensaje y terminar
            if (existingArtworkCount > 0 && id == 0) {
                response.getWriter().println("<div class='alert alert-warning' role='alert'>" +
                        "La obra de arte con ese título ya existe.</div>");
                return;
            }

            // Determinar si estamos insertando una nueva obra o actualizando una existente
            int affectedRows;
            if (id == 0) {
                // Insertar la obra si no existe
                affectedRows = Database.jdbi.withExtension(ArtworkDao.class,
                        dao -> dao.addArtwork(title, description, price, picture));

                if (affectedRows > 0) {
                    response.getWriter().println("<div class='alert alert-success' role='alert'>" +
                            "Obra de arte subida correctamente.</div>");
                } else {
                    response.getWriter().println("<div class='alert alert-danger' role='alert'>" +
                            "Error al subir la obra de arte.</div>");
                }
            } else {
                // Modificar la obra existente
                affectedRows = Database.jdbi.withExtension(ArtworkDao.class,
                        dao -> dao.updateArtwork(title, description, price, picture, id));

                if (affectedRows > 0) {
                    response.getWriter().println("<div class='alert alert-success' role='alert'>" +
                            "Obra de arte modificada correctamente.</div>");
                } else {
                    response.getWriter().println("<div class='alert alert-danger' role='alert'>" +
                            "Error al modificar la obra de arte.</div>");
                }
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

