# e.g. merges_between fc-release-8.8.70 fc-release-8.8.72

merges_between(){
    local start_commit="${1}"
    local end_commit="${2}"
    local range=$(git rev-parse "${start_commit}")..$(git rev-parse "${end_commit}")
    echo "${range}"
    git log --merges --first-parent "${range}"

}