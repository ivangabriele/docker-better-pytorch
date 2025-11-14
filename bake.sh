#!/bin/bash

# if [ "$#" -lt 1 ]; then
#     echo "Usage: ./bake.sh <pytorch_version>"
#     exit 1
# fi

docker buildx bake -f versions.hcl -f recipe.hcl "$@"
