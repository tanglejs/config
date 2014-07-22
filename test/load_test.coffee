path = require 'path'

load = require(path.join __dirname, '..', 'lib', 'load')

describe 'config', ->

  describe 'core module', ->
    beforeEach ->
      @config = load path.join('test', 'project', 'app', 'modules', 'core')

    it 'should return the correct context name', ->
      @config.get('name').should.equal 'core'

    it 'should return the correct context type', ->
      @config.get('type').should.equal 'module'

    it 'should default the correct parent', ->
      @config.get('parentPath').should.equal 'test/project/app'

  describe 'example app', ->
    beforeEach ->
      @config = load path.join('test', 'project', 'app')

    it 'should return the correct context name', ->
      @config.get('name').should.equal 'example-app'

    it 'should return the correct context type', ->
      @config.get('type').should.equal 'app'

    it 'should default the correct parent', ->
      @config.get('parentPath').should.equal 'test/project'

  describe 'example project', ->
    beforeEach ->
      @config = load path.join('test', 'project')

    it 'should return the correct context name', ->
      @config.get('name').should.equal 'example-project'

    it 'should return the correct context type', ->
      @config.get('type').should.equal 'project'
