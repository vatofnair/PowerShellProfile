# Make powershell help open in a new window by default.
$PSDefaultParameterValues.Add('Get-Help:ShowWindow',$true)

# Chocolatey profile.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
