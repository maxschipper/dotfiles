function set_tab_name_empty
    # If Zellij is not running, this is a no-op
    if not set -q ZELLIJ
        return 0
    end
    zellij action rename-tab ""
end
