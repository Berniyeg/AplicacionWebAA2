package com.svalero.artmarket.dao;

import com.svalero.artmarket.domain.User;
import org.jdbi.v3.sqlobject.customizer.Bind;
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

    @SqlQuery("SELECT * FROM users WHERE username LIKE '%' || :searchTermUser || '%' OR name LIKE '%' || :searchTermUser || '%'")
    @UseRowMapper(UserMapper.class)
    List<User> searchUsers(@Bind("searchTermUser") String searchTermUser);

    @SqlUpdate("INSERT INTO users (username, password, name,  phone, email, role) VALUES (?, ?, ?, ?, ?, ?)")
    int addUser(String username, String password, String name, String phone, String email, String role);

    @SqlQuery("SELECT COUNT(*) FROM users WHERE username = ?")
    int countUserByUsername(String username);

    @SqlUpdate("UPDATE users SET name = ?, phone = ? WHERE id = ?")
    int updateUser(String name, String phone, int id);

    @SqlUpdate("DELETE FROM users WHERE id = ?")
    int removeUser(int id);
}