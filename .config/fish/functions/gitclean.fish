# clean
function gitclean -d "Execute a lengthy 'git clean' with progress"
    set -l linecount ( git clean -n | wc -l )
    echo (set_color green)$linecount objects to remove...(set_color normal)
    git clean -f | pv -l -s $linecount > /tmp/gitclean.log
    echo (set_color green)Important notices during clean: /tmp/gitclean.log (set_color yellow)
    grep -v '^Remov' /tmp/gitclean.log 
    echo (set_color green)Stashing any remaining changes..(set_color normal)
    git stash
end
