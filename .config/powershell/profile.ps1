function install_and_import {
  param($mod)

  <# if (-not (Get-Module $mod)) {
    Install-Module $mod
  } #>

  Import-Module $mod
}

install_and_import Terminal-Icons
install_and_import z
install_and_import PSFzf
install_and_import 7Zip4Powershell
install_and_import WriteAscii
install_and_import PSColorizer
install_and_import CompletionPredictor
install_and_import posh-git


Set-PSReadLineOption -EditMode Windows
Set-PSReadLineOption -BellStyle Visual
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -PredictionSource HistoryAndPlugin
Set-PSReadLineOption -HistoryNoDuplicates
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar

Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

# Init Oh-My-Posh
oh-my-posh init pwsh --config "$env:USERPROFILE/.config/omp/dvchevskii.omp.json" | Invoke-Expression
Enable-PoshTransientPrompt

# https://github.com/dahlbyk/posh-git#customizing-the-posh-git-prompt


# import completion modules for various cmdline tools
Get-ChildItem $PSScriptRoot/completion/*.ps1 | ForEach-Object { . $_ }

# import utility functions
Get-ChildItem $PSScriptRoot/utils/*.ps1 | ForEach-Object { . $_ }

Enable-ExperimentalFeature PSCommandNotFoundSuggestion
