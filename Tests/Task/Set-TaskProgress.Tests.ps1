$projectRoot = Resolve-Path "${PSScriptRoot}\..\.."
$moduleRoot = Split-Path (Resolve-Path "${projectRoot}\**\*.psm1")
$moduleName = Split-Path $moduleRoot -Leaf

Import-Module (Join-Path $moduleRoot "${moduleName}.psm1") -Force

Describe 'Set-TaskProgress' {
    InModuleScope $moduleName {

        It 'Sets progress value correctly' {
            $value = 50
            $message = 'A sample message'

            Set-TaskProgress -Value $value -Message $message | Should Be "##vso[task.setprogress value=${value};]${message}"
        }
    }
}