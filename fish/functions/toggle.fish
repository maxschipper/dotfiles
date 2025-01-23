function toggle

    set line (cat) # Read the entire line from stdin

    # Match the part of the line before the value (the '=' and the possible space after it)
    set pre (string match -r '^=\s*' -- $line)

    # Get the value after the '=' sign, ignoring the possible space
    set value (string replace -r '^=\s*' '' -- $line)


    switch $value
        case true
            set inverted false
        case false
            set inverted true

        case yes
            set inverted no
        case no
            set inverted yes

        case y
            set inverted n
        case n
            set inverted y

        case on
            set inverted off
        case off
            set inverted on

        case "*"
            set inverted ERROR
            echo $line
            return
    end

    echo "$pre$inverted"

end
