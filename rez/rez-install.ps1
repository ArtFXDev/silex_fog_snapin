New-Item -ItemType Directory -Force -Path "c:\rez\__install__"

#mount network
New-PSDrive -Name S -Root \\prod.silex.artfx.fr\rez\ -PSProvider FileSystem

#install rez if not exist
Remove-Item -Recurse -Force "c:\rez"
Copy-Item S:\windows\rez-2.95.0 -destination "c:\rez\rez-2.95.0" -Recurse -Force

$rez_in_path=$env:Path | Select-String "C:/rez/__install__/*"
[Environment]::SetEnvironmentVariable("REZ_CONFIG_FILE", "\\192.168.2.112\rez\windows\config\rezconfig.py", "Machine")
if ($rez_in_path.length -eq 0) {
	[Environment]::SetEnvironmentVariable("Path", [Environment]::GetEnvironmentVariable('Path', 'Machine')+';C:/rez/__install__/Scripts/rez', [System.EnvironmentVariableTarget]::Machine)
}

## fix python install and install rez ##
# 1. if python exisit ?
$python=&{python -V} 2>&1
if (($p -is [System.Management.Automation.ErrorRecord]) -Or ($python.length -eq 1)) {
	Remove-Item -Recurse -Force "C:\Python37"
	Copy-Item S:\windows\Python37 -destination "C:\Python37" -Recurse -Force
	& "C:\Python37\python.exe" "c:\rez\rez-2.95.0\install.py" "c:\rez\__install__\"
}
else {
	& python "c:\rez\rez-2.95.0\install.py" "c:\rez\__install__\"
}

#remove rez\packages if exist
Remove-Item -Recurse -Force "c:\rez\packages"
Copy-Item S:\packages\lib -destination "c:\rez\packages\lib" -Recurse -Force
if (-Not(Test-Path -Path "c:\rez\packages\.rez")) {
	New-Item "c:\rez\packages\.rez" -ItemType "file"
}
