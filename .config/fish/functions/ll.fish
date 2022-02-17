function ll --wraps=ls --wraps='exa --long --header --git --icons --sort type' --description 'alias ll exa --long --header --git --icons --sort type'
  exa --long --header --git --icons --sort type $argv; 
end
