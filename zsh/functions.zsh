# cpd: copy a file to the current Windows user's Desktop {{{

# usage: cpd file
cpd() {
  if (( $# != 1 )); then
    print -u2 -- 'Usage: cpd file'
    return 1
  fi
  if [[ ! -f "$1" ]]; then
    print -u2 -- "cpd: not a regular file: $1"
    return 1
  fi

  local windows_desktop desktop
  windows_desktop=$(powershell.exe -NoProfile -NonInteractive -Command \
    '[Console]::OutputEncoding = [System.Text.Encoding]::UTF8; [Environment]::GetFolderPath("Desktop")') || return
  windows_desktop=${windows_desktop//$'\r'/}
  if [[ -z "$windows_desktop" ]]; then
    print -u2 -- 'cpd: could not locate the Windows Desktop'
    return 1
  fi
  desktop=$(wslpath -u "$windows_desktop") || return
  command cp -- "$1" "$desktop/"
}

# }}}
# s: get megabytes measurement {{{

# usage: s [-h] [path]
s() {
  if [[ -z ${1+x} ]]; then
    # no argument passed. measure current dir including hidden files.
    du -sm *(D) | sort -nr | head -n 20
    return 0
  fi
  # an argument was passed.
  if [[ $1 = '-h' ]]; then
    # -h switch: human readable size output, but it is not suitable for ordering with, e.g., command sort.
    if [[ -n ${2+x} ]]; then
      # if a path was passed, apply -h switch to the path
      du -sh $2
      return 0;
    else
      # if a path was not passed, apply -h switch to all files, including hidden files
      du -sh *(D)
    fi
  else
    # bogus argument. print error
    print -l 'bogus argument. check function documentation'
  fi
}

# }}}
# sk: get kilobytes measurement. for human readable output check the s function {{{

# usage: s [path]
sk() {
  if [[ -z ${1+x} ]]; then
    # no argument passed. measure current dir including hidden files.
    du -sk *(D) | sort -nr | head -n 20
    return 0;
  fi
  # argument passed.
  du -sk $1 | sort -nr | head -n 20
}

# }}}
# md: faster dir creation {{{

md() {
  mkdir -p $1
  builtin cd $1
}

# }}}
# n: easy run project local npm executables {{{

# usage sample: n ng version
n () {
  $(npm bin)/$@
}

# }}}
# =: front for the `bc` utility {{{

# usage: = '1+1'
= () {
  bc -l <<< "$@"
}

# }}}
