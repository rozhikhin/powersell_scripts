# Скрипт проверяет свободное место на диске и, если оно меньше указнного количества процетов, 
# отправляет сообщение на e-mail

# Функция отправки сообщений
function send_mail_($msg)
{
    $Subject = "На диске заканчивается место - Компьютер : " + $env:computername; 

    $EmailTo = "admin@company.name"
    $EmailFrom = "report@company.name"
    $SMTPServer = "mail.company.name" 
    $SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$msg)
    #$attachment = New-Object System.Net.Mail.Attachment($log_file)
    #$SMTPMessage.Attachments.Add($attachment)
    $SMTPClient = New-Object Net.Mail.SmtpClient($SmtpServer, 25) 
    #$SMTPClient.EnableSsl = $true 
    $SMTPClient.Credentials = New-Object System.Net.NetworkCredential("report", "Пароль"); 
    $SMTPClient.Send($SMTPMessage)

}

# Обходим все логические диски
Get-WmiObject -Class Win32_LogicalDisk |ForEach-Object {

    # Если это жесткий диск и если свободное место на нем меньше указанного количества процентов,
	# то отправляем сообщение
    if  ( ($_.DriveType -eq 3) -and (($_.FreeSpace / $_.Size )*100 ) -lt 20 ) 

    { 
        $msg = "`n`r";

        $msg += "На диске заканчивается место  `n`r";
        $msg += "Компьютер : " + $env:computername + "`n`r";
        $msg += "Диск " + $_.DeviceID + " ( " + $_.VolumeName + " )`n`r";
        $msg += "Осталось свободного места : " + ($_.FreeSpace / 1GB).ToString("F01") + " Гб"; 
        send_mail_($msg);
        Start-Sleep -second 10;

    }



}