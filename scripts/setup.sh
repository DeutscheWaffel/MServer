#!/bin/bash

# Инициализация Gradle
./gradlew wrapper

# Сборка проекта
./gradlew shadowJar

# Сборка Docker-образа
docker-compose build
