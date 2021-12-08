If ((Get-PSDrive).Name -eq 'P') {
	net use P: /delete
}

$path = "\\{0}" -f $args[0]
net use $path /user:promo_td_2022 @rtfx2021

$path += "\PIPELINE"
New-SmbMapping -LocalPath P: -RemotePath $path -Persistent $False
