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
@WebServlet("/register-user")

public class RegisterUser extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String role = request.getParameter("role");

        try {
            // Conectar a la base de datos
            Database.connect();

            // Verificar si el nombre de usuario ya existe
            int existingUserCount = Database.jdbi.withExtension(UserDao.class,
                    dao -> dao.countUserByUsername(username));

            // Si el usuario ya existe, mostrar un mensaje y terminar
            if (existingUserCount > 0) {
                sendWarning("El nombre de usuario ya existe.", response);
                return;
            }

            // Insertar el nuevo usuario
            int affectedRows = Database.jdbi.withExtension(UserDao.class,
                    dao -> dao.addUser(username, password, name, phone, email, role));

            // Verificar si la inserción fue exitosa
            if (affectedRows > 0) {
                sendMessage("Usuario registrado correctamente.", response);
            } else {
                sendError("Error al registrar el usuario.", response);
            }

        } catch (ClassNotFoundException cnfe) {
            cnfe.printStackTrace();
            sendError("Error interno del servidor", response);
        } catch (SQLException sqle) {
            sqle.printStackTrace();
            sendError("Error conectando con la base de datos", response);
        }
    }
}

