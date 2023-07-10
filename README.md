<div align="center">

# asdf-wsl-nerdctl [![Build](https://github.com/daveneeley/asdf-wsl-nerdctl/actions/workflows/build.yml/badge.svg)](https://github.com/daveneeley/asdf-wsl-nerdctl/actions/workflows/build.yml) [![Lint](https://github.com/daveneeley/asdf-wsl-nerdctl/actions/workflows/lint.yml/badge.svg)](https://github.com/daveneeley/asdf-wsl-nerdctl/actions/workflows/lint.yml)


[wsl-nerdctl](https://github.com/daveneeley/asdf-wsl-nerdctl) plugin for the [asdf version manager](https://asdf-vm.com).

</div>

# Contents

- [asdf-wsl-nerdctl  ](#asdf-wsl-nerdctl--)
- [Contents](#contents)
- [Dependencies](#dependencies)
- [Install](#install)
- [Additional Commands](#additional-commands)
- [Contributing](#contributing)
- [License](#license)

# Dependencies

- `bash`, `curl`, `tar`: generic POSIX utilities.
- `containerd`: responsible for storing and retrieving docker image layers

# Install

Plugin:

```shell
asdf plugin add wsl-nerdctl
# or
asdf plugin add wsl-nerdctl https://github.com/daveneeley/asdf-wsl-nerdctl.git
```

wsl-nerdctl:

```shell
# Show all installable versions
asdf list-all wsl-nerdctl

# Install specific version
asdf install wsl-nerdctl latest

# Set a version globally (on your ~/.tool-versions file)
asdf global wsl-nerdctl latest

# Now wsl-nerdctl commands are available
nerdctl -h
```

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to
install & manage versions.

# Additional Commands

```shell
# Get help on containerd
asdf wsl-nerdctl containerd

# Install containerd with systemd
asdf wsl-nerdctl containerd systemd

# Install containerd for openrc
asdf wsl-nerdctl containerd openrc

# Start containerd in foreground
asdf wsl-nerdctl containerd start

# Stop or cleanup containerd started in foreground
asdf wsl-nerdctl containerd stop

```

# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/daveneeley/asdf-wsl-nerdctl/graphs/contributors)!

# License

See [LICENSE](LICENSE) © [Dave Neeley](https://github.com/daveneeley/)
