class Game
    constructor: (@app) ->
        @config = new Config
        @board  = new Board @config
