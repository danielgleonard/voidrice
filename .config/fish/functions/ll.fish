function ll --wraps=ls --wraps='exa --long -g --header --git --icons --sort type' --description 'alias ll exa --long -g --header --git --icons --sort type'
  exa --long -g --header --git --icons --sort type $argv; 
end
