#create a package first
#mvn package -Dmaven.test.skip
#Eexecute application
#project_directory:> java -jar target/gateway-0.0.1-SNAPSHOT.jar

# For Java 11, try this
FROM adoptopenjdk/openjdk11:alpine-jre

# Refer to Maven build -> finalName
ARG JAR_FILE=target/gateway-0.0.1-SNAPSHOT.jar

# cd /opt/app
WORKDIR /opt/app

# cp target/spring-boot-web.jar /opt/app/sa-gateway.jar
COPY ${JAR_FILE} sa-gateway.jar

# java -jar /opt/app/app.jar
ENTRYPOINT ["java","-jar","sa-gateway.jar"]

EXPOSE 8081

# Make docker file
#docker build -t sa-gateway:tag_name .

# make docker file for dockerhub
#docker build -t faizulnoor/sa-gateway .

#run docker file
#C:\dev\repos\studyaid\sa-gateway>docker run -d -p 8080:8080 -t sa-gateway-image