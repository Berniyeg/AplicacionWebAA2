package com.svalero.artmarket.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Sculpture {
    private int id;
    private String title;
    private String description;
    private float price;
    private String picture;
    private String material;
}
