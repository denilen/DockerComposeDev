#!/bin/bash

# Directory containing error pages
ERROR_PAGES_DIR="/Users/denis/Documents/Project/DockerComposeDev/nginx/nginx/html/error_pages"

# Function to translate a single file
translate_file() {
    local file=$1
    
    # Replace Russian text with English
    sed -i '' 's/Ошибка/Error/g' "$file"
    sed -i '' 's/Произошла непредвиденная ошибка/An unexpected error occurred/g' "$file"
    sed -i '' 's/При обработке вашего запроса произошла ошибка/An error occurred while processing your request/g" "$file"
    sed -i '' 's/Пожалуйста, попробуйте обновить страницу или зайти позже/Please try refreshing the page or come back later/g' "$file"
    sed -i '' 's/Вернуться на главную/Return to Homepage/g' "$file"
    
    # Common error messages
    sed -i '' 's/Неверный запрос/Bad Request/g' "$file"
    sed -i '' 's/Не авторизован/Unauthorized/g' "$file"
    sed -i '' 's/Необходима оплата/Payment Required/g' "$file"
    sed -i '' 's/Доступ запрещен/Forbidden/g' "$file"
    sed -i '' 's/Страница не найдена/Page Not Found/g' "$file"
    sed -i '' 's/Метод не поддерживается/Method Not Allowed/g' "$file"
    sed -i '' 's/Неприемлемо/Not Acceptable/g' "$file"
    sed -i '' 's/Требуется аутентификация прокси/Proxy Authentication Required/g' "$file"
    sed -i '' 's/Время ожидания истекло/Request Timeout/g' "$file"
    sed -i '' 's/Конфликт/Conflict/g' "$file"
    sed -i '' 's/Удалено/Gone/g' "$file"
    sed -i '' 's/Необходимо указать длину/Length Required/g' "$file"
    sed -i '' 's/Условие ложно/Precondition Failed/g' "$file"
    sed -i '' 's/Полезная нагрузка слишком велика/Payload Too Large/g' "$file"
    sed -i '' 's/URI слишком длинный/URI Too Long/g' "$file"
    sed -i '' 's/Неподдерживаемый тип данных/Unsupported Media Type/g' "$file"
    sed -i '' 's/Диапазон не достижим/Range Not Satisfiable/g' "$file"
    sed -i '' 's/Ожидание не удалось/Expectation Failed/g' "$file"
    sed -i '' 's/Я — чайник/I\'"'"'m a teapot/g' "$file"
    sed -i '' 's/Неверный запрос/Misdirected Request/g' "$file"
    sed -i '' 's/Необрабатываемый экземпляр/Unprocessable Entity/g' "$file"
    sed -i '' 's/Заблокировано/Locked/g' "$file"
    sed -i '' 's/Невыполненная зависимость/Failed Dependency/g' "$file"
    sed -i '' 's/Слишком рано/Too Early/g' "$file"
    sed -i '' 's/Необходимо обновление/Upgrade Required/g' "$file"
    sed -i '' 's/Необходимо предусловие/Precondition Required/g' "$file"
    sed -i '' 's/Слишком много запросов/Too Many Requests/g' "$file"
    sed -i '' 's/Поля заголовка запроса слишком большие/Request Header Fields Too Large/g' "$file"
    sed -i '' 's/Недоступно по юридическим причинам/Unavailable For Legal Reasons/g' "$file"
    sed -i '' 's/Внутренняя ошибка сервера/Internal Server Error/g' "$file"
    sed -i '' 's/Не реализовано/Not Implemented/g' "$file"
    sed -i '' 's/Ошибка шлюза/Bad Gateway/g' "$file"
    sed -i '' 's/Сервис недоступен/Service Unavailable/g' "$file"
    sed -i '' 's/Время ожидания шлюза истекло/Gateway Timeout/g' "$file"
    sed -i '' 's/Версия HTTP не поддерживается/HTTP Version Not Supported/g' "$file"
    sed -i '' 's/Вариант тоже проводит согласование/Variant Also Negotiates/g' "$file"
    sed -i '' 's/Переполнение хранилища/Insufficient Storage/g' "$file"
    sed -i '' 's/Обнаружено бесконечное перенаправление/Loop Detected/g' "$file"
    sed -i '' 's/Отсутствуют расширения/Not Extended/g' "$file"
    sed -i '' 's/Требуется сетевая аутентификация/Network Authentication Required/g' "$file"
    
    # Update HTML lang attribute
    sed -i '' 's/lang="ru"/lang="en"/g' "$file"
    
    echo "Translated: $file"
}

# Make the script executable
chmod +x "$0"

# Check if directory exists
if [ ! -d "$ERROR_PAGES_DIR" ]; then
    echo "Error: Directory $ERROR_PAGES_DIR does not exist."
    exit 1
fi

# Process all HTML files in the error pages directory
find "$ERROR_PAGES_DIR" -type f -name "*.html" | while read -r file; do
    translate_file "$file"
done

echo "All error pages have been translated to English."
echo "To apply changes, restart your Nginx container:"
echo "docker-compose -f /Users/denis/Documents/Project/DockerComposeDev/nginx/docker-compose.yml restart"
