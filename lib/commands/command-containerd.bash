#!/bin/bash
# steps from https://guide2wsl.com/nerdctl/
containerDPath=$(asdf which containerd)
binDir=$(dirname $containerDPath)
test -x $containerDPath || fail "containerd not executable at $containerDPath"

nerdctlPath=$(asdf which nerdctl)
test -x $nerdctlPath || fail "nerdctl not executable at $nerdctlPath."
sudo chown root $nerdctlPath || fail "Could not change owner to root on $nerdctlPath."
sudo chmod +s $nerdctlPath || fail "Could not setuid on $nerdctlPath."

sudo $containerDPath &
sudo chgrp "$(id -gn)" /run/containerd/containerd.sock
export CNI_PATH=$binDir/cni
sudo $binDir/buildkitd &
