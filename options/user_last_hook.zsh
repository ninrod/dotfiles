unamestr=$(uname -a)
if [[ $unamestr:l == *"microsoft"* ]]; then
  source ~/.options/wsl/last_hook.zsh
elif [[ $unamestr:l == *"linux"* ]] && [[ $unamestr:l == *"arch"* ]]; then
  source ~/.options/arch/last_hook.zsh
elif [[ $unamestr:l == *"ubuntu"* ]]; then
  source ~/.options/ubuntu/last_hook.zsh
elif [[ $unamestr:l == *"darwin"* ]]; then
  source ~/.options/osx/last_hook.zsh
elif [[ $unamestr:l == *"fedora"* ]]; then
  source ~/.options/fedora/last_hook.zsh
fi
