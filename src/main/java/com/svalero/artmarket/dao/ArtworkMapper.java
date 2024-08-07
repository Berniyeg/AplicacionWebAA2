package com.svalero.artmarket.dao;

import com.svalero.artmarket.domain.Artwork;
import org.jdbi.v3.core.mapper.RowMapper;
import org.jdbi.v3.core.statement.StatementContext;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ArtworkMapper implements RowMapper<Artwork> {

    @Override
    public Artwork map(ResultSet rs, StatementContext ctx) throws SQLException {
        return new Artwork(rs.getInt("id"),
                rs.getString("title"),
                rs.getString("description"),
                rs.getFloat("price"),
                rs.getString("picture"));
    }
}
