--player.lua

Player = {}
Player.__index = Player



local player_mass = 0.22


function Player:new()
    local _player = setmetatable({}, Player)
    _player.image = love.graphics.newImage("asset/image/player_debug.png")
    _player.starting_pos = { x = 60, y = 111 }

    _player.rotation = 0
    _player.is_alive = true
    _player.x = _player.starting_pos.x
    _player.y = _player.starting_pos.y
    _player.has_won = false
    _player.speed = 100
    _player.vel_y = 50
    _player.vel_x = 0
    _player.max_speed = 100
    _player.acceleration = 20
    _player.friction = 3500
    _player.is_moving = false
    _player.width, _player.height = _player.image:getDimensions()

    _player.hitbox = { x = _player.x, y = _player.y, w = _player.width - 10, h = _player.height - 4 }
    --_player.body = world:newRectangleCollider(_player.x, _player.y, _player.hitbox.w, _player.hitbox.h)
    --_player.body:setType("dynamic")
   -- _player.body:setCollisionClass("Player")
   -- _player.body:setObject(_player)

   -- _player.body:setFixedRotation(true)
    --_player.body:setMass(player_mass)
    return _player
end

function Player:update(dt)

    local mx, my = love.mouse.getPosition()
    mx = mx/4
    my = my/4
    if love.keyboard.isDown("w") then
      self.x = self.x + self.speed * math.sin(getAngle(self.x+self.width/2, self.y+self.height/2, mx, my)) * dt
      self.y = self.y + self.speed * math.cos(getAngle(self.x+self.width/2, self.y+self.height/2, mx, my)) * dt
    end

    --local vel_x, vel_y = self.body:getLinearVelocity()

    if love.keyboard.isDown('d') then

        --vel_x = clamp(self.max_speed, vel_x + self.acceleration, 0)
    end
    if love.keyboard.isDown('a') then

       -- vel_x = clamp(-self.max_speed, vel_x + -self.acceleration, 0)
    end

    --self.body:setLinearVelocity(vel_x, vel_y)


end

function Player:jump()

end



function Player:die(pos, condition)

end

function Player:draw()
    love.graphics.draw(self.image, self.x, self.y, 0, 1, 1)
end



function Player:reset()

end