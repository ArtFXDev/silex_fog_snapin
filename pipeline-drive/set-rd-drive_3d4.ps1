#$user = $env:SERVER_USER
#$PWD = $env:SERVER_PASS
$user = "etudiant"
$PWD = "artfx2020"

$path = ("\\{0}" -f $args[0])
#$path += "\wip"

net use * /delete /yes

net use $path /user:$user $PWD
