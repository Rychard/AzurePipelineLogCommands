<#
    Upload and attach attachment to current timeline record.
    These files are not available for download with logs.
    These can only be referred to by extensions using the type or name values.

    ##vso[task.addattachment]value

    type=attachment type (Required)
    name=attachment name (Required)

    Example:
        ##vso[task.addattachment type=myattachmenttype;name=myattachmentname;]c:\myattachment.txt
#>