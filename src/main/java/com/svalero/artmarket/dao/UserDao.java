package com.svalero.artmarket.dao;

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

    // Modificación para Oracle usando DBMS_CRYPTO.HASH para SHA-1
    @SqlQuery("SELECT * FROM users WHERE username = ? AND password = RAWTOHEX(DBMS_CRYPTO.HASH(UTL_RAW.CAST_TO_RAW(?), DBMS_CRYPTO.HASH_SH1))")
    @UseRowMapper(UserMapper.class)
    User getUser(String username, String password);

    @SqlUpdate("INSERT INTO users (username, password, name, email, phone, role) VALUES (?, RAWTOHEX(DBMS_CRYPTO.HASH(UTL_RAW.CAST_TO_RAW(?), DBMS_CRYPTO.HASH_SH1)), ?, ?, ?, ?)")
    int addUser(String username, String password, String name, String phone, String email, String role);

    @SqlUpdate("UPDATE users SET username = ?, name = ?, email = ?, phone = ?, role = ? WHERE id = ?")
    int updateUser(String username, String name, String phone, String email, String role);

    @SqlUpdate("DELETE FROM users WHERE id = ?")
    int removeUser(int id);
}
