#!/bin/bash
binDir=$(dirname $(asdf which nerdctl))
# file is marked executable so that it is executed directly instead of asdf sourcing it
export CNI_PATH=$binDir/cni
echo $CNI_PATH
