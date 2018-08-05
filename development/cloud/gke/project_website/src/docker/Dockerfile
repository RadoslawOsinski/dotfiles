FROM openjdk:10-jdk
MAINTAINER  Radosław Osiński <Radoslaw.Osinski@gmail.com>

COPY build/libs/*.war /opt/project/project.war
WORKDIR /opt/project
EXPOSE 8080

CMD ["java", "--add-modules=java.xml.bind", "-jar", "project.war"]
