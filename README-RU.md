# Docker Compose Development Environment

![Docker Compose Development Environment](docker.jpg)
![Dashboard](dashboard.png)

**Русский** | [English](README.md)

Комплексное окружение для разработки с использованием Docker Compose. Включает в себя все необходимые сервисы для полноценной работы.

## 🚀 Возможности

- **Базы данных**:
  - PostgreSQL
  - MongoDB
  - Microsoft SQL Server
  - Redis
  - MinIO (S3-совместимое хранилище)

- **Брокеры сообщений**:
  - RabbitMQ
  - Apache Kafka с Zookeeper

- **Инструменты разработки**:
  - Nginx с кастомными страницами ошибок
  - GitLab
  - SonarQube
  - TeamCity
  - n8n (Автоматизация рабочих процессов)
  - Seq (Структурированное логирование)

## 📁 Структура проекта

```
DockerComposeDev/
├── gitlab/            # Конфигурация GitLab
├── kafka/             # Kafka и Zookeeper
├── minio/             # Объектное хранилище MinIO
├── mongoDb/           # База данных MongoDB
├── mssql/             # Microsoft SQL Server
├── n8n/               # Автоматизация рабочих процессов
├── nginx/             # Nginx веб-сервер
├── postgresql/        # База данных PostgreSQL
├── rabbitMq/          # Брокер сообщений RabbitMQ
├── redis/             # Ключ-значение хранилище Redis
├── seq/               # Сервер логирования Seq
├── sonarqube/         # Анализ качества кода
└── teamcity/          # CI/CD сервер TeamCity
```

## 🛠️ Требования

- Docker Engine (v20.10+)
- Docker Compose (v2.0+)
- Минимум 8 ГБ ОЗУ (рекомендуется 16 ГБ)
- Не менее 20 ГБ свободного места на диске

## 🚀 Быстрый старт

1. Клонируйте репозиторий:
   ```bash
   git clone <repository-url>
   cd DockerComposeDev
   ```

2. Запустите все сервисы:
   ```bash
   docker-compose -f docker-compose.yml up -d
   ```

3. Доступ к сервисам:
   - Nginx: http://localhost
   - GitLab: http://gitlab.dev.lan
   - SonarQube: http://sonarqube.dev.lan
   - TeamCity: http://teamcity.dev.lan
   - n8n: http://n8n.dev.lan
   - MinIO Console: http://minio.dev.lan:9001
   - Seq: http://seq.dev.lan:5341

## 🔧 Настройка

### Переменные окружения

Каждый сервис имеет свой файл `.env` для конфигурации:

```bash
cp nginx/.env.example nginx/.env
cp postgresql/.env.example postgresql/.env
# И так для каждого сервиса
```

### Настройка доменов

Добавьте в файл `/etc/hosts`:

```
127.0.0.1   gitlab.dev.lan
127.0.0.1   sonarqube.dev.lan
127.0.0.1   teamcity.dev.lan
127.0.0.1   n8n.dev.lan
127.0.0.1   minio.dev.lan
127.0.0.1   seq.dev.lan
127.0.0.1   rabbitmq.dev.lan
```

## 🧩 Детали сервисов

### Nginx
- Порт: 80, 443
- Кастомные страницы ошибок
- Настройка обратного прокси

### PostgreSQL
- Порт: 5432
- Логин/пароль по умолчанию: dev/dev

### MongoDB
- Порт: 27017
- Логин/пароль по умолчанию: dev/dev

### RabbitMQ
- Веб-интерфейс: http://rabbitmq.dev.lan:15672
- Логин/пароль по умолчанию: guest/guest

### Kafka
- Порт: 9092
- Zookeeper порт: 2181

## 🛡️ Безопасность

- Измените стандартные учетные данные
- Ограничьте открытые порты в продакшене
- Включите аутентификацию для всех сервисов
- Используйте HTTPS в продакшене

## 🤝 Участие в проекте

1. Сделайте форк репозитория
2. Создайте ветку для новой функции
3. Зафиксируйте изменения
4. Отправьте изменения в репозиторий
5. Создайте Pull Request

## 📄 Лицензия

Этот проект распространяется под лицензией MIT. Подробности в файле [LICENSE](LICENSE).

---

<div align="center">
  Создано с ❤️ для разработчиков
</div>
