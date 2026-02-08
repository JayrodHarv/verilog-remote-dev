#!/usr/bin/env bash
set -e

if [ $# -ne 1 ]; then
  echo "Usage: $0 <project_name>"
  exit 1
fi

NAME=$1
ROOT="src/$NAME"

if [ -d "$ROOT" ]; then
  echo "Project '$NAME' already exists"
  exit 1
fi

echo "Creating project: $NAME"

mkdir -p \
  $ROOT/rtl \
  $ROOT/tb \
  $ROOT/test \
  $ROOT/build \
  $ROOT/waves \
  $ROOT/logs

# Copy templates
sed "s/{{NAME}}/$NAME/g" templates/module.v.tpl > $ROOT/rtl/$NAME.v
sed "s/{{NAME}}/$NAME/g" templates/tb.v.tpl > $ROOT/tb/${NAME}_tb.v
sed "s/{{NAME}}/$NAME/g" templates/test.v.tpl > $ROOT/test/${NAME}_test.v

# Copy Makefile template
cp templates/Makefile.tpl $ROOT/Makefile

echo "Project '$NAME' created at $ROOT"