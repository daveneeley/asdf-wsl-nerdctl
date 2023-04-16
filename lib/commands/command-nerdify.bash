#!/bin/bash
# file is marked executable so that it is executed directly instead of asdf sourcing it
binDir="${ASDF_INSTALL_PATH}"/bin
export CNI_PATH=$binDir/cni
echo $CNI_PATH
echo $ASDF_CMD_FILE
echo $ASDF_INSTALL_TYPE	version or ref
echo $ASDF_INSTALL_VERSION	full version number or Git Ref depending on ASDF_INSTALL_TYPE
echo $ASDF_INSTALL_PATH	the path to where the tool should, or has been installed
echo $ASDF_CONCURRENCY	the number of cores to use when compiling the source code. Useful for setting make -j
echo $ASDF_DOWNLOAD_PATH	the path to where the source code or binary was downloaded to by bin/download
echo $ASDF_PLUGIN_PATH	the path the plugin was installed
echo $ASDF_PLUGIN_SOURCE_URL	the source URL of the plugin
echo $ASDF_PLUGIN_PREV_REF	prevous git-ref of the plugin repo
echo $ASDF_PLUGIN_POST_REF	updated git-ref of the plugin repo
echo $ASDF_CMD_FILE	resolves to the full path of the file being sourced
