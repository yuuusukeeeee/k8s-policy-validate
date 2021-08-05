#!/usr/bin/env ash

set -e
set -o pipefail


echo ">>> Running command"
echo ""

ash -c "set -e;  set -o pipefail; $1"
