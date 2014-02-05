Import-Module PsGet
Import-Module PSUrl

if(Test-Path ~\.last) {
    (Get-Content ~\.last) | set-location
    rm ~\.last
}

# Makes git diff work
$env:TERM = "msys"

Set-Alias subl "C:\Program Files\Sublime Text 3\sublime_text.exe"
Set-Alias vim "C:\Program Files (x86)\Vim\vim74\vim.exe"

# Load posh-git example profile
. 'C:\Users\felixpalazuelos\Documents\WindowsPowerShell\Modules\posh-git\profile.example.ps1'

set-location C:\Users\felixpalazuelos
. "C:\Users\felixpalazuelos\Documents\WindowsPowerShell\Get-ChildItemColor.ps1" # read the colourized ls
set-alias ls Get-ChildItemColor -force -option allscope
function Get-ChildItem-Force { ls -Force }
set-alias la Get-ChildItem-Force -option allscope

# Load posh-git example profile
. 'C:\Users\felixpalazuelos\Documents\WindowsPowerShell\Modules\posh-git\profile.example.ps1'

