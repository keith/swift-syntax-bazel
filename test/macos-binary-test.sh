#!/bin/bash

set -euo pipefail

./test/macos_binary

if otool -L ./test/macos_binary | grep -q lib_InternalSwiftSyntaxParser; then
  echo "lib_InternalSwiftSyntaxParser is dynamically linked to the binary"
  exit 1
fi
