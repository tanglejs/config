Q = require 'q'

module.exports = (params, shell) ->
  (config) ->
    logger = shell.settings.logger
    deferred = Q.defer()

    logger.info params
    config.set params.key, params.value
    
    config.save (error) ->
      throw new Error error if error
      deferred.resolve(config)

    deferred.promise
