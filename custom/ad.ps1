

New-NetIPAddress -InterfaceAlias "Wired Ethernet Connection" -IPv4Address "172.16.237.100" -PrefixLength 22 -DefaultGateway 172.16.237.12

# disable password PasswordComplexity
secedit /export /cfg c:\new.cfg #carriage return
((get-content c:\new.cfg) -replace ('PasswordComplexity = 1', 'PasswordComplexity = 0')) | Out-File c:\new.cfg #carriage return
secedit /configure /db $env:windir\security\new.sdb /cfg c:\new.cfg /areas SECURITYPOLICY #carriage return
Rename-Item c:\new.cfg c:\new.cfg.txt #carriage return
rm c:\new.cfg.txt

Import-Module  ServerManager
Add-WindowsFeature "RSAT-AD-Tools"

start-job -Name addFeature -ScriptBlock { 
Add-WindowsFeature -Name "ad-domain-services" -IncludeAllSubFeature -IncludeManagementTools 
Add-WindowsFeature -Name "dns" -IncludeAllSubFeature -IncludeManagementTools 
Add-WindowsFeature -Name "gpmc" -IncludeAllSubFeature -IncludeManagementTools } 
Wait-Job -Name addFeature


$domainname = "corp.egis-software.com"
$netbiosName = "CORP" 

Import-Module ADDSDeployment 
Install-ADDSForest -CreateDnsDelegation:$false `
-DatabasePath "C:\Windows\NTDS" `
-DomainMode "Win2012" `
-DomainName $domainname `
-DomainNetbiosName $netbiosName `
-ForestMode "Win2012" `
-InstallDns:$true `
-LogPath "C:\Windows\NTDS" `
-NoRebootOnCompletion:$false `
-SysvolPath "C:\Windows\SYSVOL" `
-safemodeadministratorpassword (convertto-securestring "Password1" -asplaintext -force) `
-Force:$true