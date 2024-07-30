# proton-bash

## RANDOM_CONFIG_FILE=${CONFIG_FILES[$RANDOM % ${#CONFIG_FILES[@]}]}

### Key Points
1. **Removed Argument for Auth File**: The script now only takes one argument, the `config-prefix`.
2. **Hardcoded Auth File Location**: The path to the auth file is hardcoded in the `AUTH_FILE` variable. Update this path to point to your actual auth file.
3. **Correct Path**: The `CONFIG_DIR` is set to `/path/of/configs`.

### Running the Script
1. Ensure the script is saved, e.g., `pvpn.sh`.
2. Make the script executable:
    ```sh
    chmod +x pvpn.sh
    ```
3. Run the script with the appropriate argument:
    ```sh
    ./pvpn.sh us
    ```
4. For Linux

Set the file permissions so that only your user can read the file:
```
sh
chmod 600 /path/to/auth.txt
```

Make sure your configuration files are correctly placed in `/path/of/configs` and named accordingly (e.g., `us-free-xxx.protonvpn.udp.ovpn`).
