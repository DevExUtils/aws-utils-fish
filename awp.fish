function awp --description "Change AWS Profile"
set -f aws_profile
    switch "$argv"
        case -v --version
            echo "awp, version 1.0.0"
        case -h --help
            echo "Usage: awp  Run test files"
            echo "Options:"
            echo "       -v or --version  Print version"
            echo "       -h or --help     Print this help message"
        case "" '*'   
            if not set -q argv[1]
                set -f aws_profile (aws configure list-profiles | fzf --height 60% --layout=reverse --border)
            else
                echo $argv[1]
                set -f aws_profile (aws configure list-profiles | fzf -q $argv[1] --select-1 --exit-0 --height 60% --layout=reverse --border)
            end
        set -Ux AWS_PROFILE {$aws_profile}
    end
end