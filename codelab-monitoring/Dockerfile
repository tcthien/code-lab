FROM java:8-jre
MAINTAINER Thien Tran <thientran1986@gmail.com>

ADD ./target/codelab-monitoring.jar /app/
CMD ["java", "-Xmx200m", "-jar", "/app/codelab-monitoring.jar"]

EXPOSE 8989 8080