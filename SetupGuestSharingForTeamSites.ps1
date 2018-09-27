function Set-ExternalUserAndGuestSharingForTeamSites
{
    <#
    .Synopsis
        Allows to set all the modern groups or Team sites sharing capability to ExternalUserAndGuestSharing in an SPO tenant. It enables the creation of anonymous or guest links allowing users to view the content without logging in.
    
    .Description
        This cmdlet can be used to set the team sites to enable external user And guest sharing. This is needed for the class notebook parent links to work.

    .Example
        Set-ExternalUserAndGuestSharingForTeamSites
    
    #>

    [CmdletBinding()]
    param()      
	    try
	    {
            Write-Host "`nFetching all the group sites"
            $moderngroupsites = Get-SPOSite -Template GROUP#0 -IncludePersonalSite:$false -Limit all | Select-Object -Property SharingCapability, Url
            Write-Host "Found [$($moderngroupsites.Length)] group sites"

            write-Host "`nFiltering out the sites that have ExternalUserAndGuestSharing enabled"
            $listCollection = New-Object System.Collections.Generic.List[object]
            foreach ($moderngroupsite in $moderngroupsites) 
            { 
                if ($moderngroupsite.SharingCapability -ne "ExternalUserAndGuestSharing")
                {
                    $listCollection.Add($moderngroupsite)
                }
            }

            Write-Host "Found [$($listCollection.count)] group sites to be enabled"
            Write-Host "Updating the sharing Capability of the following sites to ExternalUserAndGuestSharing `n"
            $i=1
            
            foreach ($site in $listCollection) 
            { 
                try
                {
                    Write-Host $i- "$($site.Url)"
                    $i = $i + 1
                    Set-SPOSite -Identity $site.Url -SharingCapability ExternalUserAndGuestSharing 
                }
                catch
                {
                    Write-Host
                    Write-Host $_.Exception.Message
                    Write-Host
                }
            }

	    }
        catch
        {
            Write-Host $_.Exception.ToString()
            throw $_
        }
}