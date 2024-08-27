#. ~/.config/fish/functions/vi-mode.fish
#. ~/.config/fish/functions/prompt_src.fish
set -g OS (uname)

#function fish_user_keybindings # Deprecated
#        vi_mode_insert
#end
#function fish_user_key_bindings
#        vi_mode_insert
#end


set -x PATH /usr/local/opt/python@2/libexec/bin $PATH

set -x PATH ~/Library/Python/2.7/bin $PATH

test -e {$HOME}/.iterm2_shell_integration.fish; and source {$HOME}/.iterm2_shell_integration.fish

thefuck --alias | sed -e 's/&&/; AND/g' | source
thefuck --alias | source
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && bass . "/usr/local/opt/nvm/nvm.sh" # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && bass . "/usr/local/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion
[ -s "~/.config/lsx/lsx.sh" ] && bass . "~/.config/lsx/lsx.sh" # Load up LSX

eval ( pyenv init --path )
fish_add_path /usr/local/opt/openjdk/bin

oh-my-posh --init --shell fish --config ~/.backup/yeraze.omp.json | source
# enable_poshtransientprompt
zoxide init fish | source
alias cd=z
fzf --fish | source
fzf_configure_bindings --directory=\ct --variables=\e\cv --git_status=\cs --git_log=\cl

alias vi=nvim
