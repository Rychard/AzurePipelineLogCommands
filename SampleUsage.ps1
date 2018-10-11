Import-Module .\AzurePipelineLogCommands

Write-VstsTaskWarning -Message "This is a warning" -SourcePath "C:\fake\path\warning.ps1" -LineNumber 12 -ColumnNumber 1 -Code 'WARN-001'
Write-VstsTaskError -Message "This is an error" -SourcePath "C:\fake\path\error.ps1" -LineNumber 12 -ColumnNumber 34 -Code 'ERR-001'

$parentId = New-Guid
Write-VstsTaskDetail -Id $parentId -Type 'Sample' -Name 'This is a name' -Order 0 -Message "Currently doing nothing"
Set-VstsTaskVariable -Name 'SAMPLEVARIABLE' -Value 'SAMPLE VALUE'
Set-VstsTaskProgress -Value 25 -Message 'Setting the progress'
Write-VstsTaskWarning -Message "This is a warning" -SourcePath "C:\fake\path\warning.ps1" -LineNumber 34 -ColumnNumber 1 -Code 'WARN-002'
Write-VstsTaskDetail -Id $parentId -Type 'Sample' -Name 'This is a name' -Order 0 -Message "??? One"

$childId1 = New-Guid
Write-VstsTaskDetail -Id $childId1 -ParentId $parentId -Type 'Sample1' -Name 'This is a child' -Order 0 -Message "I guess nothing?"
Write-VstsTaskWarning -Message "This is a warning" -SourcePath "C:\fake\path\warning.ps1" -LineNumber 56 -ColumnNumber 1 -Code 'WARN-003'
Set-VstsTaskVariable -Name 'SECRETVARIABLE' -Value 'hunter2' -Secret
Complete-VstsTask -Message "Uh... Complete?"
Set-VstsTaskProgress -Value 50 -Message 'nearly there'
Write-VstsTaskDetail -Id $parentId -Type 'Sample' -Name 'This is a name' -Order 0 -Message "??? Two"

$childId2 = New-Guid
Write-VstsTaskDetail -Id $childId2 -ParentId $parentId -Type 'Sample2' -Name 'This is another child' -Order 2 -Message "Also nothing"
Write-VstsTaskWarning -Message "This is a warning" -SourcePath "C:\fake\path\warning.ps1" -LineNumber 78 -ColumnNumber 1 -Code 'WARN-004'
Complete-VstsTask -Message "Uh... Complete?"
Set-VstsTaskProgress -Value 75 -Message 'almost...'
Write-VstsTaskDetail -Id $parentId -Type 'Sample' -Name 'This is a name' -Order 0 -Message "??? Three"

$childId3 = New-Guid
Write-VstsTaskDetail -Id $childId3 -ParentId $parentId -Type 'Sample3' -Name 'This is another child' -Order 1 -Message "Order is before previous task"
Write-VstsTaskWarning -Message "This is a warning" -SourcePath "C:\fake\path\warning.ps1" -LineNumber 90 -ColumnNumber 1 -Code 'WARN-005'
Complete-VstsTask -Message "Uh... Complete?"
Set-VstsTaskProgress -Value 90 -Message 'so close!!!'
Write-VstsTaskDetail -Id $parentId -Type 'Sample' -Name 'This is a name' -Order 0 -Message "??? Four"

Complete-VstsTask -Message "All Complete?"
Write-VstsTaskWarning -Message "This is a warning" -SourcePath "C:\fake\path\warning.ps1" -LineNumber 120 -ColumnNumber 1 -Code 'WARN-006'
Write-VstsTaskDetail -Id $parentId -Type 'Sample' -Name 'This is a name' -Order 0 -Message "??? Five?"
Write-VstsTaskWarning -Message "This is a warning" -SourcePath "C:\fake\path\warning.ps1" -LineNumber 340 -ColumnNumber 1 -Code 'WARN-007'
Write-VstsTaskError -Message "This is an error" -SourcePath "C:\fake\path\error.ps1" -LineNumber 340 -ColumnNumber 2 -Code 'ERR-002'