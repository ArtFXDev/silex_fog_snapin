@echo off
net use * /delete /yes
subst P: "D:\Pipeline"
net use Z: \\marvin\installers /USER:etudiant artfx2020 /persistent:yes
rem net use P: \\localhost\PIPELINE /persistent:yes
rem net use Y: \\marvin\WIP /USer:etudiant artfx2020 /persistent:yes
exit 0