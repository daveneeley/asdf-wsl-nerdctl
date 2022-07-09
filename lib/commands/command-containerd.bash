#!/bin/bash
# steps from https://guide2wsl.com/nerdctl/
containerDPath=$(asdf which containerd)
test -x $containerDPath || fail "containerd not exectuable at $containerDPath"
binDir=$(dirname $containerDPath)
sudo $containerDPath &
sudo chgrp "$(id -gn)" /run/containerd/containerd.sock
export CNI_PATH=$binDir
sudo $binDir/buildkitd &
