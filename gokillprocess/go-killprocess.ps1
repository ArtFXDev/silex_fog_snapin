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
}

# Copy .exe to C:/
Copy-Item S:\windows\nssm\go_killprocess.exe -destination "c:\" -Force

# Create service
S:\windows\nssm\nssm.exe install gokillprocess C:\go_killprocess.exe

# for log
#S:\windows\nssm\nssm.exe set gokillprocess AppStdout C:\service.log
#S:\windows\nssm\nssm.exe set gokillprocess AppStderr C:\service-error.log

S:\windows\nssm\nssm.exe start gokillprocess