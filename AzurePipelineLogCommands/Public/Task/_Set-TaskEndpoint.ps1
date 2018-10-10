<#
    Set an endpoint field with given value.
    Value updated will be retained in the endpoint for the subsequent tasks that execute within the same job.

    id=endpoint id (Required)
    field=field type authParameter|dataParameter|url (Required)
    key=key (Required. Except for field=url)
    value=value for key or url(Required)

    Examples:
        ##vso[task.setendpoint id=000-0000-0000;field=authParameter;key=AccessToken]testvalue
        ##vso[task.setendpoint id=000-0000-0000;field=dataParameter;key=userVariable]testvalue
#>