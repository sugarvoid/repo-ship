--! main.lua


require("lib.sound")
require("lib.color")
require("src.player")



love.graphics.setDefaultFilter("nearest", "nearest")

local font
local sounds
local debug = ""
local gamestate -- 0 = menu, 1 = game, 2 = gameover
local screenWidth, screenHeight = love.graphics.getDimensions()


--create loadFont() function in lib

local player = Player:new()


function love.load()
    font = love.graphics.newFont("font/mago2.ttf", 16)
    gamestate = 1
    score = 0
    font:setFilter("nearest")
    love.graphics.setFont(font)
    sounds = load_sounds()
end


function love.keypressed(key)
    if key == "escape" then
            love.event.quit()
        end

    if gamestate == 0 then
        if key == "space" then
            gamestate = 1
        end
    end

    if gamestate == 2 then
        if key == "r" then
            love.load()
        end
    end

    if gamestate == 1 then
        return
    end
end


function love.update(dt)
    if gamestate == 0 then
        update_menu()
    elseif gamestate == 1 then
        update_game(dt)
    else
        update_gameover(dt)
    end
end

function update_menu()
    return
end


function update_game(dt)
    player:update(dt)
end


function update_gameover(dt)
    return
end


function love.draw()
    love.graphics.scale(4)
    if gamestate == 0 then
        draw_menu()
    end
    if gamestate == 1 then
        love.graphics.print("[space]", 70, 80, 0, 1, 1)
        draw_game()
    end
    if gamestate == 2 then
        draw_gameover()
    end
end


--#region Draw Functions
function draw_menu()
    changeFontColor("#ffbf40")
end


function draw_game()
    player:draw()
end


function draw_gameover()
    return
end






--#endregion Draw Functions




function playSound(sound)
    love.audio.stop(sound)
    love.audio.play(sound)
end




---
-- Clamps a value to a certain range.
-- @param min - The minimum value.
-- @param val - The value to clamp.
-- @param max - The maximum value.
--
function clamp(min, val, max)
    return math.max(min, math.min(val, max));
end




function getAngle(x1, y1, x2, y2)
    return math.atan2(x2-x1, y2-y1)
  end