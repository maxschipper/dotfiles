if status is-interactive
    # Commands to run in interactive sessions can go here
    function fish_greeting
        fastfetch
    end

    #### STARSHIP START
    # starship init fish | source
    # set -gx STARSHIP_CONFIG ~/.config/starship/starship.toml
    # # enables the transient prompt for starship
    # enable_transience
    #### STARSHIP END

    # zoxide setup | needs to be at the end
    zoxide init fish | source

end # interactive
