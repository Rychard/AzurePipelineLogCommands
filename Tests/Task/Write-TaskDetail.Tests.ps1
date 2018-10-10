$projectRoot = Resolve-Path "${PSScriptRoot}\..\.."
$moduleRoot = Split-Path (Resolve-Path "${projectRoot}\**\*.psm1")
$moduleName = Split-Path $moduleRoot -Leaf

Import-Module (Join-Path $moduleRoot "${moduleName}.psm1") -Force

Describe 'Write-TaskDetail' {
    InModuleScope $moduleName {

        It 'Emits with specified Id' {
            $id = New-Guid
            $type = 'asdf'
            $name = 'sample-name'
            $order = 0
            Write-TaskDetail -Id $id -Type $type -Name $name -Order $order | Should Be "##vso[task.logdetail id=${id};type=${type};name=${name};order=${order};]"
        }

        It 'Allows configuring a parent Id' {
            $id = New-Guid
            $parentId = New-Guid
            $type = 'asdf'
            $name = 'sample-name'
            $order = 0
            Write-TaskDetail -Id $id -ParentId $parentId -Type $type -Name $name -Order $order | Should Be "##vso[task.logdetail id=${id};type=${type};name=${name};order=${order};parentid=${parentId};]"
        }

        It 'Allows a message to be specified' {
            $id = New-Guid
            $type = 'asdf'
            $name = 'sample-name'
            $order = 0
            $message = 'A sample message'

            Write-TaskDetail -Id $id -Type $type -Name $name -Order $order -Message $message | Should Be "##vso[task.logdetail id=${id};type=${type};name=${name};order=${order};]${message}"
        }
    }
}