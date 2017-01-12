package com.tnp.codelab.service.rest;

import org.rapidoid.annotation.Controller;
import org.rapidoid.annotation.GET;
import org.rapidoid.u.U;

@Controller
public class GenericRestService {
 
    @GET("/hey/{name}/{age:\\d+}")
    public String hey(String name, int age) {
        return U.frmt("Hey %s (%s)", name, age);
    }
}