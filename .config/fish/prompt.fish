#!/usr/bin/fish

function parse_git_branch -d 'Used to show git info in prompt'
  set branch (git rev-parse --abbrev-ref HEAD 2>/dev/null)

  if [ $status -eq 0 ]

    if [ $branch = "HEAD" ]
      set branch (git rev-parse --short HEAD 2>/dev/null)
    end

    echo -n ' on '
    set_color purple
    echo -n $branch

    set git_status (git status --porcelain 2>/dev/null)
    if test -n (echo $git_status)
      echo -n '*'
    end

    set_color normal
  end
end

function fish_prompt -d 'Set custom prompt'
  # cache variable rather than calculate each time
  if not set -q __fish_prompt_hostname
		set -g __fish_prompt_hostname (hostname | cut -d . -f 1)
	end

  set_color red
  echo -n '['
  set_color yellow
  echo -n $USER

  set_color green
  echo -n '@'

  set_color blue
  echo -n $__fish_prompt_hostname
  set_color normal
  echo -n ' '

  set_color magenta
  echo -n (prompt_pwd)

  set_color red
  echo -n ']'

  set_color normal
  parse_git_branch

  set_color white
  echo -n '$ '
  set_color normal

end
