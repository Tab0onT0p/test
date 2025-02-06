@echo off



reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v EnablePrefetcher /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v EnableSuperfetch /t REG_DWORD /d 3 /f



sc config diagtrack start= auto
sc start diagtrack
sc config sysmain start= auto
sc start sysmain
sc config pcasvc start= auto
sc start pcasvc
sc config eventlog start= auto
sc start eventlog
sc config dps start= auto
sc start dps
sc config vmicvss start= auto
sc start vmicvss
sc config VSS start= auto
sc start VSS
sc config Pcasvc start= auto
sc start Pcasvc


exit