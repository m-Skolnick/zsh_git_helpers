# Helpers for common git operations
#
# See README.md for details

alias gcpd='git checkout develop && gl'
alias gcpm='git checkout master && gl'
alias github="open https://github.$(git config remote.origin.url | cut -f2 -d.)"
alias git-assume-unchanged='git update-index --assume-unchanged'
alias git-no-assume-unchanged='git update-index --no-assume-unchanged'

alias pull_and_merge="_pull_and_merge"

local current_branch_name branch_to_merge

_merge_entered_branch_to_current() {
    echo "\nChecking out '$current_branch_name'...\n" &&
        git checkout $current_branch_name &&
        echo "\nMerging '$branch_to_merge' into '$current_branch_name'...\n" &&
        git merge $branch_to_merge
}

_update_entered_branch() {
    echo -e "Checking out '$branch_to_merge'...\n"

    if [ "$branch_to_merge" = "" ]; then
        echo "Error: Name of branch to merge cannot be empty"
        return 1
    fi

    git checkout $branch_to_merge &&
        echo -e "\nPulling '$branch_to_merge'...\n" &&
        git pull
}

_read_params() {
    # This line will echo its own error if not currently in git repo
    current_branch_name=$(git rev-parse --abbrev-ref HEAD)

    # Store command argument to variable
    branch_to_merge=$1
}

_pull_and_merge() {
    _read_params &&
        _update_entered_branch &&
        _merge_entered_branch_to_current
}
