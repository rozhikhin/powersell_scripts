# Скрипт закрывает активные сеансы указанных пользователей 
cls;

# Кодировка
[Console]::OutputEncoding = [System.Text.Encoding]::GetEncoding("cp866");

# Путь к каталогу с пользователями
$basePath = "C:\Users\";
# Список пользователей
$users = 
    "ivanov",
    "petrov",
    "sidorov",
    "sazonov",
    "vasya";

# Обход списка
foreach($user in $users){

    # Находим ID сеанса по имени пользователя
    $session = ((quser  | ? { $_ -match $user }) -split ' +')[2];

    # Исключаем значения, которые не существуют ( то есть пользователя нет в системе)
    if ($session -gt 0 ){
        logoff $session;  
     }

}


