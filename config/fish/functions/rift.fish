function rift --description 'rift wrapper that cds into created/removed workspaces'
    switch "$argv[1]"
        case init create remove
            set -l dir (command rift --shell-cwd $argv); or return $status
            test -n "$dir"; and cd -- $dir
        case '*'
            command rift $argv
    end
end
