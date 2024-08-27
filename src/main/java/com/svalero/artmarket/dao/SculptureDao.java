package com.svalero.artmarket.dao;
import com.svalero.artmarket.domain.Artwork;
import com.svalero.artmarket.domain.Sculpture;
import org.jdbi.v3.sqlobject.customizer.Bind;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;
import org.jdbi.v3.sqlobject.statement.UseRowMapper;

import java.util.List;

public interface SculptureDao {

    @SqlQuery("SELECT * FROM sculptures")
    @UseRowMapper(SculptureMapper.class)
    List<Sculpture> getAllSculptures();

    @SqlQuery("SELECT * FROM sculptures WHERE id = ?")
    @UseRowMapper(SculptureMapper.class)
    Sculpture getSculpture(int id);

    @SqlQuery("SELECT * FROM sculptures WHERE title LIKE '%' || :searchTermSculpture || '%' OR description LIKE '%' || :searchTermSculpture || '%'")
    @UseRowMapper(SculptureMapper.class)
    List<Sculpture> searchSculptures(@Bind("searchTermSculpture") String searchTermSculpture);

    @SqlUpdate("INSERT INTO sculptures (title, description, price, picture, material) VALUES (?, ?, ?, ?, ?)")
    int addSculpture(String title, String description, float price, String picture, String material);

    @SqlQuery("SELECT COUNT(*) FROM sculptures WHERE title = ?")
    int countSculptureByTitle(String title);

    @SqlUpdate ("UPDATE sculptures SET title = ?, description = ?, price = ?, picture = ?, material = ? WHERE id = ?")
    int updateSculpture (String title, String description, float price, String picture, String material, int id);

    @SqlUpdate("DELETE FROM sculptures WHERE id = ?")
    int removeSculpture(int id);

}
