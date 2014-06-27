Q = require 'q'
editor = require 'editor'

module.exports = (params, shell) ->
  (config) ->
    logger = shell.settings.logger
    deferred = Q.defer()

    contextFile = config.stores.context.file
    if shell.isShell then shell.interface().pause()
    editor contextFile, (code, sig) ->
      if shell.isShell
        shell.interface().resume()
        config.load ->
          console.log 'loaded'
          deferred.resolve()
      else
        deferred.resolve()
    deferred.promise
