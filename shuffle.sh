#!/bin/sh

shuf() {
  awk 'BEGIN {srand(); OFMT="%.17f"} {print rand(), $0}' "$@" | sort -k1,1n | cut -d ' ' -f2-;
}

shuf $1
