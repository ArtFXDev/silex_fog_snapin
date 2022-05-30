Copy-Item -Path \\192.168.2.112\rez\windows\Montage_marvin.bat -Destination "C:\Users\etudiant\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup" -Recurse -force

net use * /delete /yes
Get-PSDrive P | Remove-PSDrive -Force -Verbose

net use Z: \\marvin\installers /USER:etudiant artfx2020 /persistent:yes
#New-SmbShare -Name "pipeline" -Path "D:/Pipeline"
#Grant-SmbShareAccess -Name "pipeline" -AccountName "Tout le monde" -AccessRight Full -Force
#Grant-SmbShareAccess -Name "pipeline" -AccountName "Everyone" -AccessRight Full -Force
#Get-SmbShareAccess -Name "pipeline"
#Get-SmbShare
#New-SmbMapping -LocalPath 'P:' -RemotePath '\\localhost\PIPELINE'
#net use P: \\localhost\PIPELINE /persistent:yes
subst P: "D:\Pipeline"