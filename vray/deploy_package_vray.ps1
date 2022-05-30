#mount network
New-PSDrive -Name S -Root \\prod.silex.artfx.fr\rez\ -PSProvider FileSystem

# remove if exist
if(Test-Path -Path "C:\Program Files\Chaos Group\V-Ray\Houdini 18.5.596")
{
	if(Test-Path -Path "C:\Program Files\Chaos Group\V-Ray\Houdini 18.5.596\uninstall")
	{
		Start-Process "C:\Program Files\Chaos Group\V-Ray\Houdini 18.5.596\uninstall\Uninstall.lnk"  -ArgumentList "-auto -quiet=1" -Wait
	}
	Remove-Item -Force -Recurse "C:\Program Files\Chaos Group\V-Ray\Houdini 18.5.596"
}

# Copy .bat
Copy-Item S:\windows\deploy_package_vray\vray_for_houdini.json -destination "C:\Houdini18\packages" -Force
#Copy-Item S:\windows\deploy_package_vray\config.xml -destination "C:\Users\Public" -Force
#Copy-Item S:\windows\deploy_package_vray\config.xml.ori -destination S:\windows\deploy_package_vray\config.xml -Force

$src = "S:\windows\deploy_package_vray\vray\*"
$dest = "C:\Program Files\Chaos Group\V-Ray\Houdini 18.5.596_vray5.2.2_stable"

Invoke-Expression "xcopy $src $dest /E /Y"
