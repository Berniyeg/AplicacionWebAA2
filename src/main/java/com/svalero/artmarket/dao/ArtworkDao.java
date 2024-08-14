package com.svalero.artmarket.dao;

import com.svalero.artmarket.domain.Artwork;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.UseRowMapper;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;
import org.jdbi.v3.sqlobject.customizer.Bind;

import java.util.List;

public interface ArtworkDao {

    @SqlQuery("SELECT * FROM artworks")
    @UseRowMapper(ArtworkMapper.class)
    List<Artwork> getAllArtworks();

    @SqlUpdate("INSERT INTO artworks (title, description, price, picture) VALUES (?, ?, ?, ?)")
    int addArtwork(String title, String description, float price, String picture);
}
