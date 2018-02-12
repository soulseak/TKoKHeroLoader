<#
    This Script gets all the latest Loadingstring in its Folder
    
    1) Get all txt files and sort by Latest Edited
    2) Get File Content
    3) Get Loadingstring located behind "Code:"
    4) Copy Loadingstring to Clipboard

#>

$characters = Get-ChildItem -Recurse | ?{ $_.PSIsContainer }

Write-Host "List of Characters"
$count = 0
foreach($character in $characters)
{
    Write-Host "\t" $count $character.Name
    $count++
}

Read-Host "Please Select Character"

$safeFiles = Get-Childitem -Filter "*.txt" | sort LastWriteTime -Descending
$lastSafeFile = Get-Content $safeFiles[0].Name
$loadingString = $lastSafeFile | Select-String -Pattern "Code:" -Context 1 | %{$_.Context.PostContext}
Set-Clipboard $loadingString