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

# Retrieving a value
nconf.get 'namespace:key'

```

The [nconf](https://github.com/flatiron/nconf) object returned using
`configFile()` has already loaded the config file, env overrides, and
the global defaults (in that order of precedence).

The default config file is `~/.tangle`, which can be
changed by setting the environment variable `tangle_config=PATH`

See [nconf](https://github.com/flatiron/nconf) for further documentation.
