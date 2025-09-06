#!/bin/bash

# Create error pages directory if it doesn't exist
mkdir -p /Users/denis/Documents/Project/DockerComposeDev/nginx/nginx/html/error_pages

# Error messages in Russian
declare -A error_messages=(
    [400]="Неверный запрос"
    [401]="Не авторизован"
    [402]="Необходима оплата"
    [403]="Доступ запрещен"
    [404]="Страница не найдена"
    [405]="Метод не поддерживается"
    [406]="Неприемлемо"
    [407]="Требуется аутентификация прокси"
    [408]="Время ожидания истекло"
    [409]="Конфликт"
    [410]="Удалено"
    [411]="Необходимо указать длину"
    [412]="Условие ложно"
    [413]="Полезная нагрузка слишком велика"
    [414]="URI слишком длинный"
    [415]="Неподдерживаемый тип данных"
    [416]="Диапазон не достижим"
    [417]="Ожидание не удалось"
    [418]="Я — чайник"
    [421]="Неверный запрос"
    [422]="Необрабатываемый экземпляр"
    [423]="Заблокировано"
    [424]="Невыполненная зависимость"
    [425]="Слишком рано"
    [426]="Необходимо обновление"
    [428]="Необходимо предусловие"
    [429]="Слишком много запросов"
    [431]="Поля заголовка запроса слишком большие"
    [451]="Недоступно по юридическим причинам"
    [500]="Внутренняя ошибка сервера"
    [501]="Не реализовано"
    [502]="Ошибка шлюза"
    [503]="Сервис недоступен"
    [504]="Время ожидания шлюза истекло"
    [505]="Версия HTTP не поддерживается"
    [506]="Вариант тоже проводит согласование"
    [507]="Переполнение хранилища"
    [508]="Обнаружено бесконечное перенаправление"
    [510]="Отсутствуют расширения"
    [511]="Требуется сетевая аутентификация"
)

# Function to generate error page
generate_error_page() {
    local code=$1
    local message=$2
    
    cat > "/Users/denis/Documents/Project/DockerComposeDev/nginx/nginx/html/error_pages/${code}.html" << EOL
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${code} ${message}</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            line-height: 1.6;
            color: #2c3e50;
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background-color: #f8f9fa;
        }
        .error-container {
            text-align: center;
            padding: 40px 20px;
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            margin-top: 50px;
        }
        .error-code {
            font-size: 72px;
            font-weight: bold;
            color: #e74c3c;
            margin: 0;
            line-height: 1;
        }
        .error-message {
            font-size: 24px;
            color: #34495e;
            margin: 20px 0;
        }
        .error-description {
            color: #7f8c8d;
            margin-bottom: 30px;
            line-height: 1.6;
        }
        .home-link {
            display: inline-block;
            padding: 12px 30px;
            background-color: #3498db;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            transition: all 0.3s ease;
            font-weight: 500;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            font-size: 14px;
        }
        .home-link:hover {
            background-color: #2980b9;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        @media (max-width: 600px) {
            .error-code {
                font-size: 48px;
            }
            .error-message {
                font-size: 20px;
            }
            .error-container {
                margin: 20px 10px;
                padding: 20px 10px;
            }
        }
    </style>
</head>
<body>
    <div class="error-container">
        <h1 class="error-code">${code}</h1>
        <h2 class="error-message">${message}</h2>
        <p class="error-description">
            ${code} ${message}.<br>
            При обработке вашего запроса произошла ошибка. Пожалуйста, попробуйте обновить страницу или зайти позже.
        </p>
        <a href="/" class="home-link">Вернуться на главную</a>
    </div>
</body>
</html>
EOL
}

# Generate error pages for each status code
for code in "${!error_messages[@]}"; do
    echo "Generating error page for ${code}..."
    generate_error_page "$code" "${error_messages[$code]}"
done

echo "All error pages have been generated in /Users/denis/Documents/Project/DockerComposeDev/nginx/nginx/html/error_pages/"
echo "Don't forget to make the script executable with: chmod +x generate_error_pages.sh"
