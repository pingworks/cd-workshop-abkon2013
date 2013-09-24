#!/bin/bash

SCRIPTDIR=$(dirname $0)
. $SCRIPTDIR/../configs/vcs.conf
. $SCRIPTDIR/../shared/common.sh
. $SCRIPTDIR/../shared/$VCS.sh

RANGE=$1

if [ -z "$RANGE" ]; then
  echo "Usage: $0 <svn-revision-range>"
  exit 1
fi
set -e
validateRevRange $RANGE

svn log -r $RANGE $VCSREPO/
