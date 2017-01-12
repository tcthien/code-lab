package com.tnp.codelab.service;

import org.rapidoid.jpa.JPA;
import org.rapidoid.security.Role;
import org.rapidoid.setup.App;
import org.rapidoid.setup.My;
import org.rapidoid.setup.On;
import org.rapidoid.u.U;

import com.tnp.codelab.service.model.Category;

public class EntryPoint {
    public static void main(String[] args) {
        // Boothstrap Application
        App.bootstrap(args).adminCenter().jpa();
        
        // Dummy login: successful if the username is the same as the password
        My.loginProvider((req, username, password) -> username.equals(password));
 
        // Gives the 'manager' role to every logged-in user
        My.rolesProvider((req, username) -> U.set(Role.ADMINISTRATOR));
        
        On.get("/book").json(() -> JPA.of(Category.class).all()); // get all books
    }
}
