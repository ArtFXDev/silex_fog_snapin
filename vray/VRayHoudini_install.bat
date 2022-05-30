@echo off

IF EXIST "C:\Program Files\Chaos Group\V-Ray" (
 "C:\Program Files\Chaos Group\V-Ray\Houdini 18.5.596/uninstall/installer.exe" -uninstall="C:\Program Files\Chaos Group\V-Ray\Houdini 18.5.596/uninstall/install.log" -uninstallApp="V-Ray 5 5.10.20 for Houdini 18.5.596" -quiet=1 -auto
)

xcopy /y \\marvin\installers\WIN\V-Ray\config.xml C:\Users\Public
start /wait \\marvin\installers\WIN\V-Ray\vray_adv_52020_houdini18.5.596_4b0b02d_21342.exe -gui=0 -configFile="C:\Users\Public\config.xml" -quiet=1
exit 0