function cls --description 'Clear screen and push current view to scrollback'
        if status test-terminal-feature scroll-content-up
                commandline -f scrollback-push
        end
    
        clear -x
    
end
