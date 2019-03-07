# ������ ��������� �������� ������ ��������� ������������� 
cls;

# ���������
[Console]::OutputEncoding = [System.Text.Encoding]::GetEncoding("cp866");

# ���� � �������� � ��������������
$basePath = "C:\Users\";
# ������ �������������
$users = 
    "ivanov",
    "petrov",
    "sidorov",
    "sazonov",
    "vasya";

# ����� ������
foreach($user in $users){

    # ������� ID ������ �� ����� ������������
    $session = ((quser  | ? { $_ -match $user }) -split ' +')[2];

    # ��������� ��������, ������� �� ���������� ( �� ���� ������������ ��� � �������)
    if ($session -gt 0 ){
        logoff $session;  
     }

}


