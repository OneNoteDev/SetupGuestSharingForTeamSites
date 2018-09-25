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
            $moderngroupsites = Get-SPOSite -Template GROUP#0 -IncludePersonalSite:$false -Limit ALL
            Write-Host "Found [$($moderngroupsites.Length)] group sites"
            Write-Host "Updating the sharing Capability of the following sites to ExternalUserAndGuestSharing `n"
            $i=1
            
            foreach ($site in $moderngroupsites) 
            { 
                Write-Host $i- "$($site.Url)"
                Set-SPOSite -Identity $site.Url -SharingCapability ExternalUserAndGuestSharing 
                $i = $i + 1
            }

	    }
        catch
        {
            Write-Host $_.Exception.ToString()
            throw $_
        }
}