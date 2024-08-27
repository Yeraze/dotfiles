# xeno
#
#

function __fish_xeno_available_sessions
    xeno-list | tr : \t
end

function __fish_xeno_needs_command
  set cmd (commandline -opc)
  if [ (count $cmd) -eq 1 -a $cmd[1] = 'xeno' ]
    return 0
  end
  return 1
end

function __fish_xeno_using_command
  set cmd (commandline -opc)
  if [ (count $cmd) -gt 1 ]
    if [ $argv[1] = $cmd[2] ]
      return 0
    end
  end
  return 1
end

complete -f -c xeno -n '__fish_xeno_needs_command' -a 'list stop resume sync ssh edit'

complete -f -c xeno -n '__fish_xeno_needs_command' -a list --description 'List open sessions' 
complete -f -c xeno -n '__fish_xeno_using_command list' -a '(__fish_xeno_available_sessions)'

complete -f -c xeno -n '__fish_xeno_needs_command' -a stop --description 'Shutdown a session' 
complete -f -c xeno -n '__fish_xeno_using_command stop' -a '(__fish_xeno_available_sessions)'

complete -f -c xeno -n '__fish_xeno_needs_command' -a resume --description 'Resume a previously used session'
complete -f -c xeno -n '__fish_xeno_using_command resume' -a '(__fish_xeno_available_sessions)'

complete -f -c xeno -n '__fish_xeno_needs_command' -a sync --description 'Force a sync of data'
complete -f -c xeno -n '__fish_xeno_using_command sync' -a '(__fish_xeno_available_sessions)'

complete -f -c xeno -n '__fish_xeno_needs_command' -a ssh --description 'SSH to a host to prepare for editing'
complete -f -c xeno -n '__fish_xeno_needs_command' -a edit --description 'Edit a file'
