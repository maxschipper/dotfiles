status is-interactive || exit

abbr -a rls 'source ~/.config/fish/config.fish'

alias cd='z'
abbr -a cdr 'cd (git rev-parse --show-toplevel)'
abbr -a cdt 'cd (mktemp -d)'
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
abbr -a --set-cursor Which 'dirname (dirname (readlink -f $(which %)))'
abbr -a --set-cursor --command nix shell 'shell nixpkgs#%'
abbr -a up '$NH_FLAKE/scripts/flake/checkUp2Date.sh'
abbr -a audio '$NH_FLAKE/scripts/fix_audio.sh'

abbr -a --position anywhere wlc '| wl-copy'
abbr -a pss 'ps aux | grep -i'

abbr -a icloudpd 'icloudpd --username max.schipper1@icloud.com --directory /home/max/Pictures/icloud'

abbr -a wifi 'sudo ip link set wlp3s0 up'

abbr -a monoff 'hyprctl keyword monitor "eDP-1, disable"'
abbr -a monon 'hyprctl keyword monitor "eDP-1, 2880x1800@120, 0x0, 2"'
abbr -a sun 'hyprctl output create headless imac && sunshine && hyprctl output remove imac'

abbr -a eduup 'eduvpn-cli connect -n 1 && eduvpn-cli status'
abbr -a edudown 'eduvpn-cli disconnect && eduvpn-cli status'
abbr -a edustat 'eduvpn-cli status'

abbr -a sunsetrr 'sunsetr t 6500 100'

abbr -a failed 'systemctl --failed --no-pager && systemctl --user --failed --no-pager'
abbr -a makimaa 'sudo -Eb MAKIMA_CONFIG=/etc/makima makima'

abbr -a --position anywhere YT 'chromium --kiosk --enable-extensions --user-agent="Mozilla/5.0 (PS4; Leanback Shell) Gecko/20100101 Firefox/65.0 LeanbackShell/01.00.01.75 Sony PS4/ (PS4, , no, CH)" https://youtube.com/tv
'
