
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

# check for running token renew loop and start if not found
# need dir for locking and logging
trap "echo killing background processes" SIGINT SIGHUP SIGQUIT SIGABRT SIGTERM 
mkdir -p ${HOME}/.dotfiles
# nohup ${HOME}/dotfiles/hc-vault-cli/renew-token-loop.sh >${HOME}/.dotfiles/renew-token-loop.log < /dev/null &
${HOME}/dotfiles/hc-vault-cli/renew-token-loop.sh >${HOME}/.dotfiles/renew-token-loop.log < /dev/null &
jobs -l
sleep 0.1
tail -n 1 ${HOME}/.dotfiles/renew-token-loop.log
