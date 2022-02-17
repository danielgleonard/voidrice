function ls --wraps='exa --sort type' --description 'alias ls exa --sort type'
  exa --sort type $argv; 
end
