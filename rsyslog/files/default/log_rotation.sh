#!/bin/bash

rotations="$1"
log="$2"

if command -v savelog >/dev/null 2>&1; then
  savelog -l -c "$rotations" "$log"
else
  echo "Error: savelog not found. Please check that OS is supported."
  echo "Ignoring rotations. Total log size unknown."
  mv -f "$log" "${log}.0"
fi
