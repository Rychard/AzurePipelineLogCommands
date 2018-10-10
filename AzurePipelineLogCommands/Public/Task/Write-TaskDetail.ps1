<#
.SYNOPSIS
    Creates a detail timeline record.

.LINK
    https://github.com/Microsoft/vsts-tasks/blob/master/docs/authoring/commands.md
#>
Function Write-TaskDetail {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory=$true)]
        [Guid]$Id,

        [Parameter()]
        [Guid]$ParentId,

        [Parameter(Mandatory=$true)]
        [String]$Type,

        [Parameter(Mandatory=$true)]
        [String]$Name,

        [Parameter(Mandatory=$true)]
        [String]$Order,

        [Parameter()]
        [String]$Message
    )

    $attributes = @(
        "id=${Id}",
        "type=${Type}",
        "name=${Name}",
        "order=${Order}"
    )

    if($ParentId) { $attributes += "parentid=${ParentId}" }

    $combined = $attributes -join ';'

    Write-Output "##vso[task.logdetail ${combined};]${Message}"
}