#!/bin/bash
binDir="${ASDF_INSTALL_PATH}/bin"
export CNI_PATH=$binDir/cni

containerdStatus=$(systemctl --user is-enabled containerd)
if [[ "enabled" == "$containerdStatus" ]]; then
    systemctl --user status containerd
else
    pgrep --list-full containerd
fi

buildkitStatus=$(systemctl --user is-enabled buildkit)
if [[ "enabled" == "$buildkitStatus" ]]; then
    systemctl --user status buildkit
else
    pgrep --list-full buildkit
fi
