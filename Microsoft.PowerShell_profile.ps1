Import-Module PsGet
Import-Module PSUrl
Import-Module PowerTab

if(Test-Path ~\.last) {
    (Get-Content ~\.last) | set-location
    rm ~\.last
}

# Makes git diff work
$env:TERM = "msys"

Set-Alias subl "C:\Program Files\Sublime Text 3\sublime_text.exe"
Set-Alias vim "C:\Program Files (x86)\Vim\vim74\vim.exe"

#remove default alias
rename-item alias:\gc gcc -force
rename-item alias:\gp gpp -force
rename-item alias:\gl gll -force

# Git Aliases
function git-status { git status }
Set-Alias -Name gs -Value git-status

function git-push { git push }
Set-Alias -Name gp -Value git-push

function git-push-origin-master { git push origin master}
Set-Alias -Name gpom -Value git-push-origin-master

function git-pull { git pull }
Set-Alias -Name gl -Value git-pull

function git-add-update { git add -u}
Set-Alias -Name gau -Value git-add-update

function git-commit-m { git commit -m $args }
Set-Alias -Name gc -Value git-commit-m

function git-diff { git diff }
Set-Alias -Name gd -Value git-diff

function git-checkout { git checkout }
Set-Alias -Name gco -Value git-checkout

function git-log { git log }
Set-Alias -Name glog -Value git-log

# Load posh-git example profile
. 'C:\Users\felixpalazuelos\Documents\WindowsPowerShell\Modules\posh-git\profile.example.ps1'

set-location C:\Users\felixpalazuelos
. "C:\Users\felixpalazuelos\Documents\WindowsPowerShell\Get-ChildItemColor.ps1" # read the colourized ls
set-alias ls Get-ChildItemColor -force -option allscope
function Get-ChildItem-Force { ls -Force }
set-alias la Get-ChildItem-Force -option allscope

# Load posh-git example profile
. 'C:\Users\felixpalazuelos\Documents\WindowsPowerShell\Modules\posh-git\profile.example.ps1'

Import-TabExpansiontheme SimpleWhite

