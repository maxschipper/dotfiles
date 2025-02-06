function toggle

    set line (cat) # Read the entire line from stdin

    # Match the part of the line before the value (the '=' and the possible space after it)
    # set pre (string match -r '^=\s*' -- $line)

    # Get the value after the '=' sign, ignoring the possible space
    # set value (string replace -r '^=\s*' '' -- $line)


    switch $line
        # true/false
        case true
            echo false
        case false
            echo true

            # yes/no
        case yes
            echo no
        case no
            echo yes

            # y/n
        case y
            echo n
        case n
            echo y

            # on/off
        case on
            echo off
        case off
            echo on

            # no match: just return it without modification
        case "*"
            echo $line
    end
end
