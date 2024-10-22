package org.java3.entities;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor
public class Users {
    String id;
    String fullname;
    String password;
    boolean admin;
}
