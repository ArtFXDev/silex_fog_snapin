if((Get-SMBShare -Name "pipeline" -ea 0)){
	Remove-SmbShare -Name "pipeline" -Force
}

If ((Get-PSDrive).Name -eq 'P') {
	net use P: /delete
}
New-SmbShare -Name "pipeline" -Path "D:/Pipeline"
Grant-SmbShareAccess -Name "pipeline" -AccountName "Tout le monde" -AccessRight Full -Force
Grant-SmbShareAccess -Name "pipeline" -AccountName "Everyone" -AccessRight Full -Force
Get-SmbShareAccess -Name "pipeline"
Get-SmbShare
New-SmbMapping -LocalPath 'P:' -RemotePath '\\localhost\PIPELINE'
#net use P: \\localhost\PIPELINE /persistent:yes