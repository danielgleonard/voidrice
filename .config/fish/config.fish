if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Start X at login
if status is-login
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        exec startx "$XINITRC"
    end

    # Switch escape and caps if tty and no passwd required:
    sudo -n loadkeys $HOME/.local/share/larbs/ttymaps.kmap 2>/dev/null
end
