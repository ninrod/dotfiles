#!/bin/sh
set -eu

skill_dir=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd -P)
command -v uv >/dev/null 2>&1 || { echo "uv is required on PATH." >&2; exit 1; }
python3 -c 'import sys; sys.exit(0 if sys.version_info >= (3, 10) else "Python 3.10 or later is required")'
if [ ! -f "$skill_dir/.venv/pyvenv.cfg" ]; then
    uv venv --python "$(command -v python3)" "$skill_dir/.venv"
fi
uv pip install --python "$skill_dir/.venv/bin/python" -r "$skill_dir/requirements.txt"
