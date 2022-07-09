#!/usr/bin/env bash

set -euo pipefail

# TODO: Ensure this is the correct GitHub homepage where releases can be downloaded for wsl-nerdctl.
GH_REPO="https://github.com/containerd/nerdctl"
TOOL_NAME="wsl-nerdctl"
TOOL_TEST="nerdctl --version"

fail() {
  echo -e "asdf-$TOOL_NAME: $*"
  exit 1
}

curl_opts=(-fsSL)

if [ -n "${GITHUB_API_TOKEN:-}" ]; then
  curl_opts=("${curl_opts[@]}" -H "Authorization: token $GITHUB_API_TOKEN")
fi

sort_versions() {
  sed 'h; s/[+-]/./g; s/.p\([[:digit:]]\)/.z\1/; s/$/.z/; G; s/\n/ /' |
    LC_ALL=C sort -t. -k 1,1 -k 2,2n -k 3,3n -k 4,4n -k 5,5n | awk '{print $2}'
}

list_github_tags() {
  git ls-remote --tags --refs "$GH_REPO" |
    grep -o 'refs/tags/.*' | cut -d/ -f3- |
    sed 's/^v//' # NOTE: You might want to adapt this sed to remove non-version strings from tags
}

list_all_versions() {
  list_github_tags
}

get_os_artifact_name() {
  case "$OSTYPE" in
  darwin*) echo "linux" ;;
  linux*) echo "linux" ;;
  *) echo "$OSTYPE" ;;
  esac
}

get_system_arch() {
  archie=$(uname -m)
  archie=${archie/x86_64/amd64}
  archie=${archie/aarch64/arm64}
  archie=${archie/armv71/arm-v7}
  echo $archie
}

download_release() {
  local version filename url
  version="$1"
  filename="$2"
  platform=$(get_os_artifact_name)
  arch=$(get_system_arch)

  url="$GH_REPO/releases/download/v${version}/nerdctl-full-${version}-${platform}-${arch}.tar.gz"

  echo "* Downloading $TOOL_NAME release $version..."
  curl "${curl_opts[@]}" -o "$filename" -C - "$url" || fail "Could not download $url"
}

install_version() {
  local install_type="$1"
  local version="$2"
  local install_path="${3%/bin}/bin"

  if [ "$install_type" != "version" ]; then
    fail "asdf-$TOOL_NAME supports release installs only"
  fi

  (
    mkdir -p "$install_path"
    cp -r "$ASDF_DOWNLOAD_PATH"/* "$install_path"

    # TODO: Assert wsl-nerdctl executable exists.
    local tool_cmd
    tool_cmd="$(echo "$TOOL_TEST" | cut -d' ' -f1)"
    test -x "$install_path/$tool_cmd" || fail "Expected $install_path/$tool_cmd to be executable."

    sudo chown root "$install_path/$tool_cmd" || fail "Could not change $tool_cmd owner to root."
    sudo chmod +s "$install_path/$tool_cmd" || fail "Could not set uid bit on $tool_cmd."

    echo "$TOOL_NAME $version installation was successful!"
  ) || (
    rm -rf "$install_path"
    fail "An error ocurred while installing $TOOL_NAME $version."
  )
}
