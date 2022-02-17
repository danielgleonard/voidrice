function yt --wraps='youtube-dl --add-metadata -i' --description 'alias yt youtube-dl --add-metadata -i'
  youtube-dl --add-metadata -i $argv; 
end
