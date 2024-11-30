# Используем официальный OpenJDK образ
FROM openjdk:17-jdk-slim

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем исходный код в контейнер
COPY src /app/src

# Копируем файл pom.xml для Maven (если он есть)
COPY pom.xml /app/

# Устанавливаем Maven и компилируем приложение
RUN apt-get update && apt-get install -y maven
RUN mvn clean package

# Устанавливаем команду для запуска приложения
CMD ["java", "-cp", "target/hello-world.jar", "HelloWorld"]
