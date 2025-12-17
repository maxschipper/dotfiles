#! /usr/bin/env bash

# if [ $# -eq 0 ]; then
#     echo "Error: No arguments provided." >&2
#     exit 1
# fi

FULL_FILE="$1"

# "${VAR##*.}" is a standard Bash parameter expansion
EXTENSION="${FULL_FILE##*.}"

# echo "DEBUG: file = $FULL_FILE"
# echo "DEBUG: extension = $EXTENSION"

case "$EXTENSION" in
    py)
        uv run "$FULL_FILE"
        ;;
    # js)
    #     echo "🟨 Running Node..."
    #     node "$FULL_FILE"
    #     ;;
    go)
        go run "$FULL_FILE"
        ;;
    rs)
        # echo "🦀 Running Rust..."
        # Assuming single file script, or change to 'cargo run' if inside a project
        rustc "$FULL_FILE" && "./${FULL_FILE%.*}"
        ;;
    sh)
        # echo "🐚 Running Shell..."
        "./$FULL_FILE"
        ;;
    # nix)
    #     ;;
    *)
        echo " No runner configured for extension: .$EXTENSION"
        ;;
esac

