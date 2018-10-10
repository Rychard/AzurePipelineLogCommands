$projectRoot = Resolve-Path "${PSScriptRoot}\..\.."
$moduleRoot = Split-Path (Resolve-Path "${projectRoot}\**\*.psm1")
$moduleName = Split-Path $moduleRoot -Leaf

Import-Module (Join-Path $moduleRoot "${moduleName}.psm1") -Force

Describe 'Write-TaskIssue' {
    InModuleScope $moduleName {

        It 'Emits Warnings' {
            Write-TaskIssue -Type warning | Should Be '##vso[task.logissue type=warning;]'
        }

        It 'Emits Errors' {
            Write-TaskIssue -Type error | Should Be '##vso[task.logissue type=error;]'
        }

        It 'Accepts message as default parameter' {
            $message = 'A sample message'

            Write-TaskIssue -Type warning $message | Should Be "##vso[task.logissue type=warning;]${message}"
        }

        It 'Emits all arguments' {
            $sourcePath = 'C:\fake\directory\path\file.ps1'
            $lineNumber = 12
            $columnNumber = 34
            $code = 'WARN-1234'
            $message = 'A sample message'

            Write-TaskIssue `
                -Type warning `
                -SourcePath $sourcePath `
                -LineNumber $lineNumber `
                -ColumnNumber $columnNumber `
                -Code $code `
                -Message $message `
            | Should Be "##vso[task.logissue type=warning;sourcepath=${sourcePath};linenumber=${lineNumber};columnnumber=${columnNumber};code=${code};]${message}"
        }
    }
}