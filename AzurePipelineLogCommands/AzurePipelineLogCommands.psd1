@{
    RootModule = 'AzurePipelineLogCommands.psm1'
    ModuleVersion = '0.0.1'
    GUID = '9cacda28-0c5b-47ae-a99f-769516fe2624'
    Author = 'Joshua Shearer'
    CompanyName = ''
    Copyright = '(c) 2018 Joshua Shearer. All rights reserved.'
    Description = 'PowerShell module that facilitates build script interaction within Azure DevOps Pipelines'
    DefaultCommandPrefix = 'Vsts'
    PrivateData = @{
        PSData = @{
            Tags = 'PowerShell', 'VSTS', 'Azure DevOps', 'Pipelines'
            LicenseUri = 'https://github.com/Rychard/AzurePipelineLogCommands/blob/master/LICENSE'
            ProjectUri = 'https://github.com/Rychard/AzurePipelineLogCommands'
            ReleaseNotes = 'https://github.com/Rychard/AzurePipelineLogCommands/releases'
        }
    }
    FunctionsToExport = @(
        'Add-Artifact',
        'Add-ArtifactLink',

        'Add-BuildLog',
        'Add-BuildTag',
        'Set-BuildNumber',

        'Set-ReleaseName',

        'Add-TaskAttachment',
        'Add-TaskFile',
        'Add-TaskSummary',
        'Set-TaskEndpoint',
        'Complete-Task',
        'Set-TaskProgress',
        'Set-TaskVariable',
        'Write-TaskDetail',
        'Write-TaskError',
        'Write-TaskIssue',
        'Write-TaskWarning'
    )
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
}

