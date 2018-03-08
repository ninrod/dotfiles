unamestr=$(uname -a)
if [[ $unamestr == *"Linux"* ]] && [[ $unamestr == *"ARCH"* ]]; then
  source ~/.options/arch/last_hook.zsh
fi