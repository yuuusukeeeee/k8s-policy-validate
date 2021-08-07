#!/usr/bin/env ash

set -e
set -o pipefail


echo ">>> Running command"
echo ""

/bin/bash

bash -c "set -e;  set -o pipefail; $1"
