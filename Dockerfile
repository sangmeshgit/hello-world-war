FROM maven:3.8.2-openjdk-8 as build_stage
ARG BUILD_NUMBER=1.0
COPY . .
RUN mvn clean package

FROM tomcat
ARG BUILD_NUMBER=1.0
COPY --from=build_stage /target/hello-world-war-${BUILD_NUMBER}.war /usr/local/tomcat/webapps/
