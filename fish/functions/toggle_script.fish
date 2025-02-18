function toggle_script
    # toggles common boolean values used in config files
    # if no match was found it returns the input back without modification

    set line (cat) # Read the entire line from stdin



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
