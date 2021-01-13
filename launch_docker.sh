#!/bin/bash

if [[ -z "${DATASET_DIR}" ]]; then
    echo "Environment variable 'DATASET_DIR' does not exist."
    echo "Please set it in ~/.bashrc using: 'export DATASET_DIR=/path/to/DATASET_DIR'"
    exit 1
fi

COMMAND="/bin/bash"

while test $# -gt 0
do
    case "$1" in
        --run) echo "Processing frames in:" $DATASET_DIR && mkdir -p $DATASET_DIR/output && COMMAND="./run.sh"
            ;;
    esac
    shift
done

docker run  --gpus all \
            --rm -ti \
            --volume=$(pwd):/raft:rw \
            -v $DATASET_DIR:/data/frames \
            --workdir=/raft \
            --ipc=host $USER/raft:latest \
            $COMMAND
