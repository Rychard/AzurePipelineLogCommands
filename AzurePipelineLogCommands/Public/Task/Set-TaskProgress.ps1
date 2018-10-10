<#
.SYNOPSIS
    Set progress and current operation for current task.

.LINK
    https://github.com/Microsoft/vsts-tasks/blob/master/docs/authoring/commands.md
#>
Function Set-TaskProgress {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory=$true)]
        [Int32]$Value,

        [Parameter(Mandatory=$false)]
        [String]$Message
    )

    Write-Output "##vso[task.setprogress value=${Value};]${Message}"
}