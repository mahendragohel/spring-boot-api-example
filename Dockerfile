FROM openjdk:17
ARG JAR_FILE=build/lib/*.jar
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java", "-jar", "/app.jar"]
