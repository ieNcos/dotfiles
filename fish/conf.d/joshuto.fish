function jo
    set ID "$fish_pid"
    mkdir -p /tmp/$USER
    set OUTPUT_FILE "/tmp/$USER/joshuto-cwd-$ID"
    # execute joshuto
    env joshuto --output-file "$OUTPUT_FILE" $argv
    # receive exit_code
    set exit_code $status

    switch "$exit_code"
        case 0
            ;;
        case 101
            set JOSHUTO_CWD $(cat "$OUTPUT_FILE")
            cd "$JOSHUTO_CWD"
            ;;
        case 102
            ;;
        case *
            echo "Exit code: $exit_code"
            ;;
    end
end
