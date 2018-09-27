## Setup Guest Sharing For Team Sites ##

Created by Microsoft Corporation, 2018. 
Provided as-is without warranty. 
Trademarks mentioned here are the property of their owners.

SharePoint Online has both global (tenant-wide) and site collection settings for external sharing. The tenant-level settings override any settings at the site collection level. For setting up Sharing with anonymous users, both global and site collection settings has to be turned on. See [Turn external sharing on or off for SharePoint Online](https://support.office.com/en-us/article/turn-external-sharing-on-or-off-for-sharepoint-online-6288296a-b6b7-4ea4-b4ed-c297bf833e30).

For O365 group sites (including Microsoft Teams), the sites created do not have sharing with anonymous users turned on by default. Instead of turning it on manually for each site, the uploaded powershell script allows to set all the modern groups or Team sites sharing capability to ExternalUserAndGuestSharing in an SPO tenant. It enables the creation of anonymous or guest links allowing users to view the content without logging in. This is needed for the class notebook parent and guardian links to work.

IMPORTANT:
- If sharing with anonymous users is enabled globally on the tenant and for group sites, then any member of the group can share anonymous links in the corresponding site.
- Tenant admin can always disable external sharing by turning it off globally. See  [Turn external sharing on or off for SharePoint Online](https://support.office.com/en-us/article/turn-external-sharing-on-or-off-for-sharepoint-online-6288296a-b6b7-4ea4-b4ed-c297bf833e30)

### Prerequisites ###
Before you begin running the Scripts, review the following information about prerequisites:

- Set up the SharePoint Online Management Shell environment

Also verify the following:
- The tenant admin is a Global Administrator in Office 365 for enterprises.
- The tenant admin is a member of the Administrators group on the server on which you are running the Windows PowerShell script.

### SetupGuestSharingForTeamSites.ps1 ###

The PowerShell script contains a cmdlet that can be made available by loading the script

    . .\SetupGuestSharingForTeamSites.ps1

The cmdlets is as follows:

    Set-ExternalUserAndGuestSharingForTeamSites

It can be used to set the team sites to enable external user And guest sharing. 

### Example ###
From the SharePoint Online Management Shell, run the following:

    C:\powershell\Connect-SPOService -Url https://contoso-admin.sharepoint.com

    C:\powershell\ . .\SetupGuestSharingForTeamSites.ps1
    
    C:\powershell\Set-ExternalUserAndGuestSharingForTeamSites
    
        Fetching all the group sites
        Found [7567] group sites

        Filtering out the sites that have ExternalUserAndGuestSharing enabled
        Found [6621] group sites to be enabled
        Updating the sharing Capability of the following sites to ExternalUserAndGuestSharing

        1- https://contoso.sharepoint.com/sites/Math101
        2- https://contoso.sharepoint.com/sites/English202
        3- https://contoso.sharepoint.com/sites/Math304
        ...
        
