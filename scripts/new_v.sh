#!/usr/bin/env bash
set -e

if [ $# -ne 3 ]; then
  echo "Usage: $0 <type> <name> <output_dir>"
  echo "  type: module | tb"
  exit 1
fi

TYPE=$1
NAME=$2
OUTDIR=$3

TEMPLATE="templates/${TYPE}.v.tpl"

if [ "$TYPE" = "tb" ]; then
  OUTFILE="${OUTDIR}/${NAME}_tb.v"
else
  OUTFILE="${OUTDIR}/${NAME}.v"
fi

mkdir -p "$OUTDIR"

sed "s/{{NAME}}/${NAME}/g" "$TEMPLATE" > "$OUTFILE"

echo "Created $OUTFILE"
