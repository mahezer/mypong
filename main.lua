p1score = 0
p2score = 0
function love.load()
  playerY = love.graphics.getHeight()/2  
  player2Y = love.graphics.getHeight()/2
  ballX = love.graphics.getWidth()/2
  ballY = love.graphics.getHeight()/2
  lastTouchedX = 0
  lastTouchedY = 0
  incrementer = 0
  playerIncrementer = 0
end

function love.draw()
  love.graphics.setColor(255,0,0,255)
  love.graphics.print(p1score, 100, 10)
  love.graphics.rectangle("fill", 20, playerY, 30, 80)
  love.graphics.setColor(0,255,0,255)
  love.graphics.print(p2score, love.graphics.getWidth() - 100, 10)
  love.graphics.rectangle("fill", love.graphics.getWidth() - 40, player2Y, 30, 80)
  love.graphics.setColor(0,0,255, 255)
  love.graphics.circle("fill", ballX, ballY, 30, 52)
end

function love.update(dt)

  if lastTouchedX ~= 3 then
    --Deciding where the ball should go
    if lastTouchedX == 0 then
      ballX = ballX - incrementer - 100 * dt
    end
    if lastTouchedX == 1 then
      ballX = ballX + incrementer + 100 * dt
    end
    if lastTouchedY == 0 then
      ballY = ballY - incrementer - 100 * dt
    end
    if lastTouchedY == 1 then
      ballY = ballY + incrementer + 100 * dt
    end
    if ballY >= love.graphics.getHeight() - 30 then
      lastTouchedY = 0
    end
    if ballY <= 30 then
      lastTouchedY = 1
    end
    if ballX >= love.graphics.getWidth() - 30 then
      lastTouchedX = 3
      lastTouchedY = 3
      p1score = p1score + 1
    end
    if ballX <= 30 then
      lastTouchedX = 3
      lastTouchedY = 3
      p2score = p2score + 1
    end

    --Controls
    if love.keyboard.isDown('up') then
      if player2Y > 0 then
        player2Y = player2Y - playerIncrementer - 100 * dt
      end
    end

    if love.keyboard.isDown('down') then
      if player2Y < love.graphics.getHeight() - 80 then
        player2Y = player2Y + playerIncrementer + 100 * dt
      end
    end

    if love.keyboard.isDown('w') then
      if playerY > 0 then
        playerY = playerY - playerIncrementer - 100 * dt
      end
    end

    if love.keyboard.isDown('s') then
      if playerY < love.graphics.getHeight() - 80 then
        playerY = playerY + playerIncrementer + 100 * dt
      end
    end

    --Verifying contact

    if ballX >= love.graphics.getWidth()- 70 then
      if ballY >= player2Y and ballY <= player2Y + 80 then
        print('PIZZA Voltando')
        lastTouchedX = 0
        incrementer = incrementer + 0.5
        playerIncrementer = playerIncrementer + 0.3
      end
    end

    if ballX <= 80 then
      if ballY >= playerY and ballY <= playerY + 80 then
        print('PIZZA Indo')
        lastTouchedX = 1
        incrementer = incrementer + 0.5
        playerIncrementer = playerIncrementer + 0.3
      end
    end
  end
end

function love.keypressed(key)
  if key == "space" then
    love.load()
  end
end
