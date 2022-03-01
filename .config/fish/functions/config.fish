# Defined in - @ line 1
function config --description 'alias config=git --git-dir="$HOME/.dotfiles" --work-tree="$HOME"'
    git --git-dir="$HOME/.dotfiles" --work-tree="$HOME" $argv;
end