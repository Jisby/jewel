class GameScreen extends Screen
    constructor: (app) ->
        super app
        @dom.bind '#game-screen', 'click', =>
            @app.showScreen 'menu-screen'
