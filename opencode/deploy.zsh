local config_path=~/.config
mkdir -p "$config_path"

local oc_path="$config_path/opencode"
verifylink "$oc_path"

rm -rf -- "$oc_path"
updatelinks ~/.config/opencode opencode/
