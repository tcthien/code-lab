FROM java:8-jre
MAINTAINER Thien Tran <thientran1986@gmail.com>

ADD ./target/codelab-gateway.jar /app/
CMD ["java", "-Xmx200m", "-jar", "/app/codelab-gateway.jar"]

EXPOSE 4000