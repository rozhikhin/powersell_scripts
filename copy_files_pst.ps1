# Скрипт рекурсивно обходит каталог c:\Users\ и копирует в каталог назначения файлы с указанным расширением, 
# дата изменения которых больше суток

# Формируем имя каталога
 $backDate = Get-Date -UFormat "%d-%m-%Y-%H-%M-%S";
 
# Количество дней, прибавляемых (отнимаемых ) от текущей даты 
$Days = "-1";
# Текущая дата	
$CurrentDate = Get-Date;
# Дата и время, старще которых дожны быть дата и время изменения файла, чтобы он был скопирован
$OldDate = $CurrentDate.AddDays($Days);
# Создаем директорию 
mkdir d:\PST\$backDate;
# Копируем файлы 
Get-ChildItem  c:\Users\ -Include *.pst -Recurse | Where-Object { $_.LastWriteTime -gt $OldDate } | Copy-Item  -Destination d:\PST\$backDate;