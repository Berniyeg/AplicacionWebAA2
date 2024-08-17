package com.svalero.artmarket.dao;

import com.svalero.artmarket.domain.Artwork;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.UseRowMapper;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;


import java.util.List;

public interface ArtworkDao {

    @SqlQuery("SELECT * FROM artworks")
    @UseRowMapper(ArtworkMapper.class)
    List<Artwork> getAllArtworks();

    @SqlQuery("SELECT * FROM artworks WHERE id = ?")
    @UseRowMapper(ArtworkMapper.class)
    Artwork getArtwork(int id);

    @SqlUpdate("INSERT INTO artworks (title, description, price, picture) VALUES (?, ?, ?, ?)")
    int addArtwork(String title, String description, float price, String picture);

    @SqlQuery("SELECT COUNT(*) FROM artworks WHERE title = ?")
    int countArtworkByTitle(String title);

    @SqlUpdate("DELETE FROM artworks WHERE id = ?")
    int removeArtwork(int id);
}
