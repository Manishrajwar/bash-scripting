### author -> manish singh rajwar
#date : 2 jan 2025
#version -> v1
#
#
# SCRIPT DETAIL -> this script contain fetch all the user of the repo of github that are actively collaborators 
# Required -> export two variables before running this script (username and token) these detail get from github 
# Send two arguments such as repo_owner and repo_name while calling this script 


#!/bin/bash

# GitHub API URL
API_URL="https://api.github.com"

# GitHub username and personal access token
USERNAME=$username
TOKEN=$token

# User and Repository information
REPO_OWNER=$1
REPO_NAME=$2

# Function to make a GET request to the GitHub API
function github_api_get {
    local endpoint="$1"
    local url="${API_URL}/${endpoint}"

    # Send a GET request to the GitHub API with authentication
    curl -s -u "${USERNAME}:${TOKEN}" "$url"
}

# Function to list users with read access to the repository
function list_users_with_read_access {
    local endpoint="repos/${REPO_OWNER}/${REPO_NAME}/collaborators"

    # Fetch the list of collaborators on the repository
    collaborators="$(github_api_get "$endpoint" | jq -r '.[] | select(.permissions.admin == false) | .login')"

    # Display the list of collaborators with read access
    if [[ -z "$collaborators" ]]; then
        echo "No users with read access found for ${REPO_OWNER}/${REPO_NAME}."
    else
        echo "Users with read access to ${REPO_OWNER}/${REPO_NAME}:"
        echo "$collaborators"
    fi
}

# Main script

expected_cmd_args=2

 if [[ $# -eq ${expected_cmd_args} ]]
	  then
echo "listing all collaborators"
	list_users_with_read_access
else
	echo "please send the repo owner and repo name in cmd arguments "

 fi

	 

