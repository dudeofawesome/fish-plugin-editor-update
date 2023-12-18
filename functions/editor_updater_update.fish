function editor_updater_update \
    --description "Updates your EDITOR if you're in an IDE integrated terminal."

    set --function --export enable_logging $argv[1]
    if not set --query argv[1]
        set --function --export enable_logging true
    end

    function l
        if "$enable_logging" != false
            echo $argv
        end
    end

    if string match -q "$TERM_PROGRAM" vscode; and which code >/dev/null
        l "Using VSCode editor."

        set --global --export EDITOR "code --wait"
    else
        l "Not using VSCode editor."
    end

end
