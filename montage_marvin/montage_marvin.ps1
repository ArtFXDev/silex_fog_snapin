#mount network
New-PSDrive -Name S -Root \\prod.silex.artfx.fr\rez\ -PSProvider FileSystem

# Copy .bat
Copy-Item S:\windows\montage_marvin\montage_marvin.bat -destination "C:\Users\etudiant\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup" -Force
