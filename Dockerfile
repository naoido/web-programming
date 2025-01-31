FROM gradle:8.10-jdk21 AS build
WORKDIR /app
COPY . .
RUN gradle dependencies --no-daemon
RUN gradle war

FROM tomcat:latest
COPY --from=build /app/build/libs/*.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080

CMD ["catalina.sh", "run"]