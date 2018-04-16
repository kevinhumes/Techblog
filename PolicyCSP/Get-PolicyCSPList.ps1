$policyCSPEntries=Get-ChildItem -Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\default" -Recurse | Where-Object {$_.PSIsContainer} | Select Name, PSChildName



$windosBuild= Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion" -Name CurrentBuild



$policyCSPEntries| Export-Csv -Path $(Join-Path -Path $PSScriptRoot -ChildPath "CSPPolicyList_W10-$($windosBuild.CurrentBuild).csv") -Delimiter "," -NoTypeInformation -Force


