# nvm
function launch --description "Launch SSH to a newly named tmux window"
    tmux renamew $argv
    /usr/local/ossh/bin/ssh $argv
end
