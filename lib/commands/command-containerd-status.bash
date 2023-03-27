#!/bin/bash
binDir="${ASDF_INSTALL_PATH}/bin"
export CNI_PATH=$binDir/cni

containerdStatus=$(systemctl --user is-enabled containerd)
if [[ "enabled" == "$containerdStatus" ]]; then
    systemctl --user status containerd
else
    containerdPath="${ASDF_INSTALL_PATH}/bin/containerd"
    $containerdPath &
fi

buildkitStatus=$(systemctl --user is-enabled buildkit)
if [[ "enabled" == "$buildkitStatus" ]]; then
    systemctl --user status buildkit
else
    buildkitDPath="${ASDF_INSTALL_PATH}/bin/buildkitd"
    chgrp "$(id -gn)" /run/containerd/containerd.sock
    $buildkitDPath &
fi
