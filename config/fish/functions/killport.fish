function killport --argument-names port
    set -l pids (lsof -tiTCP:$port -sTCP:LISTEN)

    if test (count $pids) -eq 0
        echo "Nothing is listening on port $port"
        return 1
    end

    kill -TERM $pids
    sleep 1

    set pids (lsof -tiTCP:$port -sTCP:LISTEN)
    if test (count $pids) -gt 0
        echo "Process did not stop; sending SIGKILL"
        kill -KILL $pids
    end
end
