#!/bin/bash

[ "x$1" == "x" ] && echo "usage $0 <host>" && exit 1
scp copy-to-remote/hw-qe.pub sshuser@$1:.ssh/authorized_keys
