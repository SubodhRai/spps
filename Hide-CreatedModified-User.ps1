$web = Get-SPWeb http://sp
$list = $web.Lists["MyList"]

#hide user info from appearing on dialogs
$list.ShowUser = $false

$list.Update()
$web.Dispose()