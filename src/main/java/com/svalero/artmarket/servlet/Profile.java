package com.svalero.artmarket.servlet;

import com.svalero.artmarket.dao.Database;
import com.svalero.artmarket.dao.UserDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

import static com.svalero.artmarket.util.ErrorUtil.*;

@MultipartConfig
@WebServlet("/profile")
public class Profile extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");

        try {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String name = request.getParameter("name");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            String role = request.getParameter("role");


            String idUser = request.getParameter("id");
            int id = (idUser != null && !idUser.isEmpty()) ? Integer.parseInt(idUser) : 0;

            Database.connect();

            int affectedRows;
            if (id == 0) {
                // Crear nuevo usuario
                affectedRows = Database.jdbi.withExtension(UserDao.class,
                        dao -> dao.addUser(username, password, name, phone, email, role));
                if (affectedRows > 0) {
                    sendMessage("Successfully registered user.", response);
                } else {
                    sendError("Error registering user.", response);
                }
            } else {
                // Actualizar usuario existente
                affectedRows = Database.jdbi.withExtension(UserDao.class,
                        dao -> dao.updateUser(name, phone, id));
                if (affectedRows > 0) {
                    sendMessage("User modified successfully.", response);
                } else {
                    sendError("Error modifying user.", response);
                }
            }

        } catch (ClassNotFoundException cnfe) {
            cnfe.printStackTrace();
            sendError("Internal Server Error", response);
        } catch (SQLException sqle) {
            sqle.printStackTrace();
            sendError("Error connecting to the database", response);
        } catch (NumberFormatException nfe) {
            nfe.printStackTrace();
            sendError("Invalid ID format", response);
        }
    }
}
