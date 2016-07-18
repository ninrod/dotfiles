# author: Filipe Silva (ninrod)
# LICENSE and COPYRIGHT notice {{{

# ninrod's dotfiles - sharpened dotfiles for zsh, vim, tmux and friends.
# Copyright (C) 2016 Filipe Silva (ninrod)

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

# }}}

lib_bootstrap() {
  local gitrootdir=$(git rev-parse --show-toplevel)
  local libfile=${gitrootdir}/lib/lib.sh
  if [[ -f $libfile ]]; then
    . $libfile
  else
    echo -e "$libfile not found. aborting..."
    exit 1;
  fi
}
lib_bootstrap
fix_script_path
