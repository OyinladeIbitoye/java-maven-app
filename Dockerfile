FROM amazoncorretto:17-alpine-jdk

EXPOSE 8080

# COPY ./target/java-maven-app-*.jar /usr/app/app.jar
COPY ./target/java-maven-app-1.1-SNAPSHOT.jar /usr/app/
WORKDIR /usr/app

# ENTRYPOINT ["java", "-jar", "app.jar"]
ENTRYPOINT ["java", "-jar", "java-maven-app-1.1-SNAPSHOT.jar"]
