#
function ssht -d "SSH to a host and connect or start a tmux"
    set -x TERM xterm-256color
    ssh $argv -t 'tmux a || tmux || fish || /bin/bash'
end
