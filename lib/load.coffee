path = require 'path'
pwuid = require 'pwuid'

module.exports = ->

  nconf = require 'nconf'

  nconf.add 'context',
    type: 'file'
    file: 'tangle.json'
    dir: process.cwd()
    search: true

  nconf.add 'global',
    type: 'file'
    file: path.join pwuid().dir, '.tangle'

  nconf
