# https://wsl.dev/wsl2init/
## Create a script for entering PID 1 and save it in /etc/profile.d/
set -eou pipefail

commandFolder=$(dirname $(realpath -e ${ASDF_CMD_FILE}))
scriptFile=$(realpath -e ${commandFolder}/../../scripts/wsl-init.sh)

sudo mkdir -p /etc/profile.d
sudo ln -sf ${scriptFile} /etc/profile.d/wsl-init.sh 
 
echo << 'HELP'

# This content provided by https://wsl.dev/wsl2init/

# Please Add/Edit the [boot] command in /etc/wsl.conf and save the file

[boot]
command = "/usr/bin/env -i /usr/bin/unshare --pid --mount-proc --fork --propagation private -- sh -c 'exec /sbin/init'"

# Then terminate the WSL2 distro session from Powershell
wsl.exe --terminate <your distro>

# Start a new WSL2 distro session
wsl.exe -d <your distro>

# Check the running processes
ps -ef

# Check the OpenRC status
rc-status

# Check the current OpenRC services
rc-update

HELP
