<#
    Create an artifact link, artifact location is required to be a file container path, VC path or UNC share path.

    ##vso[artifact.associate]artifact location

    artifactname=artifact name (Required)
    type=container|filepath|versioncontrol|gitref|tfvclabel, artifact type (Required)

    Examples:
        ##vso[artifact.associate type=container;artifactname=MyServerDrop]#/1/build
        ##vso[artifact.associate type=filepath;artifactname=MyFileShareDrop]\\MyShare\MyDropLocation
        ##vso[artifact.associate type=versioncontrol;artifactname=MyTfvcPath]$/MyTeamProj/MyFolder
        ##vso[artifact.associate type=gitref;artifactname=MyTag]refs/tags/MyGitTag
        ##vso[artifact.associate type=tfvclabel;artifactname=MyTag]MyTfvcLabel
#>