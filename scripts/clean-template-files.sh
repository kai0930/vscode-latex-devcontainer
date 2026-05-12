#!/usr/bin/env sh
set -eu

usage() {
  echo "Usage: scripts/clean-template-files.sh"
  echo
  echo "Removes template documentation files from this project:"
  echo "  - README.md"
  echo "  - README.ja.md"
  echo
  echo "LICENSE is kept by default."
}

if [ "${1:-}" = "-h" ] || [ "${1:-}" = "--help" ]; then
  usage
  exit 0
fi

if [ "$#" -gt 0 ]; then
  usage
  exit 1
fi

if [ ! -t 0 ]; then
  echo "This script requires an interactive terminal."
  exit 1
fi

printf "This will remove README.md and README.ja.md. Continue? [Y/n] "
read -r answer

case "$answer" in
  ""|Y|y|Yes|yes)
    ;;
  *)
    echo "Canceled."
    exit 0
    ;;
esac

cd "$(dirname "$0")/.."

rm_if_exists() {
  if [ -e "$1" ]; then
    rm -f "$1"
    echo "removed: $1"
  fi
}

rm_if_exists README.md
rm_if_exists README.ja.md

if rmdir docs 2>/dev/null; then
  echo "removed: docs/"
fi

echo "Template documentation cleanup complete."
