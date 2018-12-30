#!/usr/bin/env bash

# obtained from:
# https://git.zx2c4.com/password-store/tree/contrib/dmenu/passmenu

shopt -s nullglob globstar

typeit=0
if [[ $1 == "--type" ]]; then
	typeit=1
	shift
fi

prefix=${PASSWORD_STORE_DIR-~/.password-store}
password_files=( "$prefix"/**/*.gpg )
password_files=( "${password_files[@]#"$prefix"/}" )
password_files=( "${password_files[@]%.gpg}" )

# original line
# password=$(printf '%s\n' "${password_files[@]}" | dmenu "$@")

password=$(printf '%s\n' "${password_files[@]}" | dmenu -fn "Office Code Pro-12:normal" -nb "#32302f" -nf "#ebdbb2" -sb "#0a0814" -sf "#fe8019" -p ">" "$@")

[[ -n $password ]] || exit

if [[ $typeit -eq 0 ]]; then
	pass show -c "$password" 2>/dev/null
else
	pass show "$password" | { read -r pass; printf %s "$pass"; } |
		xdotool type --clearmodifiers --file -
fi

