# tangle-config 

> Configuration manager for tangle

## Usage

    --key, -k [String] - A configuration key to operate on. If --value is not
                         set, the current value will be written to STDOUT. Keys
                         are namespaced and delimited by ':'.

    --value, -v [String] - Save a new value to the specified key.

    --file, -f [Path] - Explicitely specify the configFile to operate on. If
                        not set, $HOME/.freshbooks will be used.

    --edit, -e - Manually edit configuration with $EDITOR

    --help, -h - Display this message


## Examples

    # Set your Github username
    $ freshbooks-config -k github:username -v 'yourname'

    # Print the current Github username to STDOUT
    $ freshbooks-config -k github:username

    # Edit configuration using a text editor
    $ freshbooks-config --edit

