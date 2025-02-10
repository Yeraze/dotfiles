complete -x -c launch -d Hostname -a "(cat ~/.ssh/known_hosts | cut -d ' ' -f 1 | sort | uniq)"


function launch --description "Launch SSH to a newly named tmux window"
    tmux renamew $argv
    if string match -q "*hpc.mil*" $argv
        echo Using Kerberized SSH
        /usr/local/ossh/bin/ssh $argv
    else
        echo Using Vendor SSH
        /usr/bin/ssh $argv
    end
end
