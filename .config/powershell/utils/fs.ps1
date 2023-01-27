function lr {
  Get-ChildItem -Recurse @args
}

function lf {
  Get-ChildItem -Recurse @args
}

function lfr {
  Get-ChildItem -Recurse -Force @args
}

function open {
  param([Parameter(ValueFromPipeline, Position = 0)]$path = '.')
  . explorer "$(Resolve-Path $path)"
}

function dirname {
  param([Parameter(Mandatory, Position = 0, ValueFromPipeline)]$path)
  Split-Path -Path $path -Parent
}
function filename {
  param([Parameter(Mandatory, Position = 0, ValueFromPipeline)]$path)
  Split-Path -Path $path -Leaf
}

# strip ext
# if indexof . == -1 return
# if indexof . == 0 && count . == 1 return
# result = input.slice 0 => input.length - lastindexof .

function stripext {
  param([Parameter(Mandatory, ValueFromPipeline, Position = 0)][string]$filename)

  if (-not $filename.Contains('.')) {
    return $filename
  }

  $li = $filename.LastIndexOf('.')

  if ($li -eq 0 -or $li -eq ($filename.Length - 1)) {
    return $filename
  }

  return $filename.Substring(0, $li)
}

function touch {
  param([Parameter(Mandatory, ValueFromPipeline, Position = 0 )]$path, [Parameter(Position = 1)][switch]$force = $false)
  New-Item -Path $path -ItemType File -Force:$force
}

<# function ln {
  param(
    [Parameter(Mandatory, ValueFromPipeline, Position = 0)]$path,
    [Parameter(Mandatory, Position = 1)]$target,
    [Parameter(Position = 2)][switch]$force = $false
  )
  New-Item -Path $path -ItemType SymbolicLink -Target $target -Force:$force
} #>
