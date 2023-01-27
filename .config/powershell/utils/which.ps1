<#
.SYNOPSIS
Simulate Linux' which command

.DESCRIPTION
Returns path to an executable passed as an argument

.PARAMETER command
executable to return path to

.EXAMPLE
which code
#>
function which {
  param([Parameter(Mandatory, ValueFromPipeline, Position = 0)]$command)
  Get-Command -Name $command -ErrorAction SilentlyContinue | Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}
