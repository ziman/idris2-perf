#!/usr/bin/env bash

set -euo pipefail

rm -rf build
for i in {countdown,pythag}-{interp,monad}; do
	idris2 --codegen malfunction ${i}.idr -o ${i}

	echo -e "=== ${i} ===\n"
	for j in 1 2 3; do
		time build/exec/${i}
		echo ""
	done
done
