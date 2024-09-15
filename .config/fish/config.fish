set -g OS (uname)

set -x PATH /usr/local/opt/python@2/libexec/bin $PATH
set -x PATH ~/Library/Python/2.7/bin $PATH

thefuck --alias | source

eval ( pyenv init --path )
fish_add_path /usr/local/opt/openjdk/bin

oh-my-posh --init --shell fish --config ~/.backup/yeraze.omp.json | source
# enable_poshtransientprompt
zoxide init fish | source

if status --is-login
    SHELL=fish EDITOR=nvim PF_INFO="ascii title os host kernel uptime pkgs memory shell editor" pfetch
end
