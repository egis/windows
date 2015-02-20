netsh advfirewall firewall add rule name="IE driver" dir=in action=allow program="C:\windows\system32\iedriverserver.exe" enable=yes

netsh advfirewall firewall add rule name="FF driver" dir=in action=allow program="C:\windows\system32\chromedriver.exe" enable=yes


C:\extra\ChromeStandaloneSetup.exe  /silent /install
C:\extra\FirefoxSetup.exe /S
copy C:\extra\iedriverserver.exe  C:\windows\system32\
copy C:\extra\chromedriver.exe C:\windows\system32\
copy C:\extra\swarm-client-1.9-jar-with-dependencies.jar C:\

echo java -jar swarm-client-1.9-jar-with-dependencies.jar -master http://hudson.egis.local -labels windows7,selenium > C:\jenkins.bat

cd C:\

REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /V "jenkins" /t REG_SZ /F /D "C:\jenkins.bat"


