package com.svalero.artmarket.servlet;

import com.svalero.artmarket.dao.ArtworkDao;
import com.svalero.artmarket.dao.Database;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.UUID;

@MultipartConfig
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
            Part picturePart = request.getPart("picture");

            String imagePath = request.getServletContext().getInitParameter("image-path");
            String filename = null;
            if (picturePart.getSize() == 0) {
                filename = "no-image.jpg";
            } else {
                filename = UUID.randomUUID() + ".jpg";
                InputStream fileStream = picturePart.getInputStream();
                Files.copy(fileStream, Path.of(imagePath + File.separator + filename));
            }

            Database.connect();
            final String finalFilename = filename;
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
                        dao -> dao.addArtwork(title, description, price, finalFilename));

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
                        dao -> dao.updateArtwork(title, description, price, finalFilename, id));

                if (affectedRows > 0) {
                    response.getWriter().println("<div class='alert alert-success' role='alert'>" +
                            "Obra de arte modificada correctamente.</div>");
                } else {
                    response.getWriter().println("<div class='alert alert-danger' role='alert'>" +
                            "Error al modificar la obra de arte.</div>");
                }
            }

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

