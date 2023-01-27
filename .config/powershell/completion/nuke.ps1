Register-ArgumentCompleter -Native -CommandName nuke -ScriptBlock {
  param($cmd, $word, $pos)
  nuke :complete "$word" | ForEach-Object { [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_) }
}
