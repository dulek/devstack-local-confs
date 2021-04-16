alias kss="kubectl -n kube-system"
alias krc='kss delete pod `kss get pods | grep kuryr-controller | cut -d " " -f 1`'
alias watch="watch "
alias openrc="source /opt/stack/devstack/openrc admin admin"
alias stack="/opt/stack/devstack/stack.sh"

alias sc="sudo systemctl"
alias jc="sudo journalctl"

function unstack {
    /opt/stack/devstack/unstack.sh
    for instance in `sudo virsh list --all --name`;
      do sudo virsh destroy $instance
      sudo virsh undefine $instance
    done
    sudo umount `mount | grep kube | cut -d " " -f 3`
    sudo rm -rf /var/lib/docker && sudo rm -rf /opt/stack/data
    sudo rm -rf /etc/octavia
}

function jdf {
    sudo journalctl -f -u devstack@"$1"
}

function sd {
    sudo systemctl $1 devstack@"$2"
}
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

openrc
