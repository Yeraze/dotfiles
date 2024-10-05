# nvm
function agv --description "Find text in a file and open it in neovim"
    ag $argv | cut -d: -f 1 | uniq | fzf --preview="ag -A -B --nofilename --color $argv {}" | xargs nvim
end
