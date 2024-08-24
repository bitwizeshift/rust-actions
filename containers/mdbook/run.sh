#!/usr/bin/env bash

set -euo pipefail

PERMALINK="https://raw.githubusercontent.com/badboy/mdbook-mermaid/ca18754266fc1da8270bb5e7a9a9dcace3dfc944/src/bin/assets/"
readonly PERMALINK

book_path=$1
readonly book_path

if [[ ! -d "${book_path}" ]]; then
  echo "Error: book path not found: ${book_path}"
  exit 1
fi

# Fetch and install dependencies
/mdbook-admonish install "${book_path}"
if [[ ! -f "${out}/mermaid.min.js" ]]; then
  curl -o "${book_path}/mermaid.min.js" "${PERMALINK}/mermaid.min.js"
fi
if [[ ! -f "${out}/mermaid-init.js" ]]; then
  curl -o "${book_path}/mermaid-init.js" "${PERMALINK}/mermaid-init.js"
fi

/mdbook build "${book_path}"
