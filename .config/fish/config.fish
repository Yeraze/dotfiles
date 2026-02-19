set -g OS (uname)

set -x PATH /usr/local/opt/python@2/libexec/bin $PATH
set -x PATH ~/Library/Python/2.7/bin $PATH

thefuck --alias | source

#pyenv init - fish | source
fish_add_path /usr/local/opt/openjdk/bin

oh-my-posh init fish --config ~/.config/yeraze.omp.json | source
# enable_poshtransientprompt
zoxide init fish | source
tirith init --shell fish | source

if status --is-login
    SHELL=fish EDITOR=nvim PF_INFO="ascii title os host kernel uptime pkgs memory shell editor" pfetch
end

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/opt/homebrew/share/google-cloud-sdk/path.fish.inc' ]
    . '/opt/homebrew/share/google-cloud-sdk/path.fish.inc'
end
