#
# * tangle-config
# * https://github.com/tanglejs/config
# *
# * Copyright (c) 2014 Logan Koester
# * Licensed under the MIT license.
#

path = require 'path'

module.exports = (grunt) ->
  #
  # Project configuration.
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'

    watch:
      all:
        files: [
          'Gruntfile.coffee'
          'readme/**/*.md'
          'tests/**/*.coffee'
        ]
        tasks: ['default']

    readme_generator:
      help:
        options:
          output: 'tangle-config.md'
          table_of_contents: false
          generate_footer: false
          has_travis: false
          package_title: 'tangle-config'
          package_name: 'tangle-config'
        order:
          'usage.md': 'Usage'
          'examples.md': 'Examples'
      readme:
        options:
          banner: 'banner.md'
          generate_title: false
          has_travis: false
          github_username: 'tanglejs'
          generate_footer: false
          table_of_contents: false
        order:
          'overview.md': 'Overview'
          'usage.md': 'Usage'
          'examples.md': 'Examples'
          'api.md': 'API'
          'contributing.md': 'Contributing'
          'license.md': 'License'

    bump:
      options:
        commit: true
        commitMessage: 'Release v%VERSION%'
        commitFiles: ['package.json']
        createTag: true
        tagName: 'v%VERSION%'
        tagMessage: 'Version %VERSION%'
        push: false

  # These plugins provide necessary tasks.
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-readme-generator'
  grunt.loadNpmTasks 'grunt-bump'

  grunt.registerTask 'build', ['readme_generator']
  grunt.registerTask 'default', ['build']
