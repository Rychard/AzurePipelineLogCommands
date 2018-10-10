<#
.SYNOPSIS
    Finish timeline record for current task, set task result and current operation.

.LINK
    https://github.com/Microsoft/vsts-tasks/blob/master/docs/authoring/commands.md
#>
Function Complete-Task {
    [CmdletBinding()]
    Param (
        [Parameter()]
        [ValidateSet('Succeeded', 'SucceededWithIssues', 'Failed', 'Cancelled', 'Skipped')]
        [String]$Result = 'Succeeded',

        [Parameter()]
        [String]$Message
    )

    Write-Output "##vso[task.complete result=${Result};]${Message}"
}