function true_false
    set line (cat) # Read the entire line from stdin
    set -l value_pairs "true:false yes:no on:off" # Define key-value pairs
    set -l value_arr (string split " " $value_pairs)

    # Iterate through each pair and perform replacement
    for pair in $value_arr
        set -l pair_arr (string split ":" $pair)
        set line (string replace -r $pair_arr[1] 'TEMP' -- $line)
        set line (string replace -r $pair_arr[2] $pair_arr[1] -- $line)
        set line (string replace -r 'TEMP' $pair_arr[2] -- $line)
    end

    echo $line # Output the modified line
end

# function true_false
#     set line (cat) # Read the entire input line from stdin

#     # Replace 'true' with 'false' and vice versa
#     set line (string replace -r 'true' 'TEMP_PLACEHOLDER' -- $line)
#     set line (string replace -r 'false' 'true' -- $line)
#     set line (string replace -r 'TEMP_PLACEHOLDER' 'false' -- $line)

#     echo $line # Output the modified line
# end
