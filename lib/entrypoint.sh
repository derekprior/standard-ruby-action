#!/bin/sh

set -e
echo "[info] starting run"

CMD="standardrb --parallel -f github"
echo "[info] CMD before: '$CMD'"
echo "[info] GITHUB_WORKSPACE: '$GITHUB_WORKSPACE'"
echo "[info] pwd: `pwd`"

cd "$GITHUB_WORKSPACE"

echo "[info] pwd: `pwd`"

if [ "$USE_BUNDLE_VERSION" = "true" ]; then
  echo "[info] using bundled version"
  bundle install
  CMD="bundle exec $CMD"
else
  echo "[info] using current version"
  gem install standard
fi

echo "[info] running standard as '$CMD'"
eval "$CMD"
