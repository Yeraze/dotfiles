#
function sshw -d "SSH to a host and connect or start a wemux"
    set -x TERM xterm-256color
    ssh $argv -t '/usr/local/bin/wemux rogue || wemux rogue || usr/local/bin/wemux || wemux ||fish || /bin/bash'
end
