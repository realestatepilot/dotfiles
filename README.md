# Summary for dotfiles 

Small tools for shell to make k8s admin life easier. 

# Usage

1. Checkout this repo into ~/dotfiles.

2. Define auto startup

Add 
```
source ~/startdotfiles.sh
```
at end of your ~/.bashrc

3. Use it

Start a new shell and use it. See separate chapters for functions.


# Functions

## multi-cluster-config
Config files in a directory will collected and added to $KUBECONFIG at startup shell. So adding and removing file is enough. No more merge of "master-config" needed.
Credits to https://github.com/GeertJohan/kube-multi-config

Tools will create `~/.kube-multi` directory. Put your cluster configfiles into this directory and restart your shell. kubectl will regognize the new files. To remove config-files just remove it from this directory. kubectl will recognize this immediately.

