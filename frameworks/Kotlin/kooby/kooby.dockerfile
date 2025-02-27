FROM maven:3.9.0-eclipse-temurin-17
WORKDIR /kooby
COPY pom.xml pom.xml
COPY src src
COPY public public
COPY conf conf
RUN mvn package -q

EXPOSE 8080

CMD ["java", "-server", "-Xms2g", "-Xmx2g", "-XX:+UseNUMA", "-XX:+UseParallelGC", "-jar", "target/kooby.jar"]
