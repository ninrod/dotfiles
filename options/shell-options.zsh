# note: this file is meant to be source, not executed

unamestr=$(uname -a)
if [[ "$unamestr" == *"Linux"* ]] && [[ $unamestr == *"ARCH"* ]]; then

  if [[ -n ${1+x} ]] && [[ "$1" == "setup" ]]; then
    source ~/.options/arch/setup.zsh
  else
    source ~/.options/arch/arch.zsh
  fi

elif [[ "$unamestr" == *"Darwin"*  ]]; then
  source ~/.options/osx/osx.zsh $1
fi
