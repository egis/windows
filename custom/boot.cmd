mkdir C:\extra
cd C:\extra

A:\wget -r -nHv --cut-dirs=1  http://hub.papertrail.co.za/extra/

copy C:\extra\BGInfo.exe %SYSTEMROOT%\
copy C:\extra\screen.bgi %SYSTEMROOT%\

echo %SYSTEMROOT%\BGInfo.exe %SYSTEMROOT%\screen.bgi /timer:0 /silent /NOLICPROMPT > %SYSTEMROOT%\boot.bat
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /V "boot" /t REG_SZ /F /D "%SYSTEMROOT%\boot.bat"

@powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin

%ALLUSERSPROFILE%\chocolatey\bin\choco install -y -allow-empty-checksums classic-shell notepadplusplus.install sublimetext2 fiddler dbeaver consolez tailblazer speccy win-no-annoy babun


if defined ProgramFiles(x86) (
	echo installing java
	setx JAVA_HOME "C:\Program Files\Java\jdk1.8.0_31"
	C:\extra\jdk.exe /s
	msiexec   /qb /i C:\extra\7z935-x64.msi INSTALLDIR="C:\Program Files\7-Zip"
	C:\extra\VMware-tools-9.4.10-2068191-x86_64.exe /S /v "/qn REBOOT=R ADDLOCAL=ALL"
	setx PATH "%PATH%;C:\Program Files\7-Zip;"
) else (
	echo installing java
	setx JAVA_HOME "C:\Program Files\Java\jdk1.8.0_31"
	C:\extra\jdk32.exe /s
	msiexec  /qb /i C:\extra\7z935.msi   INSTALLDIR="C:\Program Files\7-Zip"
	C:\extra\VMware-tools-9.4.10-2068191-i386.exe  /S /v "/qn REBOOT=R ADDLOCAL=ALL"

	setx PATH "%PATH%;C:\Program Files\7-Zip;"
)


netsh Advfirewall set allprofiles state off

reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f

netsh interface portproxy add v4tov4 listenport=8101 listenaddress=0.0.0.0 connectport=8101 connectaddress=172.16.100.1
netsh interface portproxy add v4tov4 listenport=8102 listenaddress=0.0.0.0 connectport=8102 connectaddress=172.16.100.1
