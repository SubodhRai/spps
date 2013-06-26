function Republish-HubContentTypes ($CTHubURL)
{
    $ctHubSite = Get-SPSite $CTHubURL
    $ctHubWeb = $ctHubSite.RootWeb

    if ([Microsoft.SharePoint.Taxonomy.ContentTypeSync.ContentTypePublisher]::IsContentTypeSharingEnabled($ctHubSite))
    {
        $spCTPublish = New-Object Microsoft.SharePoint.Taxonomy.ContentTypeSync.ContentTypePublisher ($ctHubSite)
        
        $ctHubWeb.ContentTypes | Sort-Object Name | ForEach-Object {
            
            if ($spCTPublish.IsPublished($_))
            {
                $spCTPublish.Publish($_)
                write-host "Content type" $_.Name "has been republished" -foregroundcolor Green
            }
            else
            {
                write-host "Content type" $_.Name "is not a published content type"
            }
        }
    }
    else
    {
        write-host $CTHubURL "is not a content type hub site"
    }
	
    $ctHubWeb.Dispose()
    $ctHubSite.Dispose()
}