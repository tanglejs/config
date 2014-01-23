fs = require 'fs'
path = require 'path'
nopt = require 'nopt'
nconf = require 'nconf'
exec = require('child_process').exec
editor = require 'editor'

# Default configuration settings
exports.defaults = {}

exports.configFile = ->
  process.env['tangle_config'] || path.join(
    process.env['HOME'], '.tangle'
  )

exports.getConf = ->
  nconf
    .file(exports.configFile())
    .env()
    .defaults(exports.DEFAULTS)

exports.command = ->
  displayHelp = ->
    manpage = path.join(__dirname, 'man', 'tangle-config.1')
    cmd = "man --local-file #{manpage}"
    exec cmd, (err, stdout, stderr) ->
      process.stdout.write "#{stdout}"
      process.stderr.write "#{stderr}"
      console.error err if err

  parsedOptions = nopt
    key: String
    value: String
    file: path
    edit: Boolean
    help: Boolean
  ,
    k: ['--key']
    v: ['--value']
    f: ['--file']
    e: ['--edit']
    h: ['--help']
  , process.argv, 2

  configFile = parsedOptions.file || path.join(
    process.env['HOME'], '.tangle'
  )

  nconf.file file: configFile

  if parsedOptions.help
    displayHelp()

  else if parsedOptions.value
    nconf.set parsedOptions.key, parsedOptions.value
    nconf.save (err) ->
      fs.readFile configFile, (err, data) -> console.error err if err

  else if parsedOptions.key
    value = nconf.get(parsedOptions.key)
    process.stdout.write "#{value}\n"

  else if parsedOptions.edit
    editor configFile

  else
    displayHelp()
