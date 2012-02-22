onLoad = ->
    # add standalone mode test
    Modernizr.addTest 'standalone', ->
        return navigator.standalone != false

    # start dynamic loading
    Modernizr.load [
        # these files are always loaded
        load: [
            'scripts/sizzle.js',
            'scripts/app.js',
            'scripts/dom.js',
            'scripts/game.js',
            'scripts/config.js',
            'scripts/board.js',
            'scripts/screen.js',
            'scripts/screen.menu.js',
            'scripts/screen.game.js',
            'scripts/screen.scores.js',
            'scripts/screen.about.js',
            'scripts/screen.exit.js'
        ]
        {   # test for standalone mode
            test: Modernizr.standalone
            yep:  'scripts/screen.splash.js'
            nope: 'scripts/screen.install.js'
        }
        # called when all files have finished loading and executing
        complete: ->
            console.log 'All modules loaded'
            # attach application as window property
            window.app = new App Modernizr.standalone
    ]

# wait until main document is loaded
window.addEventListener 'load', onLoad, false
