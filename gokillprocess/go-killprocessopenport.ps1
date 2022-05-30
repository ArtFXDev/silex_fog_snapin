New-NetFirewallRule -DisplayName 'gokillprocessin' -Profile Any -Direction Inbound -Action Allow -Protocol TCP -LocalPort 5119
New-NetFirewallRule -DisplayName 'gokillprocessout' -Profile Any -Direction Outbound -Action Allow -Protocol TCP -LocalPort 5119

New-NetFirewallRule -DisplayName 'silexdesktopout' -Profile Any -Direction Outbound -Action Allow -Protocol TCP -LocalPort 5118
New-NetFirewallRule -DisplayName 'silexdesktopin' -Profile Any -Direction Inbound -Action Allow -Protocol TCP -LocalPort 5118

New-NetFirewallRule -DisplayName 'tractorout' -Profile Any -Direction Outbound -Action Allow -Protocol TCP -LocalPort 9005
New-NetFirewallRule -DisplayName 'tractorin' -Profile Any -Direction Inbound -Action Allow -Protocol TCP -LocalPort 9005

Remove-NetFirewallRule -DisplayName "silex-desktop.exe"
