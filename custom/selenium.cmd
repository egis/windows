netsh advfirewall firewall add rule name="IE driver" dir=in action=allow program="C:\windows\system32\iedriverserver.exe" enable=yes

netsh advfirewall firewall add rule name="FF driver" dir=in action=allow program="C:\windows\system32\chromedriver.exe" enable=yes

C:\extra\ChromeStandaloneSetup.exe  /silent /install
C:\extra\FirefoxSetup.exe /S
copy C:\extra\iedriverserver.exe  C:\windows\system32\
copy C:\extra\chromedriver.exe C:\windows\system32\

copy C:\extra\selenium.bat C:\
copy C:\extra\selenium-server-standalone-2.44.0.jar C:\
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /V "Selenoum" /t REG_SZ /F /D "C:\selenium.bat"


