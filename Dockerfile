# Указываем базовый образ
FROM golang:1.22.0

# Устанавливаем рабочую директорию внутри контейнера
WORKDIR /app

# Копируем go.mod и go.sum в рабочую директорию
COPY go.mod go.sum ./

# Загружаем все зависимости
RUN go mod download

# Копируем остальные файлы в рабочую директорию
COPY . ./

# Собираем приложение
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /task_docker

# Запускаем приложение
CMD ["/task_docker"]