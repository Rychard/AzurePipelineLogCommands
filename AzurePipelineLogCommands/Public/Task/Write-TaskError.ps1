<#
.SYNOPSIS
    Log errors to timeline record of current task.

.LINK
    https://github.com/Microsoft/vsts-tasks/blob/master/docs/authoring/commands.md
#>
Function Write-TaskError {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory=$false)]
        [String]$Message,

        [Parameter(Mandatory=$false)]
        [String]$SourcePath,

        [Parameter(Mandatory=$false)]
        [Int32]$LineNumber,

        [Parameter(Mandatory=$false)]
        [Int32]$ColumnNumber,

        [Parameter(Mandatory=$false)]
        [String]$Code
    )

    $PSBoundParameters.Add('Type', 'error')
    Write-TaskIssue @PSBoundParameters
}