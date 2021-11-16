New-Item -ItemType Directory -Force -Path "c:\rez\__install__"

#mount network
New-PSDrive -Name S -Root \\prod.silex.artfx.fr\rez\windows\ -PSProvider FileSystem
if (-Not(Test-Path -Path "C:\Python37")) {
	Copy-Item S:\Python37 -destination "C:\Python37" -Recurse -Force
}

#remove if exist
Get-ChildItem "c:\rez\rez-2.95.0" -Recurse | Remove-Item -Recurse
Copy-Item S:\rez-2.95.0 -destination "c:\rez" -Recurse -Force

& "C:\Python37\python.exe" "c:\rez\rez-2.95.0\install.py" "c:\rez\__install__\"

[Environment]::SetEnvironmentVariable("Path", [Environment]::GetEnvironmentVariable('Path', 'Machine')+';C:\rez\__install__\Scripts\rez', [System.EnvironmentVariableTarget]::Machine)
[Environment]::SetEnvironmentVariable("REZ_CONFIG_FILE", "\\192.168.2.112\rez\windows\config\rezconfig.py", "Machine")