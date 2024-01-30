# Summary for dotfiles 

Small tools for shell to make k8s admin life easier. 
Most solutions tested with Ubuntu and Git Bash for Windows.

# Usage

1. Checkout this repo into ~/dotfiles.

2. Define auto startup

Add 
```
source ~/dotfiles/startdotfiles.sh
```
at end of your ~/.bashrc

3. Use it

Start a new shell and use it. See separate chapters for functions.


## Requirements MacOS x

### using bash
* installed brew

```
brew install bash-completion 
```
add to ~/.basrc
```
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
```

### using zsh
* installed brew
```
brew install zsh-completion 
```

# Functions

## multi-cluster-config

Config files in a directory will be collected and added to $KUBECONFIG at startup shell. So adding and removing file is enough. No more merge of "master-config" needed.
Credits to https://github.com/GeertJohan/kube-multi-config

Tools will create `~/.kube-multi` directory. Put your cluster configfiles into this directory and restart your shell. kubectl will recognize the new files. To remove config-files just remove it from this directory. kubectl will recognize this immediately.

If `~/.kube-shared` directory exists theese file will also merged into $KUBECONFIG environemnt variable. This can be used to share configs with other team members seperated from private config files.

Config files must name *.yaml or *.yml.

## kubectl alias

'k' set as alias for kubectl and enable bash completion with 'tab'

## kubefix

Needs installed python3.

Rename contexts and clusters in a kubectl config file. See `kubefix -h` for details.

## Hashicorps Vault CLI 

This CLI dont work under Windows git bash for login. See https://github.com/hashicorp/vault/issues/4946#issuecomment-695457902 for a hack. This is integrated in theese dot-files.

# Credits

Most of thees snippets are collected from other authors.

https://github.com/GeertJohan/kube-multi-config