<#
.SYNOPSIS
Simulate Linux' sudo command on Windows

.DESCRIPTION
Starts the process with admin permissions

.EXAMPLE
sudo Remove-Item -Recurse -Force C:\Windows\System32
#>
function sudo {
  Start-Process "$($args[0])" "$($args[1..$args.Count])" -Verb RunAs -Wait
}
