
#!/bin/bash
set -e
SCRIPT_DIR=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)

export PATH="${PATH}:/nonexistent/.local/bin"
pip3 install -r "$SCRIPT_DIR/requirements.txt" && python main.py