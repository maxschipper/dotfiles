status is-interactive || exit

abbr -a rls 'source ~/.config/fish/config.fish'

alias cd='z'
abbr -a c clear
abbr -a clf 'clear && fastfetch'

#ls - needs to be in config.fish because they get overwritten by the default functions otherwise
# alias ls='lsd -AF'
# alias l='lsd -AF --group-directories-first --blocks git --blocks name --blocks permission --blocks user --blocks group --blocks size --blocks date --date relative'
abbr -a llst 'lsd --long --tree --total-size -S'

alias f='y'
alias hxx='hx .'
abbr -a h hx .
alias lg='lazygit'
abbr -a ff fastfetch

abbr -a todos 'rg --color=always "TODO:" --hidden .'
abbr -a cat bat
abbr -a catt 'bat *.*'
abbr -a cata 'bat *.*'

abbr -a --set-cursor which 'readlink -f $(which %)'
abbr -a --set-cursor --command nix shell 'shell nixpkgs#%'
abbr -a up '~/nix/scripts/flake/checkUp2Date.sh'

abbr -a --position anywhere wlc '| wl-copy'
abbr -a pss 'ps aux | grep -i'

abbr -a icloudpd 'icloudpd --username max.schipper1@icloud.com --directory /home/max/Pictures/icloud'

abbr -a wifi 'sudo ip link set wlp3s0 up'
