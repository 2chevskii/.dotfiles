Register-ArgumentCompleter -Native -CommandName dotnet -ScriptBlock {
  param($cmd, $word, $cursor_position)
  dotnet complete --position $cursor_position "$word" | ForEach-Object {
    [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
  }
}
