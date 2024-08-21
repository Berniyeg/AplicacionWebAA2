package com.svalero.artmarket.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Artwork {
    private int id;
    private String title;
    private String description;
    private float price;
    private String picture;

}
