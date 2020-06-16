# Helpers for common git operations
#
# @author Micaiah Skolnick mskolnickdev@gmail.com
#
# See README.md for details and instructions

alias gcpd='git checkout develop && gl'
alias gcpm='git checkout master && gl'
alias github="open https://github.$(git config remote.origin.url | cut -f2 -d.)"
alias git-assume-unchanged='git update-index --assume-unchanged'
alias git-no-assume-unchanged='git update-index --no-assume-unchanged'

alias fetch_and_merge="_fetch_and_merge"

_fetch_and_merge() {
    _update_entered_branch $1 &&
        _merge_entered_branch_to_current $1
}

_update_entered_branch() {
    local branch_to_merge=$1
    echo -e "Updating '$branch_to_merge'..."

    if [ "$branch_to_merge" = "" ]; then
        echo "\nError: Name of branch to merge cannot be empty"
        return 1
    fi

    git fetch origin $branch_to_merge:$branch_to_merge
}

_merge_entered_branch_to_current() {
    local branch_to_merge=$1
    local current_branch_name=$(git rev-parse --abbrev-ref HEAD)
    echo "\nMerging '$branch_to_merge' into '$current_branch_name'...\n" &&
        git merge $branch_to_merge
}

# [START git-auto-status gist]
# Taken from: https://gist.github.com/oshybystyi/475ee7768efc03727f21
#
# Run git status after specified set of command
#
# @author Oleksandr Shybystyi oleksandr.shybystyi@gmail.com
#

# List of git commands `git status` will run after
gitPreAutoStatusCommands=(
    'add'
    'rm'
    'reset'
    'commit'
    'checkout'
    'mv'
    'init'
)

# taken from http://stackoverflow.com/a/8574392/4647743
function elementInArray() {
  local e
  for e in "${@:2}"; do [[ "$e" == "$1" ]] && return 0; done
  return 1
}

function git() {
    command git $@
    if (elementInArray $1 $gitPreAutoStatusCommands); then
        echo "\n git status: \n"
        command git status
    fi
}
# [END git-auto-status gist]