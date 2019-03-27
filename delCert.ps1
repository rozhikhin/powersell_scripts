
# Скрипт удаляет все сертификаьы из контейнера My (Личные), за исключением указанных с писке ListNoDeleteCert
# Запускать с обычными правами, без повышения привилегий

$ListNoDeleteCert = '47f5ffn53456789a459', '40f8f8f8f8f97ddfx1b23c565'
 Get-ChildItem -Path  cert:CurrentUser\My | Where { $ListNoDeleteCert  -NotContains $_.SerialNumber } | Remove-Item