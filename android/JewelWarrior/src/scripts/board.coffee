class Board
    constructor: (config, callback) ->
        @rows          = config.rows
        @cols          = config.cols
        @baseScore     = config.baseScore
        @numJewelTypes = config.numJewelTypes
        @fillBoard()
        callback() if callback

    fillBoardNaive: ->
        @jewels = []
        for x in [0...@cols]
            @jewels[x] = []
            for y in [0...@rows]
                @jewels[x][y] = @randomJewel()

    fillBoard: ->
        @jewels = []
        for x in [0...@cols]
            @jewels[x] = []
            for y in [0...@rows]
                type = @randomJewel()
                while (type is @getJewel x-1, y and type is @getJewel x-2, y) or
                      (type is @getJewel x, y-1 and type is @getJewel x, y-2)
                    type = @randomJewel()
                @jewels[x][y] = type        

    randomJewel: ->
        return Math.floor Math.random() * @numJewelTypes

    getJewel: (x, y) ->
        if x < 0 or x >= @cols or y < 0 or y >= @rows
            return -1
        else
            return @jewels[x][y]
            
    setJewel: (x, y, type) ->
        if x >= 0 and x < @cols and y >= 0 and y < @rows and type >= 0 and type < @numJewelTypes
            @jewels[x][y] = type

    # returns the number jewels in the longest chain that includes (x,y)
    checkChain: (x, y) ->
        type = @getJewel x, y
        left = right = down = up = 0
        # look right
        while type is @getJewel x + right + 1, y
            right++
        # look left
        while type is @getJewel x - left - 1, y
            left++
        # look up
        while type is @getJewel x, y + up + 1
            up++
        # look down
        while type is @getJewel x, y - down - 1
            down++
        # return max chain length
        return Math.max left + 1 + right, up + 1 + down

    # returns true if (x1,y1) is adjacent to (x2,y2)
    isAdjacent: (x1, y1, x2, y2) ->
        dx = Math.abs x1 - x2
        dy = Math.abs y1 - y2
        return (dx + dy) is 1

    # returns true if (x1,y1) can be swapped with (x2,y2) to form a new match
    canSwap: (x1, y1, x2, y2) ->
        type1 = @getJewel x1, y1
        type2 = @getJewel x2, y2

        # check if jewels are adjacent
        if not @isAdjacent x1, y1, x2, y2
            return false

        # temporarily swap jewels
        @jewels[x1][y1] = type2
        @jewels[x2][y2] = type1

        # check if there is a chain
        chain = (@checkChain x2, y2) > 2 or (@checkChain x1, y1) > 2

        # swap back
        @jewels[x1][y1] = type1
        @jewels[x2][y2] = type2

        return chain

    # returns a two-dimensional map of chain-lengths
    getChains: ->
        chains = []
        for x in [0...@cols]
            chains[x] = []
            for y in [0...@rows]
                chains[x][y] = @checkChain x, y
        return chains

    check: ->
        chains = @getChains()
        hadChains = false
        score = 0
        removed = moved = gaps = []
        for x in [0...@cols]
            gaps[x] = 0
            for y in [rows-1..0]
                if chains[x][y] > 2
                    hadChains = true
                    gaps[x]++
                    removed.push(
                        x: x, y: y
                        type: @getJewel x, y
                    )
                else if gaps[x] > 0
                    moved.push(
                        toX: x, toY: y + gaps[x]
                        fromX: x, fromY: y
                        type: @getJewel x, y
                    )
                    @jewels[x][y + gaps[x]] = @getJewel x, y

    print: ->
        str = ''
        for y in [0...@rows]
            for x in [0...@cols]
                str += @getJewel x, y
                str += ' '
            str += '\r\n'
        console.log str
