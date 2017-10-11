is_plugin() {
  local plugin_path=$1
  local plugin_file=${plugin_path:t}
  test -f $plugin_path/$plugin_file.plugin.zsh || \
    test -f $plugin_path/_$plugin_file || \
    test -f $plugin_path/$plugin_file.sh
}

construct_filename() {
  local plugin_path=$1
  local plugin_file=${plugin_path:t}

  name1=$plugin_path/$plugin_file.plugin.zsh
  name2=$plugin_path/_$plugin_file
  name3=$plugin_path/$plugin_file.sh

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
  # this hack is brought to you by Daniel Shahaf in an answer to my question
  # link: http://www.zsh.org/mla/zsh-users/22852
  plugin_paths+=($zsh_deps/*/*/.git(N:h))
  for plugin_path ($plugin_paths); do
    # print $plugin_path
    if is_plugin $plugin_path; then
      local file=$(construct_filename $plugin_path)
      source $file
    fi
  done
}
