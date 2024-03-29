--Fox Screen Saver
--by alex fox
--alex.d.fox@icloud.com

function love.load()
	quit = false
	width, height = love.window.getDesktopDimensions()
	love.window.setFullscreen(true)
	love.mouse.setVisible(false)
	local body = love.image.newImageData("fox/fox.png")
	local tail1 = love.image.newImageData("fox/tail1.png")
	local tail2 = love.image.newImageData("fox/tail2.png")
	local tail3 = love.image.newImageData("fox/tail3.png")
	local tail4 = love.image.newImageData("fox/tail4.png")
	local tail5 = love.image.newImageData("fox/tail5.png")
	local foxData = {body,tail1,tail2,tail3,tail4,tail5}
	local i = 1
	local name = {}
	foxes = {}
	for k,v in pairs(foxData) do
		love.graphics.print("v, k")
		name[i] = string.format( "%s%d", k, i)
		name[i] = love.graphics.newImage(v)
		i=i+1
	end
	for f=1,10 do
		foxes[f] = {body=name[1],tail={name[2],name[3],name[4],name[5],name[6]},coordinates={x=randomX(),y=randomY()}}
	end
	orgmousex, orgmousey = love.mouse.getPosition()
end

function love.draw()
	for f,fox in pairs(foxes) do
		drawFox(foxes[f].coordinates.x,foxes[f].coordinates.y,f)
	end
end

function love.update(dt)
		mousex, mousey = love.mouse.getPosition()
		if dt < 1/2.5 then
			love.timer.sleep(1/2.5 - dt)
			if dt < 1/60 then
				for f,fox in pairs(foxes) do
					foxes[f].coordinates.x = randomX()
					foxes[f].coordinates.y = randomY()
				end
				love.timer.sleep(1/60 - dt)
			end
		end
		if (mousex ~= orgmousex) then	quit = true end
		if (mousey ~= orgmousey) then	quit = true end
		if (quit == true) then love.event.quit(0) end
end

function drawFox(x,y,num)
	love.graphics.draw(foxes[num].body,x,y)
	love.graphics.draw(foxes[num].tail[tail()],x+55,y+110)
end

function tail()
	return love.math.random(1,5)
end

function randomX()
	return love.math.random(100, width-100)
end

function randomY()
	return love.math.random(200, height-200)
end
