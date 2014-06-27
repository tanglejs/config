path = require 'path'

load = require path.join(__dirname, 'lib', 'load')
get = require path.join(__dirname, 'lib', 'get')
set = require path.join(__dirname, 'lib', 'set')
edit = require path.join(__dirname, 'lib', 'edit')

module.exports =
  load: load
  get: get
  set: set
  edit: edit

  commands:
    'config get :key':
      description: 'Display a config key'
      action: get
    'config set :key :value':
      description: 'Set a config key'
      action: set
    'config edit':
      description: 'Modify the config using $EDITOR'
      action: edit
