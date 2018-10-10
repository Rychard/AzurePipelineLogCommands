$projectRoot = Resolve-Path "${PSScriptRoot}\..\.."
$moduleRoot = Split-Path (Resolve-Path "${projectRoot}\**\*.psm1")
$moduleName = Split-Path $moduleRoot -Leaf

Import-Module (Join-Path $moduleRoot "${moduleName}.psm1") -Force

Describe 'Set-TaskVariable' {
    InModuleScope $moduleName {

        It 'Sets a normal variable' {
            $name = 'sampleVar'
            $value = 'sampleValue'
            Set-TaskVariable -Name $name -Value $value | Should Be "##vso[task.setvariable variable=${name};]${value}"
        }

        It 'Sets a secret variable' {
            $name = 'sampleVar'
            $value = 'sampleValue'
            Set-TaskVariable -Name $name -Value $value -Secret | Should Be "##vso[task.setvariable variable=${name};issecret=true;]${value}"
        }
    }
}