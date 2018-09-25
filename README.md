## Setup Guest Sharing For Team Sites ##
Created by Microsoft Corporation, 2016. Provided as-is without warranty. Trademarks mentioned here are the property of their owners.

Allows to set all the modern groups or Team sites sharing capability to ExternalUserAndGuestSharing in an SPO tenant. It enables the creation of anonymous or guest links allowing users to view the content without logging in. This is needed for the class notebook parent links to work.

### Prerequisites ###
Before you begin running the Scripts, review the following information about prerequisites:

- Set up the SharePoint Online Management Shell environment

Also verify the following:
The tenant admin is a Global Administrator in Office 365 for enterprises.
The tenant admin is a member of the Administrators group on the server on which you are running the Windows PowerShell script.

### SetupGuestSharingForTeamSites.ps1 ###

The PowerShell script contains the following cmdlets that can be made available by loading the script

    .. C:\powershell\SetupGuestSharingForTeamSites.ps1

The cmdlets is as follows:

Set-ExternalUserAndGuestSharingForTeamSites

It can be used to set the team sites to enable external user And guest sharing. 

### Example of how to run it ###
From the SharePoint Online Management Shell, run the following:
(1)
C:\powershell\Connect-SPOService -Url https://contoso-admin.sharepoint.com

(2)
C:\powershell\. .\SetupGuestSharingForTeamSites.ps1

(3)
C:\powershell\Set-ExternalUserAndGuestSharingForTeamSites

Fetching all the group sites
Found [4] group sites
Updating the sharing Capability of the following sites to ExternalUserAndGuestSharing

1- https://contososdorg.sharepoint.com/sites/13082018CNBTeams
2- https://contososdorg.sharepoint.com/sites/Section_60917
3- https://contososdorg.sharepoint.com/sites/Mattie111
4- https://contososdorg.sharepoint.com/sites/Section_60857
