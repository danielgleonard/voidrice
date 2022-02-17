function fish_prompt

  # Cache exit status
  set -l last_status $status

  # Set color for variables in prompt
  set -l normal (set_color normal)
  set -l text (set_color brwhite)
  set -l brblue (set_color brblue)
  set -l bryellow (set_color bryellow)
  set -l brgreen (set_color brgreen)
  set -l brred (set_color brred)
  set -l brblack (set_color brblack)
  set -l brcyan (set_color brcyan)
  set -l cyan (set_color cyan)
  set -l magenta (set_color magenta)
  set -l blue (set_color blue)
  set -l yellow (set_color yellow)
  set -l green (set_color green)
  set -l black (set_color black)
  set -l red (set_color red)

  # Configure __fish_git_prompt
  set -g __fish_git_prompt_char_stateseparator ' '
  set -g __fish_git_prompt_color cyan
  set -g __fish_git_prompt_color_flags red
  set -g __fish_git_prompt_color_prefix normal
  set -g __fish_git_prompt_color_suffix normal
  set -g __fish_git_prompt_showdirtystate true
  set -g __fish_git_prompt_showuntrackedfiles true
  set -g __fish_git_prompt_showstashstate true

  # FIXME: below var causes rendering issues with fish v3.2.0
  set -g __fish_git_prompt_show_informative_status true 


  # Only calculate once, to save a few CPU cycles when displaying the prompt
  if not set -q __fish_prompt_hostname
    # set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
    set -g __fish_prompt_hostname $yellow(hostname -f)(set_color brwhite)
  end
  if not set -q __fish_prompt_char
    if [ (id -u) -eq 0 ]
      set -g __fish_prompt_char (set_color red)'λ'(set_color brwhite)
    else
      set -g __fish_prompt_char 'λ'
    end
  end

  # change `at` to `ssh` when an interactive ssh session is present
  if [ "$SSH_TTY" = "" ]
    set -g location at
    # set -g __fish_prompt_hostname ($yellow)(hostname|cut -d . -f 1)
  else # connected via ssh
    if [ "$TERM" = "xterm-256color-italic" -o "$TERM" = "tmux-256color" ]
      set -g location (echo -e "\e[3mssh\e[23m")
      # set -g ssh_hostname (echo -e $blue$__fish_prompt_hostname)
      set -g __fish_prompt_hostname $brblue(hostname -f)(set_color brwhite)
    else
      set -g location ssh
      # set -g ssh_hostname (echo -e $blue$__fish_prompt_hostname)
      set -g __fish_prompt_hostname $brblue(hostname -f)(set_color brwhite)
    end
  end

  if [ (id -u) -eq 0 ]
    # top line > Superuser
    echo -n $red'╭─'$magenta$USER $text$location $__fish_prompt_hostname$text' in '$brgreen(pwd)$brcyan
    __fish_git_prompt " (%s)"
    echo
    # bottom line > Superuser
    echo -n $red'╰'
    echo -n $red'─'$__fish_prompt_char $text
  else # top line > non superuser's
    echo -n $text'╭─'$magenta$USER $text$location $__fish_prompt_hostname$text' in '$brgreen(pwd)$brcyan
    __fish_git_prompt " (%s)"
    echo
    # bottom line > non superuser's
    echo -n $text'╰'
    echo -n $text'─'$__fish_prompt_char $normal
  end

  # NOTE: disable `VIRTUAL_ENV_DISABLE_PROMPT` in `config.fish`
  # see:  https://virtualenv.pypa.io/en/latest/reference/#envvar-VIRTUAL_ENV_DISABLE_PROMPT
  # support for virtual env name
  if set -q VIRTUAL_ENV
      echo -n "($brcyan"(basename "$VIRTUAL_ENV")"$white)"
  end
end

