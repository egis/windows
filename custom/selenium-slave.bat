netsh advfirewall firewall add rule name="IE driver" dir=in action=allow program="C:\windows\system32\iedriverserver.exe" enable=yes

netsh advfirewall firewall add rule name="FF driver" dir=in action=allow program="C:\windows\system32\chromedriver.exe" enable=yes


C:\extra\ChromeStandaloneSetup.exe  /silent /install
C:\extra\FirefoxSetup.exe /S
copy C:\extra\iedriverserver.exe  C:\windows\system32\
copy C:\extra\chromedriver.exe C:\windows\system32\
copy C:\extra\selenium* C:\
cd C:\

set ZONES=Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges

reg  add "HKCU\%ZONES%\Ranges1" /f /v ":Range" /d "191.*.*.*"
reg  add "HKCU\%ZONES%\Ranges1" /f /v "http" /t REG_DWORD /d 02
reg  add "HKLM\%ZONES%\Ranges1" /f /v "http" /t REG_DWORD /d 02
reg  add "HKLM\%ZONES%\Ranges1" /f /v ":Range" /d "191.*.*.*"

reg query "HKLM\%ZONES%\Range1"
reg query "HKCU\%ZONES%\Range1"
	

set IE=HKCU\SOFTWARE\Microsoft\Internet Explorer\Main
reg add "%IE%" /f /v "Disable Script Debugger" /d "yes"
reg add "%IE%" /f /v "Save_Session_History_On_Exit" /d "yes"
reg add "%IE%" /f /v "Show_FullURL" /d "yes"
reg add "%IE%" /f /v "Show_StatusBar" /d "yes"
reg add "%IE%" /f /v "DisableScriptDebuggerIE" /d "yes"
reg add "%IE%" /f /v "Start Page" /d "about:blank"
reg add "%IE%" /f /v "Search Page" /d "about:blank"
reg add "%IE%" /f /v "IE10RunOncePerInstallCompleted" /T REG_DWORD /d 1
reg add "%IE%" /f /v "IE10TourShown" /T REG_DWORD /d 1
reg add "%IE%" /f /v "DisableFirstRunCustomize" /T REG_DWORD /d 1
reg add "%IE%" /f /v "DoNotTrack" /T REG_DWORD /d 0
reg add "%IE%" /f /v "Show_FullURL" /d "yes"
reg add "%IE%" /f /v "Start Page Redirect Cache" /d "about:blank"
reg add "%IE%" /f /v "Default_Page_URL" /d "about:blank"
reg add "%IE%" /f /v "Default_Search_URL" /d "about:blank"
reg add "HKCU\Software\Microsoft\Internet Explorer\New Windows\" /F /V "PopupMgr" /T REG_SZ /D "no"

reg query "%IE%"

set IE=HKLM\SOFTWARE\Microsoft\Internet Explorer\Main
reg add "%IE%" /f /v "Disable Script Debugger" /d "yes"
reg add "%IE%" /f /v "Save_Session_History_On_Exit" /d "yes"
reg add "%IE%" /f /v "Show_FullURL" /d "yes"
reg add "%IE%" /f /v "Show_StatusBar" /d "yes"
reg add "%IE%" /f /v "DisableScriptDebuggerIE" /d "yes"
reg add "%IE%" /f /v "Start Page" /d "about:blank"
reg add "%IE%" /f /v "Search Page" /d "about:blank"
reg add "%IE%" /f /v "DisableFirstRunCustomize" /T REG_DWORD /d 1
reg add "%IE%" /f /v "IE10RunOncePerInstallCompleted" /T REG_DWORD /d 1
reg add "%IE%" /f /v "DoNotTrack" /T REG_DWORD /d 1
reg add "%IE%" /f /v "IE10TourShown" /T REG_DWORD /d 1
reg add "%IE%" /f /v "Show_FullURL" /d "yes"
reg add "%IE%" /f /v "Start Page Redirect Cache" /d "about:blank"
reg add "%IE%" /f /v "Default_Page_URL" /d "about:blank"
reg add "%IE%" /f /v "Default_Search_URL" /d "about:blank"
reg add "HKLM\Software\Microsoft\Internet Explorer\New Windows\" /F /V "PopupMgr" /T REG_SZ /D "no"
reg query "%IE%"


reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Run" /v "Selenium" /f /d "cmd /c C:\\selenium.bat"
reg add "HKLM\Software\Microsoft\Windows\Windows Error Reporting" /f /v "DontShowUI" /T REG_DWORD /d 1
reg add "HKLM\Software\Microsoft\Windows\Windows Error Reporting" /f /v "Disable" /T REG_DWORD /d 1
reg add "HKCU\Software\Microsoft\Windows\Windows Error Reporting" /f /v "DontShowUI" /T REG_DWORD /d 1
reg add "HKCU\Software\Microsoft\Windows\Windows Error Reporting" /f /v "Disable" /T REG_DWORD /d 1



