#!/bin/bash

# Function to clean string from quotes and special characters
clean_string() {
    echo "$1" | sed 's/^[[:space:]"]*//;s/[[:space:]"]*$//' | sed "s/'/\\\'/g"
}

# Function to display error messages in red
error() {
    echo -e "\e[31mERROR: $1\e[0m"
}

# Function to display success messages in green
success() {
    echo -e "\e[32m$1\e[0m"
}

# Function to display text in blue
info() {
    echo -e "\e[34m$1\e[0m"
}

# Check if inside a git repository
if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    error "This command must be executed inside a git repository"
    exit 1
fi

# Get the diff
diff_content=$(git diff)

# Check if there are changes to commit
if [ -z "$diff_content" ]; then
    error "There are no changes to commit"
    exit 1
fi

# Get suggestions from Cody
info "Getting commit message suggestions..."
cody_response=$(echo "$diff_content" | cody chat --stdin -m 'Generate 5 different commit messages for this diff following Conventional Commits format. Present them in a numbered list from 1 to 5. Make them concise but descriptive.')

# Display suggestions
echo -e "\nCommit message suggestions:"
echo "$cody_response"

# Request user choice
echo -e "\nChoose the number of the desired message (1-5) or 'q' to quit:"
read choice

# Check if user wants to quit
if [ "$choice" = "q" ]; then
    info "Operation cancelled by user"
    exit 0
fi

# Verify if choice is valid
if ! [[ "$choice" =~ ^[1-5]$ ]]; then
    error "Invalid choice. Please select a number between 1 and 5"
    exit 1
fi

# Extract the chosen message using grep and sed
selected_message=$(echo "$cody_response" | grep "^$choice\." | sed "s/^$choice\. //")

# Clean the message
cleaned_message=$(clean_string "$selected_message")

if [ -z "$cleaned_message" ]; then
    error "Could not extract the selected message"
    exit 1
fi

# Execute the commit
info "Executing git add ."
git add .

info "Creating commit with selected message..."
if git commit -m "$cleaned_message"; then
    success "Commit successfully created!"
    info "Message: $cleaned_message"
else
    error "Failed to create commit"
    exit 1
fi
