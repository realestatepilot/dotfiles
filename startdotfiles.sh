
# add all files found in dir to $KUBECONFIG
source ${HOME}/dotfiles/multi-cluster-config/export-kubeconfig

# tweak kubectl handling
source <(kubectl completion bash)
alias k=kubectl
complete -F __start_kubectl k
