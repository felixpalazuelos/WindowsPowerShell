Push-Location (Split-Path -Path $MyInvocation.MyCommand.Definition -Parent)

# Load posh-git module from current directory
#Import-Module Modules\posh-git

# If module is installed in a default location ($env:PSModulePath),
# use this instead (see about_Modules for more information):
Import-Module posh-git

function shorten-path([string] $path) {
   $loc = $path.Replace($HOME, '~')
   # remove prefix for UNC paths
   $loc = $loc -replace '^[^:]+::', ''
   # make path shorter like tabs in Vim,
   # handle paths starting with \\ and . correctly
   return ($loc -replace '\\(\.?)([^\\])[^\\]*(?=\\)','\$1$2')
}


# Set up a simple prompt, adding the git prompt parts inside git repos
function global:prompt {
    $realLASTEXITCODE = $LASTEXITCODE
    
    # Reset color, which can be messed up by Enable-GitColors
    $Host.UI.RawUI.ForegroundColor = $GitPromptSettings.UntrackedForegroundColor
    Write-Host('felixpalazuelos ') -nonewline
    $Host.UI.RawUI.ForegroundColor = [ConsoleColor]::Blue

    #Write-Host($pwd.ProviderPath) -nonewline
    Write-Host(shorten-path (pwd).Path) -nonewline
    Write-VcsStatus

    $Host.UI.RawUI.ForegroundColor = $GitPromptSettings.DefaultForegroundColor
     

    $global:LASTEXITCODE = $realLASTEXITCODE
    return " "

}

Enable-GitColors

Pop-Location

Start-SshAgent -Quiet
