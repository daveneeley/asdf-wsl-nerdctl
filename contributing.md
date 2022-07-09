# Contributing

Testing Locally:

```shell
asdf plugin test <plugin-name> <plugin-url> [--asdf-tool-version <version>] [--asdf-plugin-gitref <git-ref>] [test-command*]

#
asdf plugin test wsl-nerdctl https://github.com/daveneeley/asdf-wsl-nerdctl.git "nerdctl -h"
```

Tests are automatically run in GitHub Actions on push and PR.
