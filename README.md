# tangle-config

> Configuration management for tangle

[![Strider Build Status](https://ci.ldk.io/tanglejs/config/badge)](https://ci.ldk.io/tanglejs/config/)
[![Travis Build Status](https://secure.travis-ci.org/tanglejs/config.png?branch=master)](http://travis-ci.org/tanglejs/config)
[![Dependency Status](https://david-dm.org/tanglejs/config.png)](https://david-dm.org/tanglejs/config)
[![devDependency Status](https://david-dm.org/tanglejs/config/dev-status.png)](https://david-dm.org/tanglejs/config#info=devDependencies)
[![Gittip](http://img.shields.io/gittip/logankoester.png)](https://www.gittip.com/logankoester/)

[![NPM](https://nodei.co/npm/tangle-config.png?downloads=true)](https://nodei.co/npm/tangle-config/)


## Overview

[tangle](https://github.com/tanglejs/tangle) is a set of tools
for building web applications.

`tangle-config` implements the `config` subcommand for
[tangle](https://github.com/tanglejs/tangle).


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


## API

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


## Contributing

The test suite is implemented with
[nodeunit](https://github.com/caolan/nodeunit) and
[nixt](https://github.com/vesln/nixt).

To rebuild & run the tests

    $ mkdir tanglejs
    $ cd tanglejs
    $ git clone https://github.com/tanglejs/config.git
    $ cd config
    $ npm install
    $ grunt test

You can use `grunt watch` to automatically rebuild and run the test suite when
files are changed.

Use `npm link` from the project directory to tell `tangle-config` to use
your modified `tangle-config` during development.

To contribute back, fork the repo and open a pull request with your changes.


## License

Copyright (c) 2014 Logan Koester
Licensed under the MIT license.


