#!/bin/bash

# Directory containing error pages
ERROR_PAGES_DIR="/Users/denis/Documents/Project/DockerComposeDev/nginx/nginx/html/error_pages"

# Create a temporary file for sed commands
SED_SCRIPT=$(mktemp)

# Write all sed commands to the temporary file
cat > "$SED_SCRIPT" << 'EOL'
s/Ошибка/Error/g
s/Произошла непредвиденная ошибка/An unexpected error occurred/g
s/При обработке вашего запроса произошла ошибка/An error occurred while processing your request/g
s/Пожалуйста, попробуйте обновить страницу или зайти позже/Please try refreshing the page or come back later/g
s/Вернуться на главную/Return to Homepage/g
s/Неверный запрос/Bad Request/g
s/Не авторизован/Unauthorized/g
s/Необходима оплата/Payment Required/g
s/Доступ запрещен/Forbidden/g
s/Страница не найдена/Page Not Found/g
s/Метод не поддерживается/Method Not Allowed/g
s/Неприемлемо/Not Acceptable/g
s/Требуется аутентификация прокси/Proxy Authentication Required/g
s/Время ожидания истекло/Request Timeout/g
s/Конфликт/Conflict/g
s/Удалено/Gone/g
s/Необходимо указать длину/Length Required/g
s/Условие ложно/Precondition Failed/g
s/Полезная нагрузка слишком велика/Payload Too Large/g
s/URI слишком длинный/URI Too Long/g
s/Неподдерживаемый тип данных/Unsupported Media Type/g
s/Диапазон не достижим/Range Not Satisfiable/g
s/Ожидание не удалось/Expectation Failed/g
s/Я — чайник/I\'"'"'m a teapot/g
s/Неверный запрос/Misdirected Request/g
s/Необрабатываемый экземпляр/Unprocessable Entity/g
s/Заблокировано/Locked/g
s/Невыполненная зависимость/Failed Dependency/g
s/Слишком рано/Too Early/g
s/Необходимо обновление/Upgrade Required/g
s/Необходимо предусловие/Precondition Required/g
s/Слишком много запросов/Too Many Requests/g
s/Поля заголовка запроса слишком большие/Request Header Fields Too Large/g
s/Недоступно по юридическим причинам/Unavailable For Legal Reasons/g
s/Внутренняя ошибка сервера/Internal Server Error/g
s/Не реализовано/Not Implemented/g
s/Ошибка шлюза/Bad Gateway/g
s/Сервис недоступен/Service Unavailable/g
s/Время ожидания шлюза истекло/Gateway Timeout/g
s/Версия HTTP не поддерживается/HTTP Version Not Supported/g
s/Вариант тоже проводит согласование/Variant Also Negotiates/g
s/Переполнение хранилища/Insufficient Storage/g
s/Обнаружено бесконечное перенаправление/Loop Detected/g
s/Отсутствуют расширения/Not Extended/g
s/Требуется сетевая аутентификация/Network Authentication Required/g
s/lang="ru"/lang="en"/g
EOL

# Function to translate a single file
translate_file() {
    local file=$1
    
    # Apply all translations from the script file
    sed -i '' -f "$SED_SCRIPT" "$file"
    
    echo "Translated: $file"
}

# Make the script executable
chmod +x "$0"

# Check if directory exists
if [ ! -d "$ERROR_PAGES_DIR" ]; then
    echo "Error: Directory $ERROR_PAGES_DIR does not exist."
    rm "$SED_SCRIPT"
    exit 1
fi

# Process all HTML files in the error pages directory
find "$ERROR_PAGES_DIR" -type f -name "*.html" | while read -r file; do
    translate_file "$file"
done

# Clean up
rm "$SED_SCRIPT"

echo "All error pages have been translated to English."
echo "To apply changes, restart your Nginx container:"
echo "docker-compose -f /Users/denis/Documents/Project/DockerComposeDev/nginx/docker-compose.yml restart"
