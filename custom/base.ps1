
New-NetIPAddress -InterfaceAlias "Wired Ethernet Connection" -IPv4Address "172.16.237.100" -PrefixLength 22 -DefaultGateway 172.16.237.12

# disable password PasswordComplexity
secedit /export /cfg c:\new.cfg #carriage return
((get-content c:\new.cfg) -replace ('PasswordComplexity = 1', 'PasswordComplexity = 0')) | Out-File c:\new.cfg #carriage return
secedit /configure /db $env:windir\security\new.sdb /cfg c:\new.cfg /areas SECURITYPOLICY #carriage return
Rename-Item c:\new.cfg c:\new.cfg.txt #carriage return
rm c:\new.cfg.txt