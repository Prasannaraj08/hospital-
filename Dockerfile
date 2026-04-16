# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# Stage 1: Build the WAR with Maven
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
FROM maven:3.9.6-eclipse-temurin-17-alpine AS build

WORKDIR /app

# Copy POM first (Docker cache optimization)
COPY pom.xml .
RUN mvn dependency:go-offline -B

# Copy source and build
COPY src ./src
RUN mvn clean package -DskipTests -B

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# Stage 2: Deploy on Tomcat 10
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
FROM tomcat:10.1-jdk17-temurin-jammy

# Remove default ROOT app
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Deploy our app AS root context (cleaner URLs with no /hospital-system/ prefix)
COPY --from=build /app/target/hospital-system.war /usr/local/tomcat/webapps/ROOT.war

# Expose Tomcat port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
