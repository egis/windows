

C:\extra\sql2014.exe /SAPWD=ohHuGh7c /SECURITYMODE=SQL  /TCPENABLED=1 /SQLSVCSTARTUPTYPE=Automatic /IACCEPTSQLSERVERLICENSETERMS /Q /ACTION=install /INSTANCEID=MSSQLSERVER /INSTANCENAME=MSSQLSERVER /UPDATEENABLED=FALSE /INDICATEPROGRESS

netsh advfirewall firewall add rule name="sql server" dir=in action=allow protocol=TCP localport=1433


C:\extra\git.exe /silent 
setx PATH "%PATH%;C:\Program Files (x86)\Git\bin;"
ping -n 30 127.0.0.1 > nul

msiexec /i C:\extra\node.msi /quiet /qn /norestart 
ping -n 10 127.0.0.1 > nul

msiexec /i  C:\extra\LibreOffice_Win_x86.msi /quiet /qn /norestart 
copy C:\extra\apache-ant-1.9.4-bin.zip C:\


