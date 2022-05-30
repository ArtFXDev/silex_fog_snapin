#mount network
New-PSDrive -Name S -Root \\prod.silex.artfx.fr\rez\ -PSProvider FileSystem

# Clear service if it exist
$service = Get-Service -Name  "gokillprocess" -ErrorAction SilentlyContinue
if ($service.Length -gt 0) {
	
	$process_names = "gokillprocess", "go_killprocess"
	foreach ($pname in $process_names) {
		write-output $pname
		# find process with sc.exe
		$procid=(sc.exe queryex $pname | findstr "PID").Split(":")[1].replace(" ", "")
		
		# find process with get-process
		$procid2=(get-process $pname).id
		
		if ($procid -ne 0) {
			taskkill /F /PID $procid
		}
		
		if ($procid2 -ne 0) {
			taskkill /F /PID $procid2
		}
	}
	
	sc.exe delete "gokillprocess"
	
	Remove-Item -Force "c:\go_killprocess.exe"
	Remove-Item -Force "c:\gokillprocess\go_killprocess.exe"
	Remove-Item -Force "c:\gokillprocess.log"
}

# create dir
$process_folder = "C:\gokillprocess"
IF(!(test-path $process_folder))
{
	New-Item -ItemType Directory -Force -Path $process_folder
}

# Copy .exe to C:\gokillprocess
Copy-Item S:\windows\gokillprocess\go_killprocess.exe -destination $process_folder -Force

# create service using sc.exe
sc.exe create gokillprocess binpath="C:/gokillprocess/go_killprocess.exe" start=auto DisplayName="gokillprocess"

sc.exe description gokillprocess "gokillprocess"
net.exe start gokillprocess
sc.exe query gokillprocess

New-NetFirewallRule -DisplayName 'gokillprocessin' -Profile Any -Direction Inbound -Action Allow -Protocol TCP -LocalPort 5119
New-NetFirewallRule -DisplayName 'gokillprocessout' -Profile Any -Direction Outbound -Action Allow -Protocol TCP -LocalPort 5119