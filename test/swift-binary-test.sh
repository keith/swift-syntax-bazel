#!/bin/bash

set -euo pipefail

./test/swift_binary

if otool -L ./test/swift_binary | grep -q lib_InternalSwiftSyntaxParser; then
  echo "lib_InternalSwiftSyntaxParser is dynamically linked to the binary"
  exit 1
fi
