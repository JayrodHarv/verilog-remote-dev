#!/usr/bin/env bash
set -e

if [ $# -ne 1 ]; then
  echo "Usage: $0 <project_name>"
  exit 1
fi

NAME=$1
ROOT="src/$NAME"

if [ -d "$ROOT" ]; then
  echo "Error: project '$NAME' already exists"
  exit 1
fi

echo "Creating project: $NAME"

mkdir -p \
  $ROOT/rtl \
  $ROOT/tb \
  $ROOT/build \
  $ROOT/waves

# Module
sed "s/{{NAME}}/$NAME/g" templates/module.v.tpl \
  > $ROOT/rtl/$NAME.v

# Testbench
sed "s/{{NAME}}/$NAME/g" templates/tb.v.tpl \
  > $ROOT/tb/${NAME}_tb.v

# Makefile
sed "s/{{NAME}}/$NAME/g" templates/Makefile.tpl \
  > $ROOT/Makefile

echo "Project created at $ROOT"
echo "Next steps:"
echo "  cd $ROOT"
echo "  make"
