#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <config-prefix>"
    exit 1
fi

# Argument
CONFIG_PREFIX=$1

# Configuration directory
CONFIG_DIR="/path/of/config/files"  # Update this with your actual config directory

# Auth file location
AUTH_FILE="/path/of/file/auth"  # Update this with the actual path to your auth file

# Map of valid prefixes to their file prefixes
declare -A PREFIX_MAP
PREFIX_MAP=(
    ["nl"]="nl"
    ["us"]="us"
    ["jp"]="jp"
    ["pl"]="pl"
    ["pk"]="pk"
)

# Check if the provided prefix is valid
if [[ ! ${PREFIX_MAP[$CONFIG_PREFIX]+_} ]]; then
    echo "Invalid config prefix. Valid prefixes are: ${!PREFIX_MAP[@]}"
    exit 1
fi

# Check if the configuration directory exists
if [ ! -d "$CONFIG_DIR" ]; then
    echo "Configuration directory '$CONFIG_DIR' does not exist."
    exit 1
fi

# Select a random config file with the given prefix
CONFIG_FILES=($(ls ${CONFIG_DIR}/${PREFIX_MAP[$CONFIG_PREFIX]}*.ovpn 2>/dev/null))
if [ ${#CONFIG_FILES[@]} -eq 0 ]; then
    echo "No configuration files found with prefix '${PREFIX_MAP[$CONFIG_PREFIX]}'"
    exit 1
fi

RANDOM_CONFIG_FILE=${CONFIG_FILES[$RANDOM % ${#CONFIG_FILES[@]}]}

# Start OpenVPN with the selected config file and auth file
openvpn --config "$RANDOM_CONFIG_FILE" --auth-user-pass "$AUTH_FILE"
