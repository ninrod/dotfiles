#####
# ag and ripgrep

# apps
alias ag='ag --path-to-ignore ~/.ignore --hidden'

# ripgrep
alias r='rg'
rgf() {
  local extension
  local argument
  local -a rg_arguments=(--files)

  for argument in "$@"; do
    case "$argument" in
      -a)
        rg_arguments+=(--hidden --no-ignore)
        ;;
      -*)
        print -u2 -- "rgf: unknown option: $argument"
        return 2
        ;;
      *)
        if [[ -n "$extension" ]]; then
          print -u2 -- "rgf: only one file extension is supported"
          return 2
        fi
        extension="$argument"
        ;;
    esac
  done

  if [[ -z "$extension" ]]; then
    print -u2 -- "usage: rgf [-a] extension"
    return 2
  fi

  rg "${rg_arguments[@]}" -g "*.$extension"
}


