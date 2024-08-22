package com.svalero.artmarket.servlet;

import com.svalero.artmarket.dao.Database;
import com.svalero.artmarket.dao.SculptureDao;
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
import java.util.UUID;

import static com.svalero.artmarket.util.ErrorUtil.*;

@MultipartConfig
@WebServlet("/edit-sculpture")
public class EditSculpture extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        try {
            int id = parseId(request.getParameter("id"));
            String title = request.getParameter("title");
            String description = request.getParameter("description");
            float price = Float.parseFloat(request.getParameter("price"));
            Part picturePart = request.getPart("picture");
            String material = request.getParameter("material");

            String imageSculpturePath = request.getServletContext().getInitParameter("image-sculpture-path");
            String filename = handleFileUpload(picturePart, imageSculpturePath);

            Database.connect();
            int existingSculptureCount = Database.jdbi.withExtension(SculptureDao.class,
                    dao -> dao.countSculptureByTitle(title));

            if (existingSculptureCount > 0 && id == 0) {
                sendWarning("La escultura con ese título ya existe.", response);
                return;
            }

            int affectedRows;
            if (id == 0) {
                affectedRows = Database.jdbi.withExtension(SculptureDao.class,
                        dao -> dao.addSculpture(title, description, price, filename, material));
                if (affectedRows > 0) {
                    sendMessage("Escultura subida correctamente.", response);
                } else {
                    sendError("Error al subir la obra de arte.", response);
                }
            } else {
                affectedRows = Database.jdbi.withExtension(SculptureDao.class,
                        dao -> dao.updateSculpture(title, description, price, filename, material, id));
                if (affectedRows > 0) {
                    sendMessage("Obra de arte modificada correctamente.", response);
                } else {
                    sendMessage("Error al modificar la obra de arte.", response);
                }
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            sendError("Internal Server Error", response);
        }
    }

    private int parseId(String idParam) {
        try {
            return idParam != null ? Integer.parseInt(idParam) : 0;
        } catch (NumberFormatException e) {
            return 0;
        }
    }

    private String handleFileUpload(Part picturePart, String imagePath) throws IOException {
        String filename;
        if (picturePart.getSize() == 0) {
            filename = "no-image.jpg";
        } else {
            filename = UUID.randomUUID() + ".jpg";
            try (InputStream fileStream = picturePart.getInputStream()) {
                Files.copy(fileStream, Path.of(imagePath + File.separator + filename));
            }
        }
        return filename;
    }
}
