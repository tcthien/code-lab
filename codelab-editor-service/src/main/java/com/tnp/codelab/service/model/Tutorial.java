package com.tnp.codelab.service.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

public class Tutorial {
    @Id
    @GeneratedValue
    Long id;
    
    String title;
    
    
}
