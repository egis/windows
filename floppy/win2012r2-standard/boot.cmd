D:\extra\dotNetFx40_Client_x86_x64.exe /passive
@powershell -NoProfile -ExecutionPolicy unrestricted -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin

netsh advfirewall firewall add rule name="Java" dir=in action=allow program="C:\windows\system32\java.exe" enable=yes

netsh advfirewall firewall add rule name="IE driver" dir=in action=allow program="iedriverserver.exe" enable=yes

netsh advfirewall firewall add rule name="FF driver" dir=in action=allow program="chromedriverserver.exe" enable=yes

D:\extra\ChromeStandaloneSetup.exe  /silent /install
D:\extra\jdk.exe /s
D:\extra\FirefoxSetup35.0.1.exe /S

copy D:\extra\BGInfo.exe C:\
copy D:\extra\screen.bgi C:\
copy D:\extra\boot.bat C:\
copy D:\extra\selenium.bat C:\
copy D:\extra\selenium-server-standalone-2.44.0.jar C:\
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /V "Selenoum" /t REG_SZ /F /D "C:\selenium.bat"
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /V "boot" /t REG_SZ /F /D "C:\boot.bat"
choco install chromedriver2
choco install iedriverserver
choco install 7zip


