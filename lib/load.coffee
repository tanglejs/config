path = require 'path'
join = path.join
dirname = path.dirname
fs = require 'fs-extra'
exists = fs.existsSync

pwuid = require 'pwuid'
nconf = require 'nconf'

defaultParentPath = (nconf) ->

  walkUp = (dir) ->
    configFile = join dir, 'tangle.json'
    if exists configFile then return dir else walkUp join(dir, '..')

  switch nconf.get 'type'
    when 'module'
      walkUp join(dirname(nconf.stores.context.file), '..')
    when 'app'
      walkUp join(dirname(nconf.stores.context.file), '..')
    else
      null

defaultBuildPath = (nconf) ->

  walkUp = (dir) ->
    configFile = join dir, 'tangle.json'
    if exists(configFile) && fs.readJSONSync(configFile).type == 'project'
      return join dir, 'build'
    walkUp join(dir, '..')

  switch type = nconf.get 'type'
    when 'project'
      join( path.dirname(nconf.stores.context.file), 'build')
    when 'app'
      join( walkUp( path.dirname(nconf.stores.context.file) ), 'app')
    when 'module'
      base = path.basename(path.dirname(nconf.stores.context.file))
      join( walkUp( path.dirname(nconf.stores.context.file) ), 'app', 'modules', base)
    else
      null

load = (dir) ->
  dir ||= process.cwd()

  nconf.add 'context',
    type: 'file'
    file: path.join dir, 'tangle.json'

  nconf.add 'global',
    type: 'file'
    file: path.join pwuid().dir, '.tangle'

  if parentPath = defaultParentPath nconf
    nconf.defaults
      parentPath: parentPath
      buildPath: defaultBuildPath nconf

  nconf

module.exports = load
