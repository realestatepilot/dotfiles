
# add all files found in dir to $KUBECONFIG
source ${HOME}/dotfiles/multi-cluster-config/export-kubeconfig

# tweak kubectl handling
source <(kubectl completion bash)
alias k=kubectl
complete -F __start_kubectl k

# add kubefix to path
export PATH=~/dotfiles/kubefix/:$PATH

# fix vault cli login
source ${HOME}/dotfiles/hc-vault-cli/fix-vaultcli-for-win