using namespace System.Net

# Input bindings are passed in via param block.
param($Request, $TriggerMetadata)

# Write to the Azure Functions log stream.
Write-Host "PowerShell HTTP trigger function processed a request."

# Create an object to store all Resume data.
$ResumeData = [pscustomObject]@{
    firstName       = "Aarit"
    lastName        = "Singh"
    location        = @{
        city        = 'Bangalore'
        CountryCode = 'India'
    }
    currentPosition = "Cloud Engineer"
    "profiles"      = @(
        @{
            network = "Facebook"
            "url"   = "https://facebook.com/aaritsingh"
        }
    )

}

# Associate values to output bindings by calling 'Push-OutputBinding'.
Push-OutputBinding -Name Response -Value ([HttpResponseContext]@{
    StatusCode = [HttpStatusCode]::OK
    # Change the object to a JSON file to return to the requester
    Body       = ($ResumeData | ConvertTo-Json)
})
