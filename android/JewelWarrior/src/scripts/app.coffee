class App
    screens: []

    constructor: (standalone) ->
        @dom  = new Dom
        @game = new Game this
        @addScreens standalone
        @disableOverScroll()
        @hideAndroidAddressBar()

    # add application screen
    addScreen: (screenId, screen) ->
        @screens[screenId] = screen
 
    # hide active screen and show specified screen
    showScreen: (screenId) ->
        # hide current screen
        activeScreen = @dom.$('#game .screen.active')[0]
        if activeScreen
            @dom.removeClass activeScreen, 'active'
        # show specified screen
        screen = @dom.$('#' + screenId)[0]
        @dom.addClass screen, 'active'

    addScreens: (standalone) ->
        if standalone
            # add all application screens in standalone mode
            @addScreen 'splash-screen', new SplashScreen this
            @addScreen 'menu-screen',   new MenuScreen   this
            @addScreen 'game-screen',   new GameScreen   this
            @addScreen 'scores-screen', new ScoresScreen this
            @addScreen 'about-screen',  new AboutScreen  this
            @addScreen 'exit-screen',   new ExitScreen   this
            @showScreen 'splash-screen'
        else
            # add install screen only in browser mode
            @addScreen  'install-screen', new InstallScreen this
            @showScreen 'install-screen'

    disableOverScroll: ->
        # disable native touchmove behavior to prevent overscroll
        @dom.bind document, 'touchmove', (e) ->
            e.preventDefault()

    hideAndroidAddressBar: ->
        # hide android browser address bar by scrolling to the top of the page
        if /Android/.test navigator.userAgent
            @dom.$('html')[0].style.height = '200%'
            setTimeout (-> window.scrollTo 0, 1), 0
