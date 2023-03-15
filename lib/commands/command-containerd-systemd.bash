# run containerd setup with systemd

containerDPath=$(asdf which containerd)
buildkitDPath=$(asdf which buildkitd)
binDir=$(dirname $containerDPath)

exec $binDir/containerd-rootless-setuptool.sh install
exec $binDir/containerd-rootless-setuptool.sh install-buildkit

nerdctlPath=$(asdf which nerdctl)
test -x $nerdctlPath || fail "nerdctl not executable at $nerdctlPath."
sudo chown root $nerdctlPath || fail "Could not change owner to root on $nerdctlPath."
sudo chmod +s $nerdctlPath || fail "Could not setuid on $nerdctlPath."

echo << 'HELP'

You may now use containerd with systemctl.

systemctl containerd start
systemctl containerd stop
