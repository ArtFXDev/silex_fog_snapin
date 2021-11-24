# Resilio Agent deployment
Script usage and deployment with fog


## Merge config and .MSI
To facilitate the deployment with fog, you can use the script "attach-sync-conf-to-msi" with this command : 

```
powershell.exe -ExecutionPolicy Bypass -Noprofile ./attach-sync-conf-to-msi.ps1 -MSIPath .\Resilio-Connect-Agent_x64.msi -SyncConfPath .\sync.conf
```

This will give you a single msi. You can now put this msi in new fog snapin and make the deployment.
