FROM java:8-jre
MAINTAINER Thien Tran <thientran1986@gmail.com>


ADD ./target/codelab-config.jar /app/
CMD ["java", "-Xmx200m", "-jar", "/app/codelab-config.jar"]

EXPOSE 8888
