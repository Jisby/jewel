class SplashScreen extends Screen
    constructor: (app) ->
        super app
        @dom.bind '#splash-screen', 'click', =>
            @app.showScreen 'menu-screen'
