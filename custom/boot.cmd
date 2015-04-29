netsh advfirewall firewall add rule name="Java" dir=in action=allow program="C:\windows\system32\java.exe" enable=yes

reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f

netsh advfirewall firewall add rule name="rdp" dir=in action=allow protocol=TCP localport=3389

mkdir C:\extra
cd C:\extra

wget -r -nHv --cut-dirs=1 http://hub.papertrail.co.za/extra/

copy C:\extra\BGInfo.exe %SYSTEMROOT%\
copy C:\extra\screen.bgi %SYSTEMROOT%\

echo %SYSTEMROOT%\BGInfo.exe %SYSTEMROOT%\screen.bgi /timer:0 /silent /NOLICPROMPT > %SYSTEMROOT%\boot.bat
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /V "boot" /t REG_SZ /F /D "%SYSTEMROOT%\boot.bat"

if defined ProgramFiles(x86) (
	echo installing java
	setx JAVA_HOME "C:\Program Files\Java\jdk1.8.0_31"
	C:\extra\jdk.exe /s
	msiexec   /qb /i C:\extra\7z935-x64.msi INSTALLDIR="C:\Program Files\7-Zip"
	setx PATH "%PATH%;C:\Program Files\7-Zip;"
	echo installing vmware tools
	C:\extra\VMware-tools-9.4.10-2068191-x86_64.exe /S /v "/qn REBOOT=R ADDLOCAL=ALL"
) else (
	echo installing java
	setx JAVA_HOME "C:\Program Files\Java\jdk1.8.0_31"
	C:\extra\jdk32.exe /s
	msiexec  /qb /i C:\extra\7z935.msi   INSTALLDIR="C:\Program Files\7-Zip"
	setx PATH "%PATH%;C:\Program Files\7-Zip;"
	echo installing vmware tools
	C:\extra\VMware-tools-9.4.10-2068191-i386.exe  /S /v "/qn REBOOT=R ADDLOCAL=ALL"
)


