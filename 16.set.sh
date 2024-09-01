#!/bin/bash

set -ex

failuer(){
    echo "Failed at: $1:$2"

}
trap 'failuer "${LINENO}" "$BASH_COMMAND" '
echo "hi venki keep goign"
echhhh "hello world"
echo "hii venki"