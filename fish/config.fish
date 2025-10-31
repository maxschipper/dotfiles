if status is-interactive
    # Commands to run in interactive sessions can go here
    function fish_greeting
        fastfetch
        glow $HOME/.shell-todo.md -w 50
    end

    alias ls='lsd -AF'
    alias ll='lsd -AF --group-directories-first --blocks git --blocks name --blocks permission --blocks user --blocks group --blocks size --blocks date --date relative'
    alias l='lsd -AF1'

    # abbr -a l ', nu -c ls'

    #### STARSHIP START
    # starship init fish | source
    # set -gx STARSHIP_CONFIG ~/.config/starship/starship.toml
    # # enables the transient prompt for starship
    # enable_transience
    #### STARSHIP END

    # zoxide setup | needs to be at the end
    zoxide init fish | source

end # interactive
