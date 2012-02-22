class ExitScreen extends Screen
    constructor: (app) ->
        super app
        @dom.bind '#exit-yes', 'click', =>
            try
                navigator.app.exitApp()
            catch error
                @app.showScreen 'splash-screen'
        @dom.bind '#exit-no', 'click', =>
            @app.showScreen 'menu-screen'
