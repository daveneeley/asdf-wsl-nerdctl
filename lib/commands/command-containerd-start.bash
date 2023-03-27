#!/bin/bash
# steps from https://guide2wsl.com/nerdctl/
binDir="${ASDF_INSTALL_PATH}/bin"
export CNI_PATH=$binDir/cni

containerdStatus=$(systemctl --user is-enabled containerd)
if [[ "enabled" == "$containerdStatus" ]]; then
    systemctl --user start containerd
else
    containerdPath="${ASDF_INSTALL_PATH}/bin/containerd"
    $containerdPath &
fi

buildkitStatus=$(systemctl --user is-enabled buildkit)
if [[ "enabled" == "$buildkitStatus" ]]; then
    systemctl --user start buildkit
else
    buildkitDPath="${ASDF_INSTALL_PATH}/bin/buildkitd"
    chgrp "$(id -gn)" /run/containerd/containerd.sock
    $buildkitDPath &
fi
