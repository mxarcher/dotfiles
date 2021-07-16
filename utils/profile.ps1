# custom function

function scoop_update() {
  scoop update && scoop status
}

function hide_dotfiles(){
  attrib +h /d .\.*
}

function show_dotfiles(){
  attrib -h /d .\.*
}

function make_junction_link ($target,$link) {
  new-item -path $link -itemtype junction -value $target
}

function env_setting() {
# enable powershell execution policy
# Set-ExecutionPolicy RemoteSigned -scope CurrentUser

  echo ""
  echo "info: Checking environment variable"

  if (! $env:SCOOP) {
    $env:SCOOP="D:\Apps\Scoop"
      [Environment]::SetEnvironmentVariable('SCOOP',$env:SCOOP,'User')
  } else {
    echo "SCOOP already exist"
  }

  if (! $env:SCOOP_GLOBAL){
    $env:SCOOP_GLOBAL="D:\Apps\GlobalScoopApps"
      [Environment]::SetEnvironmentVariable('SCOOP_GLOBAL', $env:SCOOP_GLOBAL, 'Machine')
  } else {
    echo "SCOOP_GLOBAL already exist"
  }

  echo "" 
  echo "  SCOOP: $env:SCOOP"
  echo "  SCOOP_GLOBAL: $env:SCOOP_GLOBAL"
  echo ""

  echo "info: Creating junction links"
  $Repo="D:\Repo"
  if (!(Test-Path $env:LOCALAPPDATA\nvim)) {
	  new-item -path $env:LOCALAPPDATA\nvim -itemtype junction -value $Repo\dotfiles\dot-nvim\.config\nvim
  }
  if (!(Test-Path $env:USERPROFILE\repo)) {
	  new-item -path $env:USERPROFILE\repo -itemtype junction -value $Repo
  }
}
