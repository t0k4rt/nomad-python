
#!/bin/bash
set -e
SCRIPT_DIR=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)

pip3 install -r "$SCRIPT_DIR/requirements.txt"
export PATH="${PATH}:/nonexistent/.local/bin"
echo $PATH
cd $SCRIPT_DIR
python3 "$@"
