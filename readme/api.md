You can (and should!) use this interface to manage user configuration within
your own **tangle** plugins.

```coffee

config = require 'tangle-config'

# Reading the global defaults
config.defaults

# Getting the current config file path
config.configFile()

# Retrieving the nconf object
nconf = config.getConf()

# Getting a value
nconf.get 'namespace:key'

```

The [nconf](https://github.com/flatiron/nconf) object returned using
`configFile()` has already loaded the config file, env overrides, and
the global defaults (in that order of precedence).

The default config file is `~/.tangle`, which can be
changed by setting the environment variable `tangle_config=PATH`

See [nconf](https://github.com/flatiron/nconf) for further documentation.

### Project Files

You can use project files to store non-global configuration in a file called
`tangle.json` at the current directory.

```coffee
config = require 'tangle-config'

# Get a `tangle.json` file in the current working directory (or false if
# the file does not exist)
config.projectFile()

# Retrieving the nconf object
project = config.getProject()

# Getting a value
project.get 'namespace:key'

# Setting a value
project.set 'namespace:key', value

# Saving the file
project.save (err) ->
  fs.readFile configFile, (err, data) -> console.error err if err

```
