package com.svalero.artmarket.dao;
import com.svalero.artmarket.domain.Sculpture;
import org.jdbi.v3.core.mapper.RowMapper;
import org.jdbi.v3.core.statement.StatementContext;

import java.sql.ResultSet;
import java.sql.SQLException;

public class SculptureMapper implements RowMapper<Sculpture> {

    @Override
    public Sculpture map(ResultSet rs, StatementContext ctx) throws SQLException {
        return new Sculpture(rs.getInt("id"),
                rs.getString("title"),
                rs.getString("description"),
                rs.getFloat("price"),
                rs.getString("picture"),
                rs.getString("material"));
    }
}
