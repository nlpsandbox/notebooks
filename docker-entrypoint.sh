#!/usr/bin/env bash

set -e

if [ "$1" = 'rstudio' ]; then
    # RStudio userconf.sh script runs RStudio as $USER
    exec /init
elif [ "$1" = 'jupyter' ]; then
  exec /init gosu $USER /opt/miniconda/envs/nlpsandbox/bin/jupyter-lab --port=8888 --no-browser --ip=0.0.0.0
fi

exec /init gosu $USER "$@"