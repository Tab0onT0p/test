@echo off


reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v EnablePrefetcher /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v EnableSuperfetch /t REG_DWORD /d 0 /f



sc stop diagtrack
sc stop sysmain
sc stop pcasvc
sc stop eventlog
sc stop dps
sc stop vmicvss 
sc stop VSS
sc stop Pcasvc
sc config diagtrack start= disabled
sc config sysmain start= disabled
sc config pcasvc start= disabled
sc config eventlog start= disabled
sc config dps start= disabled
sc config vmicvss start= disabled
sc config VSS start= disabled
sc config Pcasvc start= disabled


exit
