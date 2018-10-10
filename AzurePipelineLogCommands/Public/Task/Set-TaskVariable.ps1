<#
.SYNOPSIS
    Sets a variable in the variable service of taskcontext.
    The first task can set a variable, and following tasks in the same phase are able to use the variable.
    The variable is exposed to the following tasks as an environment variable.
    When 'Secret' is set to true, the value of the variable will be saved as secret and masked out from log.
    Secret variables are not passed into tasks as environment variables and must be passed as inputs.

.LINK
    https://github.com/Microsoft/vsts-tasks/blob/master/docs/authoring/commands.md
#>
Function Set-TaskVariable {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory=$true)]
        [String]$Name,

        [Parameter(Mandatory=$true)]
        [String]$Value,

        [Parameter()]
        [Switch]$Secret
    )

    $attributes = @(
        "variable=${Name}"
    )

    if($Secret.IsPresent) { $attributes += "issecret=true" }

    $combined = $attributes -join ';'

    Write-Output "##vso[task.setvariable ${combined};]${Value}"
}