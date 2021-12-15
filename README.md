# silex_fog_snapin

Silex deployment repository.

## Getting Start :

[see documentation](https://github.com/ArtFXDev/silex_fog_snapin/wiki/)


## Quick Snapin Description
|Name |Description   |Note    |
|---- |--------------|--------|
|reset_blade_status_from_network | Launch blade service and set startin mode to "Automatic" |.ps1 store on \\192.168.2.112, you need to run this when you deploy 2 times "Tractor Blade" on the same computer|
|Resilio `<PROJECT_NAME>` Install |Resilio Agent .MSI for each project |Resilio config packed in .msi|
|rez-install-from-network |Install rez, Copy python37 in C:/ if not exist and copy rez lib to local |.ps1 store on \\192.168.2.112|
|set-drive-pipeline | Set P:\ drive to avoid repath | Tp keep P:\ on reboot, startup scripts for mavin is edited to add P:\ on startup|
|SilexDesktop | Pipeline Desktop App, to open save, run actions ... | The error message during installation is normal
|Tractor Blade | Blade tractor installation | needed to render job on computer|

Snapin needed for a new computer is : 
 - rez-install-from-network
 - set-drive-pipeline
 - SilexDesktop
 - Tractor Blade
 - Resilio `<PROJECT_NAME>` Install
