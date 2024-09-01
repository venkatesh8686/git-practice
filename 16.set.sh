#!/bin/bash

set -e

failure(){
    echo "Failed at: $1:$2"
}

trap 'failure "${LINENO}" "$BASH_COMMAND"' ERR

echo "hi venki keep goign"
echhhh "hello world"
echo "hii venki"