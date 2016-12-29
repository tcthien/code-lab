package org.rapidoid.spring;

import org.springframework.context.ApplicationContext;

public class SpringContext {
    private static ApplicationContext context;
    
    public static void setContext(ApplicationContext context) {
        SpringContext.context = context;
    }
    
    public static ApplicationContext getContext() {
        return context;
    }
    
    public static <T> T getBean(String name, Class<T> clazz) {
        return context.getBean(name, clazz);
    }
    
    public static <T> T getBean(Class<T> clazz) {
        return context.getBean(clazz);
    }
}
