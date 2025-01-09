function todos
    # rg "TODO:" --hidden "$argv" | glow -p
    # rg "TODO:" --hidden . | glow -p
    rg --color=always --glob '!*.log' "TODO:" --hidden .
end
