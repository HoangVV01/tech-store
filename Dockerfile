# --- Stage 1: Build the app ---
FROM eclipse-temurin:17-jdk AS build

WORKDIR /app

# Copy everything
COPY . .

# Run Maven build
RUN ./mvnw clean package -DskipTests

# --- Stage 2: Run the app ---
FROM eclipse-temurin:17-jdk-jammy

WORKDIR /app

# Copy JAR file from build stage
COPY --from=build /app/target/*.jar app.jar

# Expose Render's dynamic port
EXPOSE 8080

# Run the app
CMD ["java", "-jar", "app.jar"]
