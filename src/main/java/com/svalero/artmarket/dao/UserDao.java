package com.svalero.artmarket.dao;

import com.svalero.artmarket.domain.Artwork;
import com.svalero.artmarket.domain.User;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;
import org.jdbi.v3.sqlobject.statement.UseRowMapper;

import java.util.List;

public interface UserDao {

    @SqlQuery("SELECT * FROM users")
    @UseRowMapper(UserMapper.class)
    List<User> getAllUsers();

    @SqlQuery("SELECT * FROM users WHERE id = ?")
    @UseRowMapper(UserMapper.class)
    User getUser(int id);

    @SqlQuery("SELECT * FROM users WHERE username = ? AND password = ?")
    @UseRowMapper(UserMapper.class)
    User getUser(String username, String password);

    @SqlUpdate("INSERT INTO users (username, password, name, email, phone, role) VALUES (?, ?, ?, ?, ?, ?)")
    int addUser(String username, String password, String name, String email, String phone, String role);

    @SqlQuery("SELECT COUNT(*) FROM users WHERE username = ?")
    int countUserByUsername(String username);


    @SqlUpdate("UPDATE users SET username = ?, name = ?, email = ?, phone = ?, role = ? WHERE id = ?")
    int updateUser(String username, String name, String email, String phone, String role);

    @SqlUpdate("DELETE FROM users WHERE id = ?")
    int removeUser(int id);
}