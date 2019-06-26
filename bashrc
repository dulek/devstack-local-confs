
alias kss="kubectl -n kube-system"
alias watch="watch "
alias openrc="source /opt/stack/devstack/openrc admin admin"
alias stack="/opt/stack/stack.sh"
alias unstack="/opt/stack/unstack.sh"

alias sc="sudo systemctl"
alias jc="sudo journalctl"

function jdf {
    sudo journalctl -f -u devstack@"$1"
}

function sd {
    sudo systemctl $1 devstack@"$2"
}
