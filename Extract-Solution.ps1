$name = "name.wsp"
$farm = Get-SPFarm
$file = $farm.Solutions.Item($name).SolutionFile
$file.SaveAs("C:\$name")