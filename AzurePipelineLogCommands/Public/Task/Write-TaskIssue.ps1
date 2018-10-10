<#
.SYNOPSIS
    Log error or warning issue to timeline record of current task.

.LINK
    https://github.com/Microsoft/vsts-tasks/blob/master/docs/authoring/commands.md
#>
Function Write-TaskIssue {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory=$true, Position=0)]
        [ValidateSet("error", "warning")]
        [String]$Type,

        [Parameter(Mandatory=$false, Position=1)]
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

    $attributes = @(
        "type=${Type}"
    )

    if($SourcePath) { $attributes += "sourcepath=${SourcePath}" }
    if($LineNumber) { $attributes += "linenumber=${LineNumber}" }
    if($ColumnNumber) { $attributes += "columnnumber=${ColumnNumber}" }
    if($Code) { $attributes += "code=${Code}" }

    $combined = $attributes -join ';'

    Write-Output "##vso[task.logissue ${combined};]${Message}"
}