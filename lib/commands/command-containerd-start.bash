# steps from https://guide2wsl.com/nerdctl/
containerDPath=$(asdf which containerd)
buildkitDPath=$(asdf which buildkitd)
binDir=$(dirname $containerDPath)

export CNI_PATH=$binDir/cni
$containerDPath
chgrp "$(id -gn)" /run/containerd/containerd.sock
$buildkitDPath
