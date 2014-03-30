(function() {
  var editor, exec, fs, manPath, nconf, nopt, path, tangleUtil;

  fs = require('fs');

  path = require('path');

  nopt = require('nopt');

  nconf = require('nconf');

  exec = require('child_process').exec;

  editor = require('editor');

  exports.defaults = {};

  tangleUtil = require('tangle-util');

  manPath = path.join(__dirname, 'man', 'tangle-config.1');

  exports.configFile = function() {
    return process.env['tangle_config'] || path.join(process.env['HOME'], '.tangle');
  };

  exports.projectFile = function() {
    var local;
    return local = path.join(process.cwd(), 'tangle.json');
  };

  exports.getProject = function() {
    return nconf.argv().env().file(exports.projectFile());
  };

  exports.getConf = function() {
    return nconf.file(exports.configFile()).env().defaults(exports.DEFAULTS);
  };

  exports.command = function() {
    var configFile, parsedOptions, value;
    parsedOptions = nopt({
      key: String,
      value: String,
      file: path,
      edit: Boolean,
      help: Boolean
    }, {
      k: ['--key'],
      v: ['--value'],
      f: ['--file'],
      e: ['--edit'],
      h: ['--help']
    }, process.argv, 2);
    configFile = parsedOptions.file || path.join(process.env['HOME'], '.tangle');
    nconf.file({
      file: configFile
    });
    if (parsedOptions.help) {
      return tangleUtil.help.showLocalMan(manPath);
    } else if (parsedOptions.value) {
      nconf.set(parsedOptions.key, parsedOptions.value);
      return nconf.save(function(err) {
        return fs.readFile(configFile, function(err, data) {
          if (err) {
            return console.error(err);
          }
        });
      });
    } else if (parsedOptions.key) {
      value = nconf.get(parsedOptions.key);
      return process.stdout.write("" + value + "\n");
    } else if (parsedOptions.edit) {
      return editor(configFile);
    } else {
      return tangleUtil.help.showLocalMan(manPath);
    }
  };

}).call(this);
