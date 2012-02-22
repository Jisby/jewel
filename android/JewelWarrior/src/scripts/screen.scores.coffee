class ScoresScreen extends Screen
    constructor: (app) ->
        super app
        @dom.bind '#scores-screen', 'click', =>
            @app.showScreen 'menu-screen'
