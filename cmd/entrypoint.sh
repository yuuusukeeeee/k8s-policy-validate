#!/usr/bin/env ash

set -e
set -o pipefail


echo ">>> Running command"
echo ""

/bin/bash

# コマンドが失敗した時、スクリプトを停止させる
bash -c "set -e;  set -o pipefail; $1"
