Q = require 'q'

module.exports = (params, shell) ->
  (config) ->
    logger = shell.settings.logger
    deferred = Q.defer()

    value = config.get params.key

    deferred.resolve(value)
    deferred.promise
