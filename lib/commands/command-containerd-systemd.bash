# run containerd setup with systemd

containerDPath="${ASDF_INSTALL_PATH}/bin/containerd"
buildkitDPath="${ASDF_INSTALL_PATH}/bin/buildkitd"
binDir="${ASDF_INSTALL_PATH}/bin"

$binDir/containerd-rootless-setuptool.sh install
$binDir/containerd-rootless-setuptool.sh install-buildkit

nerdctlPath=$(asdf which nerdctl)
test -x $nerdctlPath || fail "nerdctl not executable at $nerdctlPath."

cat << 'HELP'

You may now use containerd with systemctl.

systemctl --user containerd start
systemctl --user containerd stop

You may also use buildkitd with systemctl.

systemctl --user buildkitd start
systemctl --user buildkitd stop

Should you have networking issues with WSL, or WSL on VPN.

https://gist.github.com/machuu/7663aa653828d81efbc2aaad6e3b1431

HELP
