<#
    Upload and attach summary markdown to current timeline record.
    This summary shall be added to the build/release summary and not available for download with logs.

    ##vso[task.uploadsummary]local file path

    Examples:
        ##vso[task.uploadsummary]c:\testsummary.md

        It is a short hand form for the command
        ##vso[task.addattachment type=Distributedtask.Core.Summary;name=testsummaryname;]c:\testsummary.md
#>