#!/bin/bash

# # Save the current working directory
# original_dir=$(pwd)

# # Loop through each subdirectory
# for dir in */ ; do
#     # Enter the subdirectory
#     cd "$dir"

#     # Check if the directory is a git repository
#     if git rev-parse --git-dir > /dev/null 2>&1; then
#         # Get the name of the directory
#         branch_name=$(basename "$(pwd)")

#         # # Create an orphan branch with the name of the directory
#         # git checkout --orphan "$branch_name"
#         git switch $branch_name

#         # # Remove all files from the staging area
#         # # git rm -rf .

#         # # Make an initial commit
#         # git commit --allow-empty -m "Initial commit on empty branch $branch_name"

#         # # Push the branch to remote
#         # git push origin "$branch_name"
#         git push --force origin "$branch_name"
#     else
#         echo "Not a git repository: $dir"
#     fi

#     # Go back to the original directory
#     cd ..
# done



# Save the current working directory
# original_dir=$(pwd)

# # Loop through each subdirectory
# for dir in */ ; do
#     # Enter the subdirectory
#     cd "$dir"
#     # Get the current branch name
#     branch_name=$(git rev-parse --abbrev-ref HEAD)

#     git switch $branch_name

#     # Check if the directory is a git repository
#     if git rev-parse --git-dir > /dev/null 2>&1; then
#         # Fetch the latest data from the remote repository
#         git fetch

#         # Reset the current branch to match the remote branch
#         # WARNING: This will discard local changes and commits!
#         git reset --hard "origin/$branch_name"

#         # Alternatively, if you want to merge remote changes while keeping local changes, use:
#         # git pull origin "$branch_name"

#     else
#         echo "Not a git repository: $dir"
#     fi

#     # Go back to the original directory
#     cd "$original_dir"
# done

# Note: This script assumes that the local branch should exactly match the remote branch.
# It will discard any local changes and commits in favor of the remote state.



# URL of your remote repository


# URL of your remote repository
remote_repo_url="https://github.com/djtoler/finalKube"

# Save the current working directory
original_dir=$(pwd)

# Loop through each subdirectory
for dir in */ ; do
    # Enter the subdirectory
    cd "$dir"

    # Check if .git exists, if not, initialize Git and add remote
    if [ ! -d ".git" ]; then
        git init
        git remote add origin "$remote_repo_url"
    fi

    # Get the directory name, assumed to be the branch name
    branch_name=$(basename "$(pwd)")

    # Checkout a new branch with the same name as the directory
    git checkout -b "$branch_name"

    # Add all files and commit them
    git add .
    git commit -m "Initial commit for $branch_name"

    # Push the branch to remote
    git push --force -u origin "$branch_name"

    # Go back to the original directory
    cd "$original_dir"
done

# Note: Replace 'your-remote-repo-url' with the actual URL of your remote repository.
# This script assumes that each subdirectory's name matches the corresponding branch name in the remote.


# Note: Replace 'your-remote-repo-url' with the actual URL of your remote repository.
# This script assumes that each subdirectory's name matches the corresponding branch name in the remote.


