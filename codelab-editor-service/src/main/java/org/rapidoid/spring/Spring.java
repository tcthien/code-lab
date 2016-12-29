package org.rapidoid.spring;

public class Spring {

    private static SpringBootstrap bootstrap;
    private static Spring singleton;

    public static Spring get() {
        if (singleton == null) {
            singleton = new Spring();
        }
        return singleton;
    }

    private Spring() {
    }
    
    public static SpringBootstrap bootstrap(String...args) {
        bootstrap = new SpringBootstrap(args);
        return bootstrap;
    }
}
