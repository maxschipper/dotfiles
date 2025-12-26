function f --description "Smart opener: Yazi for empty, Helix for files, Fuzzy search for words"
    if test (count $argv) -eq 0
        y
        return
    end

    set -l target $argv[1]

    # if its a dir open with yazi
    if test -d $target
        y $target
        return
    end

    # if its not a dir but exists its a file and open with editor
    if test -e $target
        $EDITOR $target
        return
    end

    # error if there is for example a typo in an absolute path
    if string match -q "/*" $target
        echo "Error: The absolute path '$target' does not exist." >&2
        return 1
    end

    # echo "path not found, fuzzy searching for '$target' with depth of 3"
    set -l matches (fd --type f --max-depth 3 "$target")
    set -l count_matches (count $matches)

    if test $count_matches -eq 0
        echo "no matching files found for '$target'." >&2
        return 1
    else if test $count_matches -eq 1
        echo "Found: $matches[1]"
        $EDITOR $matches[1]
    else
        # multiple matches with fd, pick one with fzf    
        # --height and --reverse to make it look nice inline
        set -l selected (string join \n $matches | fzf --height 40% --layout=reverse --header="Multiple matches found:")

        if test -n "$selected"
            $EDITOR $selected
        end
    end
end
