package org.java3.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;

@Getter @Setter @NoArgsConstructor @AllArgsConstructor
public class Users {
    private String id;
    private String password;
    private String fullname;
    private Date birthday;
    private boolean gender;
    private String mobile;
    private String email;
    private boolean role;
}
