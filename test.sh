#!/bin/bash
set -o errexit
set -o nounset

IMG="$REGISTRY/$REPOSITORY:$TAG"

TESTS=(
  test-log
  test-restart
  test-replication
)

for t in "${TESTS[@]}"; do
  echo "--- START ${t} ---"
  "./${t}.sh" "$IMG"
  echo "--- OK    ${t} ---"
  echo
done

echo "#############"
echo "# Tests OK! #"
echo "#############"
