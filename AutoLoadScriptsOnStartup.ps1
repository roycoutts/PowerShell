# In order for those scripts to be executed, the policy needs to be updated to something else than “restricted”, at least “remotesigned” by running the following:
#  Set-ExecutionPolicy remoteSigned

# directory where my scripts are stored
$psdir=“D:\Documents\Powershell\Scripts\autoload” 

# load all ‘autoload’ scripts
Get-ChildItem “${psdir}\*.ps1” | %{.$_}

Write-Host “Custom PowerShell Environment Loaded” 
