# Import the Active Directory module
Import-Module ActiveDirectory

# Path to your CSV file - using relative path to the script location
$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Path
$csvFile = Join-Path -Path $scriptPath -ChildPath "OUstructure.csv"

# Import the CSV data
$ouList = Import-Csv -Path $csvFile

# Retrieve the domain's distinguished name (DN)
$domainDN = (Get-ADDomain).DistinguishedName

foreach ($ou in $ouList) {
    $ouName = $ou.OUName.Trim()
    
    # Determine the parent DN:
    # If ParentDN is blank, then the OU will be created at the domain root.
    if ([string]::IsNullOrEmpty($ou.ParentDN)) {
        $parentDN = $domainDN
    } else {
        $parentDN = $ou.ParentDN.Trim()
    }
    
    # Construct the new OU's DN (for logging purposes)
    $newOUDN = "OU=$ouName,$parentDN"
    
    try {
        # Check if the OU already exists to avoid duplicates
        $existingOU = Get-ADOrganizationalUnit -Filter "DistinguishedName -eq '$newOUDN'" -ErrorAction SilentlyContinue
        if ($null -eq $existingOU) {
            # Create the new OU
            New-ADOrganizationalUnit -Name $ouName -Path $parentDN -ProtectedFromAccidentalDeletion $true
            Write-Host "Created OU: $newOUDN" -ForegroundColor Green
        } else {
            Write-Host "OU already exists: $newOUDN" -ForegroundColor Yellow
        }
    }
    catch {
        Write-Warning "Failed to create OU '$ouName' in '$parentDN'. Error: $_"
    }
}
