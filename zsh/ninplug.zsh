is_plugin() {
  local base_dir=$1
  local plugin_path=$2
  local plugin_file=${plugin_path:t}
  test -f $base_dir/$plugin_path/$plugin_file.plugin.zsh || \
    test -f $base_dir/$plugin_path/_$plugin_file || \
    test -f $base_dir/$plugin_path/$plugin_file.sh
}

construct_filename() {
  local base_dir=$1
  local plugin_path=$2
  local plugin_file=${plugin_path:t}

  name1=$base_dir/$plugin_path/$plugin_file.plugin.zsh
  name2=$base_dir/$plugin_path/_$plugin_file
  name3=$base_dir/$plugin_path/$plugin_file.sh

  if test -f $name1; then
    echo $name1
    return 0
  fi

  if test -f $name2; then
    echo $name2
    return 0
  fi

  if test -f $name3; then
    echo $name3
    return 0
  fi

  test -f $name1
}

load_plugins() {
  for plugin_path ($plugin_paths); do
    if is_plugin $zsh_deps $plugin_path; then
      local file=$(construct_filename $zsh_deps $plugin_path)
      source $file
    fi
  done  
}
