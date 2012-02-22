class MenuScreen extends Screen
    constructor: (app) ->
        super app
        @dom.bind '#menu-screen ul.menu', 'click', (e) =>
            if e.target.nodeName.toLowerCase() is 'button'
                action = e.target.getAttribute 'name'
                @app.showScreen action
