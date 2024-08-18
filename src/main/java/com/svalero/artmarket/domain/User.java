package com.svalero.artmarket.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data

public class User {
    private int id;
    private String name;
    private String username;
    private String password;
    private String phone;
    private String email;
    private String role;
}
