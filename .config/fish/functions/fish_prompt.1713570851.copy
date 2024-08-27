function _common_section
    printf "$c1 $argv[1] $c0 : $c2 $argv[2..-1] $c0 , "
end
 
function section
    _common_section $argv[1] $c3 $argv[2] $ce
end
 
function error
    _common_section $argv[1] $ce $argv[2] $ce
end


function fish_prompt --description 'Write out the prompt'
  
  set -l last_status $status

  set -g c0 (set_color 005284)
  set -g c1 (set_color 0075cd)
  set -g c2 (set_color 009eff)
  set -g c3 (set_color 6dc7ff)
  set -g c4 (set_color ffffff)
  set -g ce (set_color $fish_color_error)

  # Just calculate these once, to save a few cycles when displaying the prompt
  if not set -q __fish_prompt_hostname
    set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
  end

  if not set -q __fish_prompt_normal
    set -g __fish_prompt_normal (set_color normal)
  end
  
  if not set -q -g __fish_classic_git_functions_defined
    set -g __fish_classic_git_functions_defined

    function __fish_repaint_user --on-variable fish_color_user --description "Event handler, repaint when fish_color_user changes"
      if status --is-interactive
        set -e __fish_prompt_user
        commandline -f repaint ^/dev/null
      end
    end
    
    function __fish_repaint_host --on-variable fish_color_host --description "Event handler, repaint when fish_color_host changes"
      if status --is-interactive
        set -e __fish_prompt_host
        commandline -f repaint ^/dev/null
      end
    end
    
    function __fish_repaint_status --on-variable fish_color_status --description "Event handler; repaint when fish_color_status changes"
      if status --is-interactive
        set -e __fish_prompt_status
        commandline -f repaint ^/dev/null
      end
    end
  end

  set -l delim '>'

  switch $USER

  case root

    if not set -q __fish_prompt_cwd
      if set -q fish_color_cwd_root
        set -g __fish_prompt_cwd (set_color $fish_color_cwd_root)
      else
        set -g __fish_prompt_cwd (set_color $fish_color_cwd)
      end
    end

  case '*'

    if not set -q __fish_prompt_cwd
      set -g __fish_prompt_cwd (set_color $fish_color_cwd)
    end

  end

  set -l prompt_status
  if test $last_status -ne 0
    if not set -q __fish_prompt_status
      set -g __fish_prompt_status (set_color $fish_color_status)
    end
    set prompt_status "$__fish_prompt_status [$last_status]$__fish_prompt_normal"
  end

  if not set -q __fish_prompt_user
    set -g __fish_prompt_user (set_color $fish_color_user)
  end
  if not set -q __fish_prompt_host
    set -g __fish_prompt_host (set_color $fish_color_host)
  end

  printf "=== ["
  printf (date "+%H:%M")
  printf "] "

  ~/bin/battery.py ( set_color green ) (set_color yellow ) (set_color red) (set_color white)
  #xeno_list
  if set -q CURRENT_SOURCE
      echo $CURRENT_SOURCE
  end
  # Track the last non-empty command. It's a bit of a hack to make sure
  # execution time and last command is tracked correctly.
  if set -q CMD_DURATION
    if test $CMD_DURATION -gt 60000
      section "Took" (math -s0 "$CMD_DURATION / 60000")" min, "(math -s1 "($CMD_DURATION % 60000) / 1000")" sec"
    else
      if test $CMD_DURATION -gt 1000 > /dev/null
        section "Took" (math -s1 "$CMD_DURATION / 1000")"s"
      end
    end
  end
  printf "\n"

  echo -n -s "$__fish_prompt_host" "$__fish_prompt_hostname" "$__fish_prompt_normal" ' ' "$__fish_prompt_cwd" (prompt_pwd) (__fish_git_prompt) "$__fish_prompt_normal" "$prompt_status" "$delim" ' '
end
