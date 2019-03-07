# ������ ���������� ������� ������� c:\Users\ � �������� � ������� ���������� ����� � ��������� �����������, 
# ���� ��������� ������� ������ �����

# ��������� ��� ��������
 $backDate = Get-Date -UFormat "%d-%m-%Y-%H-%M-%S";
 
# ���������� ����, ������������ (���������� ) �� ������� ���� 
$Days = "-1";
# ������� ����	
$CurrentDate = Get-Date;
# ���� � �����, ������ ������� ����� ���� ���� � ����� ��������� �����, ����� �� ��� ����������
$OldDate = $CurrentDate.AddDays($Days);
# ������� ���������� 
mkdir d:\PST\$backDate;
# �������� ����� 
Get-ChildItem  c:\Users\ -Include *.pst -Recurse | Where-Object { $_.LastWriteTime -gt $OldDate } | Copy-Item  -Destination d:\PST\$backDate;