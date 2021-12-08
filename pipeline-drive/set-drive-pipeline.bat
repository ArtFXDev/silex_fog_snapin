powershell.exe -ExecutionPolicy Bypass -NoProfile -File \\192.168.2.112\rez\windows\set-drive-pipeline.ps1
Copy-Item -Path \\192.168.2.112\rez\windows\Montage_marvin.bat -Destination "C:\Users\etudiant\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup" -Recurse -force
pause