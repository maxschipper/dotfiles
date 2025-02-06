function todos
    # rg "TODO:" --hidden "$argv" | glow -p
    # rg "TODO:" --hidden . | glow -p
    #
    # TODO: replace . with argv[1]

    set todos (gum spin --spinner meter --title "Searching Todos..." --show-output -- rg "TODO:" --hidden .)
    # echo "todos: $todos"


    set todo_list (string split "\n\n" $todos)



    # for todo in $todo_list
    #     set x (string split --max 1 ":" $todo)
    #     set file $x[1]
    #     set text (string trim $x[2])
    #     set text (string replace -r '.*TODO: (.*)' '$1' -- $text)

    #     set all_todos $all_todos $text
    # end
    # gum choose $all_todos





    for todo in $todo_list


        set x (string split --max 1 ":" $todo)
        set file $x[1]
        set text (string trim $x[2])
        set text (string replace -r '.*TODO: (.*)' '$1' -- $text)

        # echo "new entry"
        # echo ""

        # echo "file: $file"
        # echo ""
        # echo "todo: $text"
        # echo ""
        # echo ""
        # echo ""

        # gum format -- "- $file" "*TODO:* **$text**"



        gum style \
            --border-foreground 212 --border rounded \
            --align left --width 50 --margin "0 1" --padding "0 1" --faint \
            $file "TODO: $text"

        # return
    end



    # echo $todos

end
