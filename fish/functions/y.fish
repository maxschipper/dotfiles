function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    command yazi $argv --cwd-file="$tmp"
    if read -z cwd <"$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        if string match -q "search://*" -- "$cwd"
            set cwd (string replace -r '^search://[^/]*/' '' -- "$cwd")
        end
        if test -d "$cwd"
            builtin cd -- "$cwd"
        end
    end
    rm -f -- "$tmp"
end
