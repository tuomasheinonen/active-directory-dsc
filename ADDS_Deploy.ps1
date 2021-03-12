Install-WindowsFeature -Name AD-Domain-Services
Install-WindowsFeature -IncludeManagementTools RSAT

$Plainpassword = "4590!!#34!GraM02%%rgHyTT"
$Password = $Plainpassword | ConvertTo-SecureString -AsPlainText -Force 

$Params = @{
    CreateDnsDelegation = $false
    DatabasePath = 'C:\Windows\NTDS'
    DomainMode = 'WinThreshold'
    DomainName = 'thomasconcretegroup.net'
    DomainNetbiosName = 'tcg'
    ForestMode = 'WinThreshold'
    InstallDns = $true
    LogPath = 'C:\Windows\NTDS'
    NoRebootOnCompletion = $false
    SafeModeAdministratorPassword = $Password
    SysvolPath = 'C:\Windows\SYSVOL'
    Force = $true
}
 
Install-ADDSForest @Params
