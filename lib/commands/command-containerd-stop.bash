#!/bin/bash

$containerdStatus=$(systemctl --user is-active containerd)
if [[ "active" == "$containerdStatus" ]]; then
    systemctl --user stop containerd
else
    containerDPath="${ASDF_INSTALL_PATH}/bin/containerd"
    pkill $containerDPath
fi

$buildkitStatus=$(systemctl --user is-active buildkit)
if [[ "active" == "$buildkitStatus" ]]; then
    systemctl --user stop buildkit
else
    buildkitDPath="${ASDF_INSTALL_PATH}/bin/buildkitd"
    pkill $buildkitDPath
fi
