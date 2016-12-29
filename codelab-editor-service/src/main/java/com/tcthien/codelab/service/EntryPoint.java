package com.tcthien.codelab.service;

import org.rapidoid.security.Role;
import org.rapidoid.setup.App;
import org.rapidoid.setup.My;
import org.rapidoid.spring.Spring;
import org.rapidoid.u.U;

public class EntryPoint {
    public static void main(String[] args) {
//        App.bootstrap(args).jpa(); // bootstrap JPA
//        On.get("/books").json(() -> JPA.of(Book.class).all()); // get all books
//        On.post("/books").json((@Valid Book b) -> JPA.save(b)); // insert new book if valid
        
        // Initialize Application Context
        Spring.bootstrap().annotationDI(EntryPoint.class);
        // Boothstrap Application
        App.bootstrap(args).adminCenter();
        
        // Dummy login: successful if the username is the same as the password
        My.loginProvider((req, username, password) -> username.equals(password));
 
        // Gives the 'manager' role to every logged-in user
        My.rolesProvider((req, username) -> U.set(Role.ADMINISTRATOR));
    }
}
