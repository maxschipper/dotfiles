function lst
    if test -z "$argv"
        lsd -A --tree --depth 2 -I .git \
            -I .jj \
            -I __pycache__ \
            -I node_modules
    else
        lsd -A --tree --depth $argv -I .git \
            -I .jj \
            -I __pycache__ \
            -I node_modules
    end
end
