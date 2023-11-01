#!/bin/bash

mkdir -p ${HOME}/.dotfiles
lockdir=${HOME}/.dotfiles/renew-token-loop.lock
if (mkdir "$lockdir" >/dev/null 2>&1)
then    # directory did not exist, but was created successfully
    echo 'vault token renew loop started' > ${HOME}/.dotfiles/renew-token-loop.log
    # continue script

    # Remove lockdir when the script finishes, or when it receives a signal
    trap 'rm -rf "$lockdir"' SIGHUP SIGINT SIGQUIT SIGABRT # remove directory when script finishes

    # Optionally create temporary files in this directory, because
    # they will be removed automatically:
    tmpfile=$lockdir/filelist

    # functional logic part
    # vault renew loop
    while true
    do
      vault token renew > /dev/null 2>&1
      sleep 2700
    done

else
    echo 'vault token renew loop already running' > ${HOME}/.dotfiles/renew-token-loop.log
    exit 0
fi