# Azure Pipeline Log Commands

[![Build status](https://rychard.visualstudio.com/AzurePipelineLogCommands/_apis/build/status/AzurePipelineLogCommands-CI)](https://rychard.visualstudio.com/AzurePipelineLogCommands/_build/latest?definitionId=1)

A PowerShell module that facilitates build script interaction within Azure Devops Pipelines

By default, `Import-Module` will import all functions with a prefix of `Vsts`.
You can configure this behavior by passing the `-Prefix` parameter to `Import-Module`.

Files prefixed with `_` are currently not implemented.

[Here's the documentation used as the reference for this repository](https://github.com/Microsoft/vsts-tasks/blob/master/docs/authoring/commands.md)

## Cmdlet Usage

Most of the implemented Cmdlets don't appear to work currently.

Those that *do* work are listed below.

### `Write-TaskError` (`Write-VstsTaskError`)

```powershell
Write-VstsTaskError -Message "This is an error" -SourcePath "C:\fake\path\error.ps1" -LineNumber 12 -ColumnNumber 34 -Code 'ERR-001'
```

### `Write-TaskWarning` (`Write-VstsTaskWarning`)

```powershell
Write-VstsTaskWarning -Message "This is a warning" -SourcePath "C:\fake\path\warning.ps1" -LineNumber 12 -ColumnNumber 34 -Code 'WARN-001'
```