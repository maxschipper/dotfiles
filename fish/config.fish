if status is-interactive
    # Commands to run in interactive sessions can go here

    ### ADD TO $PATH
    fish_add_path $HOME/.local/bin
    fish_add_path $XDG_DATA_HOME/go/bin #     Go
    fish_add_path $XDG_DATA_HOME/cargo/bin #  Rust
    fish_add_path $XDG_DATA_HOME/npm/bin #    Node.js
    fish_add_path /usr/local/opt/llvm/bin #   LLVM
    fish_add_path /Library/TeX/texbin #       TeX
    fish_add_path $HOME/.bun/bin #            Bun


    # aliases and fish abbreviations
    ### LS ALIAS
    abbr -a l ls
    alias ls='lsd -AF'
    abbr -a llst 'lsd --long --tree --total-size -S'

    alias cd='z'
    abbr -a rls 'source ~/.config/fish/config.fish'
    alias rmds='rm .DS_Store'
    alias rmdsall="find . -type f -name '.DS_Store' -ls -delete"
    alias cl='clear && ls'
    alias clf='clear && fastfetch'
    abbr -a c clear
    alias lg='lazygit'
    alias f='y'
    alias hxx='hx .'
    alias todo='glow .todo.md'
    abbr -a todos 'rg --color=always "TODO:" --hidden .'
    abbr -a gitinit 'git init && git add . && git commit -m "Initial commit"'
    abbr -a gorun 'clear && go run main.go'
    alias make='gmake'
    abbr -a cat bat
    abbr -a catt 'bat *.*'
    abbr -a cata 'bat *.*'
    abbr -a pwdcopy 'pwd | pbcopy'
    abbr -a --position anywhere copyy '| pbcopy'
    # alias man='man -P bat'
    abbr -a zs 'zellij attach --create-background'
    abbr -a dotfiles zellij attach -c "' dotfiles'"

    # downloads the yt video and extracts the audio
    abbr -a --set-cursor mp3dl yt-dlp --extract-audio --audio-format mp3 --audio-quality 0 \"%\"


    # BREW abbreviations
    abbr -a bu "brew update && brew upgrade"
    abbr -a bs brew search
    abbr -a bi brew install
    abbr -a binf brew info
    # TODO: fish function "bii" will do a brew info $argv[1] then ask the user if he wants to install, if yes brew install $argv[1]
    # function bii { brew info $argv[1] && read -q "REPLY?(Install $argv[1]?) " && brew install $argv[1] }



    ### HELIX MACROS
    # alias ddate='date -u +%Y-%m-%d'



    # ENVIRONMENT VARIABLES

    set -gx EDITOR hx

    # Set XDG Base Directories according to the standard
    set -gx XDG_DATA_HOME "$HOME/.local/share"
    set -gx XDG_CONFIG_HOME "$HOME/.config"
    set -gx XDG_STATE_HOME "$HOME/.local/state"
    set -gx XDG_CACHE_HOME "$HOME/.cache"

    # Set directories for annoying applications
    set -gx NODE_REPL_HISTORY "$XDG_STATE_HOME/node_repl_history"
    set -gx NVM_DIR "$XDG_DATA_HOME/nvm"
    set -gx PLATFORMIO_CORE_DIR "$XDG_DATA_HOME/platformio"
    set -gx TLDR_CACHE_DIR "$XDG_CACHE_HOME/tldr"
    set -gx TERMINFO "$XDG_DATA_HOME/terminfo"
    set -gx TERMINFO_DIRS "$XDG_DATA_HOME/terminfo:/usr/share/terminfo"
    set -gx CARGO_HOME "$XDG_DATA_HOME/cargo"
    set -gx GOPATH "$XDG_DATA_HOME/go"
    set -gx LESSHISTFILE /dev/null
    set -gx HOMEBREW_BUNDLE_FILE "$XDG_CONFIG_HOME/homebrew/Brewfile"

    # tell homebridge that its configs are relocated
    alias homebridge='homebridge -U $XDG_CONFIG_HOME/homebridge'


    #APP SETTINGS

    #### STARSHIP START
    starship init fish | source
    set -gx STARSHIP_CONFIG ~/.config/starship/starship.toml
    # enables the transient prompt for starship
    enable_transience
    #### STARSHIP END

    # fzf 
    # source ~/.config/fish/functions/fzf_key_bindings.fish
    set -gx FZF_DEFAULT_OPTS "--reverse --height=80% --bind=ctrl-z:ignore"


    # Configure auto-attach/exit to your likings (default is off).
    # set ZELLIJ_AUTO_ATTACH true
    # set ZELLIJ_AUTO_EXIT true
    # eval (zellij setup --generate-auto-start fish | string collect)
    # if not set -q ZELLIJ
    #     if test "$ZELLIJ_AUTO_ATTACH" = true
    #         zellij attach -c Default
    #     else
    #         zellij
    #     end

    #     if test "$ZELLIJ_AUTO_EXIT" = true
    #         kill $fish_pid
    #     end
    # end

    # zoxide setup | needs to be at the end
    zoxide init fish | source

end # interactive
