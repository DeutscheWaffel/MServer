FROM eclipse-temurin:21-jdk-jammy

WORKDIR /app

# Установка необходимых пакетов
RUN apt-get update && apt-get install -y \
    wget \
    git \
    && rm -rf /var/lib/apt/lists/*

# Копируем Gradle wrapper
COPY gradlew .
COPY gradle ./gradle
COPY build.gradle .
COPY settings.gradle .
COPY src ./src

# Скачиваем и устанавливаем Forge
RUN ./gradlew downloadServer

# Открываем порт
EXPOSE 25565

# Запускаем сервер
CMD ["java", "-Xmx4G", "-Xms2G", "-jar", "forge-1.21.4-54.1.0.jar", "nogui"]
