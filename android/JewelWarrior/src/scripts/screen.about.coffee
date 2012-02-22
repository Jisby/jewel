class AboutScreen extends Screen
    constructor: (app) ->
        super app
        @dom.bind '#about-screen', 'click', =>
            @app.showScreen 'menu-screen'
