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

rc() {
  if (( $# != 1 )) || ! [[ $1 =~ '^[A-Z]+$' ]]; then
    print -u2 -- 'usage: rgfc MASK (uppercase initials, e.g. PAER)'
    return 2
  fi

  local initial
  local pattern='(^|/)'

  # Match consecutive initials from the start of the basename.
  for initial in ${(s::)1}; do
    pattern+="$initial"'[^/\p{Lu}]*'
  done
  pattern+='(\p{Lu}[^/]*)?\.(kt|java)$'

  command rg --files -g '*.kt' -g '*.java' |
    command rg --no-config --color=never -- "$pattern"
}
