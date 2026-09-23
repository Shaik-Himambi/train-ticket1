FROM maven:3.8.6-openjdk-8 AS build

WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

FROM tomcat:9-jdk8
COPY --from=build /app/target/TrainBook-1.0.0-SNAPSHOT.war /usr/local/tomcat/webapps/TrainBook.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
