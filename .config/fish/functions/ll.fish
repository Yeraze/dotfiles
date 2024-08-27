function ll --wraps=ls --wraps='eza -la --no-user --git' --description 'alias ll=eza -la --no-user --git'
  eza -la --header --icons --no-user --git $argv
        
end
