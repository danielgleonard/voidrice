# Defined in - @ line 0
function config --description 'Command the git directory of config files in $HOME'
	/usr/bin/git --git-dir=$HOME/.dotfiles-config/ --work-tree=$HOME $argv;
end
