#!/bin/bash

cat << 'HELP'

# WSL + nerdctl helpful information:
# https://guide2wsl.com/nerdctl

# WSL information generally:
# https://wsl.dev

# nerdctl + buildkit
# https://pet2cattle.com/2022/02/nerdctl-rootless-buildkit

------------------- simple ----------------------
A cheap method for running containerd and buildkitd without systemd.
The process starts in foreground in the current terminal session.
You'll need to open a second terminal session to interact with nerdctl.

If you use Ctrl+C to kill containerd, you should follow it up with
the containerd stop command to cleanup leftovers.

Start: wsl-nerdctl containerd start
Stop (or cleanup): wsl-nerdctl containerd stop

------------------- systemd ---------------------
WSL2 supports systemd. If available, you may consider running containerd
under systemd instead. In that case you can use the systemd command to
configure the systemd unit.

To configure systemd, set the systemd flag in your WSL distro settings.
You will need to edit the wsl.conf file to ensure systemd starts up on boot.

Add these lines to `/etc/wsl.conf` (note you will need to run your editor 
with sudo privileges, e.g: sudo nano /etc/wsl.conf):

```
[boot]
systemd=true
```

Once you have configured systemd and rebooted WSL, run the containerd systemd command.

Setup systemd: wsl-nerdctl containerd systemd

Runs containerd-rootless-systemdtool.sh from the containerd package.

More information on systemd in WSL:
https://devblogs.microsoft.com/commandline/systemd-support-is-now-available-in-wsl/


------------------- openrc ----------------------

Another option is to use openrc. These instructions were provided by https://wsl.dev/wsl2init/

# Please Add/Edit the [boot] command in /etc/wsl.conf and save the file

[boot]
command = "/usr/bin/env -i /usr/bin/unshare --pid --mount-proc --fork --propagation private -- sh -c 'exec /sbin/init'"

Once you have configured systemd and rebooted WSL, run the containerd openrc command.

Setup openrc: wsl-nerdctl containerd openrc


------------------- notes ------------------------

# You can terminate a WSL2 distro session from Powershell
wsl.exe --terminate <your distro>

# Start a new WSL2 distro session
wsl.exe -d <your distro>

# Check the running processes
ps -ef


HELP
