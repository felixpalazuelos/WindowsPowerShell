function Get-ChildItemColor {
<#
.Synopsis
  Returns childitems with colors by type.
  From http://poshcode.org/?show=878
.Description
  This function wraps Get-ChildItem and tries to output the results
  color-coded by type:
  Compressed - Yellow
  Directories - Dark Cyan
  Executables - Green
  Text Files - Cyan
  Others - Default
.ReturnValue
  All objects returned by Get-ChildItem are passed down the pipeline
  unmodified.
.Notes
  NAME:      Get-ChildItemColor
  AUTHOR:    Tojo2000 <tojo2000@tojo2000.com>
#>
  $regex_opts = ([System.Text.RegularExpressions.RegexOptions]::IgnoreCase `
      -bor [System.Text.RegularExpressions.RegexOptions]::Compiled)
 
  $fore = $Host.UI.RawUI.ForegroundColor
  $compressed = New-Object System.Text.RegularExpressions.Regex(
      '\.(zip|tar|gz|rar)$', $regex_opts)
  $executable = New-Object System.Text.RegularExpressions.Regex(
      '\.(exe|bat|cmd|py|pl|ps1|psm1|vbs|rb|reg|fsx)$', $regex_opts)
  $dll_pdb = New-Object System.Text.RegularExpressions.Regex(
      '\.(dll|pdb)$', $regex_opts)
  $configs = New-Object System.Text.RegularExpressions.Regex(
      '\.(config|conf|ini)$', $regex_opts)
  $text_files = New-Object System.Text.RegularExpressions.Regex(
      '\.(txt|cfg|conf|ini|csv|log)$', $regex_opts)
 
  Invoke-Expression ("Get-ChildItem $args") |
    %{
      $c = $fore
      if ($_.GetType().Name -eq 'DirectoryInfo') {
        $c = 'DarkCyan'
      } elseif ($compressed.IsMatch($_.Name)) {
        $c = 'Yellow'
      } elseif ($executable.IsMatch($_.Name)) {
        $c = 'Green'
      } elseif ($text_files.IsMatch($_.Name)) {
        $c = 'Cyan'
      } elseif ($dll_pdb.IsMatch($_.Name)) {
        $c = 'DarkGreen'
      } elseif ($configs.IsMatch($_.Name)) {
        $c = 'Yellow'
      }
      $Host.UI.RawUI.ForegroundColor = $c
      echo $_
      $Host.UI.RawUI.ForegroundColor = $fore
    }
}