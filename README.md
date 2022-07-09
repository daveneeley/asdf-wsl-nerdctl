<div align="center">

# asdf-wsl-nerdctl [![Build](https://github.com/daveneeley/asdf-wsl-nerdctl/actions/workflows/build.yml/badge.svg)](https://github.com/daveneeley/asdf-wsl-nerdctl/actions/workflows/build.yml) [![Lint](https://github.com/daveneeley/asdf-wsl-nerdctl/actions/workflows/lint.yml/badge.svg)](https://github.com/daveneeley/asdf-wsl-nerdctl/actions/workflows/lint.yml)


[wsl-nerdctl](https://github.com/daveneeley/asdf-wsl-nerdctl) plugin for the [asdf version manager](https://asdf-vm.com).

</div>

# Contents

- [Dependencies](#dependencies)
- [Install](#install)
- [Contributing](#contributing)
- [License](#license)

# Dependencies

**TODO: adapt this section**

- `bash`, `curl`, `tar`: generic POSIX utilities.
- `SOME_ENV_VAR`: set this environment variable in your shell config to load the correct version of tool x.

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

# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/daveneeley/asdf-wsl-nerdctl/graphs/contributors)!

# License

See [LICENSE](LICENSE) © [Dave Neeley](https://github.com/daveneeley/)
