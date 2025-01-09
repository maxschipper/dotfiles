function lst
    if test -z $argv
        lsd -A --tree --depth 2
    else
        lsd -A --tree --depth $argv
    end
end
