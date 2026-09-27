function headcommit --description "Show the last n commits (default 1)"
    set -l n 1
    if test (count $argv) -gt 0
        set n $argv[1]
    end
    git log --oneline -n $n
end
