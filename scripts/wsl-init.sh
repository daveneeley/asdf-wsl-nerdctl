#!/bin/bash

## Many thanks to https://wsl.dev/wsl2init/
## Content of the file /etc/profile.d/wsl-init.sh

# Get PID of /sbin/init
sleep 1
pid="$(ps -u root -o pid,args | awk -e '$2 ~ /^init/ { print $1 }')"

# Run WSL service script
if [ "$pid" -ne 1 ]; then
  # Export ENV variables
  if [ "$USER" != "root" ]; then
    [ -f "$HOME/.openrc.env" ] && rm "$HOME/.openrc.env"
    export > "$HOME/.openrc.env"
  fi

  echo "Entering /sbin/init PID: $pid"
  exec sudo /usr/bin/nsenter -p -m -t "${pid}" -- su - "$USER"
fi

# Import ENV variables
if [ -f "$HOME/.openrc.env" ]; then
  set -a
  source "$HOME/.openrc.env"
  set +a
  rm "$HOME/.openrc.env"
fi
