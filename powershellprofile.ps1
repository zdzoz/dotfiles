$env:POWERSHELL_TELEMETRY_OPTOUT=1
cd $HOME

function open { explorer.exe $args }
function dev { Set-Location $HOME\dev }
function which { Get-Command $args }
function lg { lazygit }

# perforce

$env:P4PORT = "perforce-gs:1666"
$env:P4USER = "oskar.zdziarski"

function pedit {
  param (
      [switch]$h
  )

  function print_help {
      echo @"
Usage: pedit [-h]

  Edits a perforce file

Options:
  -h          Show help
"@

  }

  if ($h) {
    print_help
    return
  }

  $selected = fzf --smart-case
  if ($selected) {
    p4 edit $selected
  }
}

function __pworkspaces_verbose {
  p4 clients -u oskar.zdziarski
}

function __pworkspaces {
  p4 clients -u oskar.zdziarski | ForEach-Object {
    if ($_ -match "^Client\s+(\S+)\s") {
        $matches[1]
    }
  }
}

function __pworkspace {
  $selected = __pworkspaces | fzf --smart-case
  if ($selected) {
    p4 set P4CLIENT=$selected
    echo "Changed to workspace: $selected"
  }
}

function pworkspace {
    param (
        [switch]$v,

        [Parameter(Position=0)]
        [string]$Command
    )

    function print_help {
      echo @"
Usage: pworkspace [list [-v]] | [set] | [-h]

Commands:
  list        List available Perforce workspaces.
              Use -v for verbose output.

  set         Set the current Perforce workspace.

Options:
  -v          Verbose output for the 'list' command.

Examples:
  pworkspace list
      List all workspaces.

  pworkspace list -v
      List all workspaces with verbose details.

  pworkspace set
      Set the current workspace.
"@
    }

    if ($Command -eq 'list') {
      if ($v) {
        __pworkspaces_verbose
      } else {
        __pworkspaces
      }
    } elseif ($Command -eq 'set') {
        __pworkspace
    } else {
      print_help
    }
}
