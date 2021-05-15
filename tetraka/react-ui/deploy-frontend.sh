#!/usr/bin/env bash
# Script to push tetraka/tetraka/react-ui directory onto heroku remote

BRANCH=$(git rev-parse --abbrev-ref HEAD)
REPO_DIR=${PWD##*/tetraka/}
RED='\033[0;31m'
NC='\033[0m' # No Color

if [[ "$REPO_DIR" != "react-ui" ]]; then
	echo -e >&2 "${RED}ERROR: Deploy script must be executed from react-ui directory.${NC}"
	echo >&2 "Aborting..."
	exit 1;
fi

if [[ "$BRANCH" != "master" ]]; then
  echo -e >&2 "${RED}ERROR: We should only deploy from the master branch version to production!${NC}";
  echo >&2 'Aborting...';
  exit 1;
fi

cd ../..
#git subtree push --prefix tetraka/react-ui heroku master

# If you're getting a weird issue with branch tips, you can run...
 git push heroku `git subtree split --prefix tetraka/react-ui master`:master --force