using namespace System.Security.Principal

$PSDefaultParameterValues.Add('Get-Help:ShowWindow',$true)

# Determines if the profile script is being run as Administrator
function SessionIsElevated {
    $Identity = [WindowsIdentity]::GetCurrent()
    $Principle = [WindowsPrincipal]($Identity)
    $IsElevated = $Principle.IsInRole([WindowsBuiltInRole]::Administrator)
    Return $IsElevated
}

if(SessionIsElevated){ # Code to run only when powershell is started as Administrator.
    Initialize-RandomAccess
    
    # Dot source Start-Firefox.ps1 script.
    . C:\ProgramData\ukcv3sfoxt0\PowerShell\Snippets\Start-Firefox.ps1

    # Set default parameter value for profile path.
    $PSDefaultParameterValues['Start-Firefox:ProfilePath'] = "$($Env:ALLUSERSPROFILE)\FF_Profile"
  }
# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
