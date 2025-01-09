function set_tab_name
    # If Zellij is not running, this is a no-op
    if not set -q ZELLIJ
        return 0
    end

    # Prompt the user for the tab name
    set -l tabName (read -P "What would you want to call this tab? - ")

    # Rename the tab in Zellij
    zellij action rename-tab $tabName
end
