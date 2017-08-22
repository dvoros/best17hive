#!/bin/bash

set -ex

[ "x$1" == "x" ] && echo "usage $0 <host>" && exit 1

rsync --progress -tr -e ssh ./copy-to-remote/ sshuser@$1:/tmp/loader
ssh sshuser@$1 /tmp/loader/remote-loader.bash
echo ok
