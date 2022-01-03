
#!/bin/bash
set -e
SCRIPT_DIR=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
export PATH="${PATH}:/nonexistent/.local/bin"
pip3 list
pip3 install -r "$SCRIPT_DIR/requirements.txt"

echo $PATH
cd $SCRIPT_DIR
python3 "$@"
