#!/usr/bin/env bash

set -xeuo pipefail

rm -rf build
for i in {countdown,pythag}-{interp,monad}; do
	idris2 --codegen malfunction ${i}.idr -o ${i}

	echo "=== ${i} ==="
	for j in 1 2 3; do
		time build/exec/${i}
	done
done
