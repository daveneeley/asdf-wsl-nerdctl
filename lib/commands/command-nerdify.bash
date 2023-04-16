#!/bin/bash
# file is marked executable so that it is executed directly instead of asdf sourcing it
binDir="${ASDF_INSTALL_PATH}"/bin
export CNI_PATH=$binDir/cni
echo $CNI_PATH
echo $ASDF_CMD_FILE
