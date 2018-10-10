<#
    Upload local file into a file container folder, create artifact if artifactname provided.

    ##vso[artifact.upload]local file path

    containerfolder=folder that the file will upload to, folder will be created if needed. (Required)
    artifactname=artifact name

    Example:
        ##vso[artifact.upload containerfolder=testresult;artifactname=uploadedresult;]c:\testresult.trx

#>