fzf --fish | source
# fzf.fish is only meant to be used in interactive mode. If not in interactive mode and not in CI, skip the config to speed up shell startup
if not status is-interactive && test "$CI" != true
    exit
end

# Because of scoping rules, to capture the shell variables exactly as they are, we must read
# them before even executing _fzf_search_variables. We use psub to store the
# variables' info in temporary files and pass in the filenames as arguments.
# This variable is global so that it can be referenced by fzf_configure_bindings and in tests
set --global _fzf_search_vars_command '_fzf_search_variables (set --show | psub) (set --names | psub)'


# Install the default bindings, which are mnemonic and minimally conflict with fish's preset bindings
#fzf_configure_bindings
fzf_configure_bindings --directory=\ct --variables=\e\cv --git_status=\cs --git_log=\cg

# Doesn't erase autoloaded _fzf_* functions because they are not easily accessible once key bindings are erased
function _fzf_uninstall --on-event fzf_uninstall
    _fzf_uninstall_bindings

    set --erase _fzf_search_vars_command
    functions --erase _fzf_uninstall _fzf_migration_message _fzf_uninstall_bindings fzf_configure_bindings
    complete --erase fzf_configure_bindings

    set_color cyan
    echo "fzf.fish uninstalled."
    echo "You may need to manually remove fzf_configure_bindings from your config.fish if you were using custom key bindings."
    set_color normal
end

# Set fzf defaults
set -l preview_label 'Opt-Arrows: Scroll Preview'
set -x FZF_DEFAULT_COMMAND fdfind --color=always
set -x FZF_DEFAULT_OPTS \
    --ansi \
    --cycle \
    --multi \
    --border \
    --info=right \
    --height=89% \
    --marker=⋅ \
    --layout=reverse \
    --preview-label=\"$preview_label\" \
    --preview-label-pos=-3:bottom \
    --bind="backward-eof:abort" \
    --bind='"alt-up:preview-up"' \
    --bind='"alt-down:preview-down"'
