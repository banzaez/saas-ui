#!/bin/bash

# --- Цветовые коды ---
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
NC='\033[0m'

# --- Функции оформления ---
print_color() {
    printf "%b%s${NC}\n" "$1" "$2"
}

print_line_blue() {
    print_color "$BLUE" "-----------------------------------------------"
}

print_banner() {
    print_color "$CYAN" "==============================================="
    print_color "$CYAN" "             FLUTTER WEB DEPLOY                "
    print_color "$CYAN" "==============================================="
}

print_success_box() {
    printf "\n"
    print_color "$GREEN" "==============================================="
    print_color "$GREEN" "УСПЕШНО: Приложение развернуто!"
    printf "Сервер: %s\n" "$1"
    printf "Среда:  %s\n" "$2"
    print_color "$GREEN" "==============================================="
}

# --- Функции статуса ---
info()    { print_color "$BLUE" "[INFO] $1"; }
success() { print_color "$GREEN" "[SUCCESS] $1"; }
error()   { print_color "$RED" "[ERROR] $1"; }
warn()    { print_color "$YELLOW" "[WARN] $1"; }

# 1. Загрузка конфигурации
CONFIG_FILE=".deploy_config"
if [ ! -f "$CONFIG_FILE" ]; then
    error "Файл $CONFIG_FILE не найден! Скопируйте .deploy_config.example в .deploy_config и укажите свои параметры."
    exit 1
fi
source "$CONFIG_FILE"

# 2. Выбор цели
print_banner
printf "1) ${GREEN}Production${NC} -> %s\n" "${SERVER1_HOST:-not set}"
printf "2) ${YELLOW}Testing${NC}    -> %s\n" "${SERVER2_HOST:-not set}"
print_color "$CYAN" "-----------------------------------------------"
read -p "Выберите вариант (1/2): " CHOICE
printf "\n"

case $CHOICE in
  1)
    HOST=$SERVER1_HOST; USER=$SERVER1_USER; PASS=$SERVER1_PASS; 
    RPATH=$SERVER1_PATH; API_URL=$SERVER1_API; ENV_NAME="PRODUCTION" ;;
  2)
    HOST=$SERVER2_HOST; USER=$SERVER2_USER; PASS=$SERVER2_PASS; 
    RPATH=$SERVER2_PATH; API_URL=$SERVER2_API; ENV_NAME="TESTING" ;;
  *)
    warn "Деплой отменен."
    exit 1 ;;
esac

info "Выбран режим: $ENV_NAME"

# 3. Обновление JSON конфига
info "Обновление конфигурации API..."
cat <<EOF > web/.config.json
{
    "apiUrl": "$API_URL"
}
EOF
printf "   └─ API URL: ${CYAN}%s${NC}\n" "$API_URL"

# 4. Увеличение номера билда
info "Увеличение номера билда..."
VERSION_LINE=$(grep "version: " pubspec.yaml)
PURE_VERSION=$(echo $VERSION_LINE | cut -d ' ' -f 2 | cut -d '+' -f 1)
BUILD_NUMBER=$(echo $VERSION_LINE | cut -d '+' -f 2)
NEW_BUILD=$((BUILD_NUMBER + 1))
NEW_VERSION="$PURE_VERSION+$NEW_BUILD"

# Заменяем в pubspec.yaml
sed -i '' "s/version: .*/version: $NEW_VERSION/" pubspec.yaml

success "Новая версия: $NEW_VERSION"

# 5. Сборка Flutter
info "Запуск сборки Flutter (release)..."
print_line_blue
flutter build web --release --pwa-strategy=none
BUILD_STATUS=$?
print_line_blue

if [ $BUILD_STATUS -eq 0 ]; then
    success "Сборка завершена успешно. Версия: $NEW_VERSION"

    # 6. Синхронизация
    info "Начинаю загрузку файлов на $HOST..."
    printf "   └─ Путь: %s\n" "$RPATH"
    
    sshpass -p "$PASS" rsync -rlvzc --delete \
      -e "ssh -o StrictHostKeyChecking=no" \
      build/web/ "$USER@$HOST:$RPATH"

    if [ $? -eq 0 ]; then
        print_success_box "$HOST" "$ENV_NAME"
    else
        error "Не удалось загрузить файлы по SSH."
        exit 1
    fi
else
    error "Сборка Flutter завершилась с ошибкой. Загрузка отменена."
    exit 1
fi