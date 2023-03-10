# steps from https://guide2wsl.com/nerdctl/
containerDPath=$(asdf which containerd)
buildkitDPath=$(asdf which buildkitd)

pkill $containerDPath
pkill $buildkitDPath
