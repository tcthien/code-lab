package org.rapidoid.spring;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class SpringBootstrap {

    private boolean usingAnnotation;

    public SpringBootstrap(String... args) {
    }

    public SpringBootstrap annotationDI(Class<?> rootClass) {
        this.usingAnnotation = true;
        ApplicationContext context = new AnnotationConfigApplicationContext(rootClass.getPackage().getName());
        SpringContext.setContext(context);
        return this;
    }

    public SpringBootstrap xmlDI(String... configLocations) {
        if (usingAnnotation) {
            throw new RuntimeException("Annotation Context is already constructed. If you want to use both XML & Annotation, please define annotation scan path in xml");
        }
        ApplicationContext context = null;
        if (configLocations.length == 0) {
            context = new ClassPathXmlApplicationContext("applicationContext.xml");
        } else {
            context = new ClassPathXmlApplicationContext(configLocations);
        }
        SpringContext.setContext(context);
        return this;
    }

}
