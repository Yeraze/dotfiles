function last_history_item
    echo $history[1]
end
abbr -a !! --position anywhere --function last_history_item

abbr -a vi nvim
abbr -a vim nvim
abbr -a ll "eza -la --header --icons --no-user --git --group-directories-first -M $argv"
abbr -a lll "eza -la --header --icons --no-user --git --group-directories-first --git-repos $argv"
abbr -a cat bat
abbr -a cd z
abbr -a ip "ipinfo myip"
abbr -a s savvy
abbr -a ws web-search
abbr -a ddg "web-search duckduckgo"
