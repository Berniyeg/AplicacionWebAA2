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

        try {
            // Obtener parámetros del formulario
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String name = request.getParameter("name");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            String role = request.getParameter("role");

            if (role == null || role.isEmpty()) {
                role = "user";
            }

            String idUser = request.getParameter("id");
            int id = (idUser != null && !idUser.isEmpty()) ? Integer.parseInt(idUser) : 0;

            Database.connect();
            int existingUserCount = Database.jdbi.withExtension(UserDao.class,
                    dao -> dao.countUserByUsername(username));

            if (existingUserCount > 0 && id == 0) {
                sendWarning("El usuario con ese nombre ya existe.", response);
                return;
            }

            int affectedRows;
            if (id == 0) {
                // Crear nuevo usuario
                String finalRole = role;
                affectedRows = Database.jdbi.withExtension(UserDao.class,
                        dao -> dao.addUser(username, password, name, phone, email, finalRole));
                if (affectedRows > 0) {
                    sendMessage("Usuario registrado correctamente.", response);
                } else {
                    sendError("Error al registrar el usuario.", response);
                }
            } else {
                // Actualizar usuario existente
                affectedRows = Database.jdbi.withExtension(UserDao.class,
                        dao -> dao.updateUser(name, phone, id));
                if (affectedRows > 0) {
                    sendMessage("Usuario modificado correctamente.", response);
                } else {
                    sendError("Error al modificar el usuario.", response);
                }
            }

        } catch (ClassNotFoundException cnfe) {
            cnfe.printStackTrace();
            sendError("Error interno del servidor", response);
        } catch (SQLException sqle) {
            sqle.printStackTrace();
            sendError("Error conectando con la base de datos", response);
        } catch (NumberFormatException nfe) {
            nfe.printStackTrace();
            sendError("Formato de ID no válido", response);
        }
    }
}
