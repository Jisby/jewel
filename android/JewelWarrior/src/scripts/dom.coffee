class Dom
    $: Sizzle

    hasClass: (el, clsName) ->
        regex = new RegExp "(^|\\s)" + clsName + "(\\s|$)"
        return regex.test el.className

    addClass: (el, clsName) ->
        if not @hasClass el, clsName
            el.className += ' ' + clsName

    removeClass: (el, clsName) ->
        regex = new RegExp "(^|\\s)" + clsName + "(\\s|$)"
        el.className = el.className.replace regex, ' '

    bind: (element, event, handler) ->
        if typeof element is 'string'
            element = @$(element)[0]
        element.addEventListener event, handler, false
