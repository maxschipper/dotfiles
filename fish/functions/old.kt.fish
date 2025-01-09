function old.kt -d "Kitty tab from ~/ .config/kitty/tabs-saved"
    set -l path "$HOME/.config/kitty/tabs-saved"
    set -l selected_dir (
        find "$path"/* -maxdepth 1  -type d |
        sed "s~$path/~~" |
        fzf --prompt 'tab> ' |
        sed "s~^~$path/~"
    )

    if test -n "$selected_dir"
        set -l tab_name (basename "$selected_dir")

        
        # Define the commands to run in each tab
        switch "$tab_name"
            case 'btop'
                set cmd 'btop'
                set selected_dir '~'
            case 'chezmoi'
                set cmd '' 
                set selected_dir "$HOME/.local/share/chezmoi/"
            case 'ir-remote'
                set cmd ''
                set selected_dir '~/'
            

            # Add more cases as needed
            # case '*'
            #     set cmd ''  # Default command if no specific case is matched
            #     set selected_dir '~/'
        end
        
        # Try to focus an existing tab with the same title
        kitty @ focus-tab --match title:"$tab_name" 2>/dev/null ||
        begin
            # Construct the full command to launch a new tab
            set -l full_command "kitty @ launch --type=tab --tab-title \"$tab_name\" --cwd \"$selected_dir\" $cmd"
            
            # Debug: Print the full command
            echo "Executing: $full_command"
            
            # Use eval to execute the launch command
            eval $full_command
        end
    end
end
