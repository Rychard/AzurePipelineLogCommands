$projectRoot = Resolve-Path "${PSScriptRoot}\..\.."
$moduleRoot = Split-Path (Resolve-Path "${projectRoot}\**\*.psm1")
$moduleName = Split-Path $moduleRoot -Leaf

Import-Module (Join-Path $moduleRoot "${moduleName}.psm1") -Force

Describe 'Complete-Task' {
    InModuleScope $moduleName {
        It 'Defaults to a Success message' {
            Complete-Task | Should Be "##vso[task.complete result=Succeeded;]"
        }

        It 'Allows customization of result type' {
            Complete-Task -Result SucceededWithIssues | Should Be "##vso[task.complete result=SucceededWithIssues;]"
            Complete-Task -Result Failed | Should Be "##vso[task.complete result=Failed;]"
            Complete-Task -Result Cancelled | Should Be "##vso[task.complete result=Cancelled;]"
            Complete-Task -Result Skipped | Should Be "##vso[task.complete result=Skipped;]"
        }

        It 'Allows a message to be specified' {
            $message = 'A sample message'
            Complete-Task -Message $message | Should Be "##vso[task.complete result=Succeeded;]${message}"
        }
    }
}