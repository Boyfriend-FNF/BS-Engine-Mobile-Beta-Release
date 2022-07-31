function onCreate()
	-- background shit
	makeAnimatedLuaSprite('BendyBGRun', 'bendy/images/run/hallway', -13050, 400);
	addAnimationByPrefix('BendyBGRun','Loop0', 'Loop01 instance 1', 70, false);
	addAnimationByPrefix('BendyBGRun','Loop1', 'Loop02 instance 1', 70, false);
	addAnimationByPrefix('BendyBGRun','Loop2', 'Loop03 instance 1', 70, false);
	addAnimationByPrefix('BendyBGRun','Loop3', 'Loop04 instance 1', 70, false);
	addAnimationByPrefix('BendyBGRun','Loop4', 'Loop05 instance 1', 70, false);
	addAnimationByPrefix('BendyBGRun','Tunnel', 'Tunnel instance 1', 70, true);

	objectPlayAnimation('BendyBGRun', 'Loop0');
	scaleObject('BendyBGRun', 2.3, 2.3);

	setLuaSpriteScrollFactor('BendyBGRun', 0, 1)
	addLuaSprite('BendyBGRun', false);

	makeAnimatedLuaSprite('BendyBGRunDark', 'bendy/images/dark/hallway_but_Dark', -300, 650);
	addAnimationByPrefix('BendyBGRunDark','Loop1','RunLol Hallway instance 1', 50, true);
	objectPlayAnimation('BendyBGRunDark','Loop1', true);
	scaleObject('BendyBGRunDark', 1.6, 1.6);
	setLuaSpriteScrollFactor('BendyBGRunDark', 0, 1)

	makeAnimatedLuaSprite('Transition', 'bendy/images/dark/Trans', -250, -150);
	addAnimationByPrefix('Transition','Trans','beb instance 1', 30, false);
	objectPlayAnimation('Transition','Trans', false);
	setLuaSpriteScrollFactor('Transition', 0, 0)
	scaleObject('Transition', 1.75, 1.75);
	setObjectCamera('Transition', 'hud');
	--Prechace Transition
    addLuaSprite('Transition',true)
	removeLuaSprite('Transition',false)

	
	makeLuaSprite('StairsBG', 'bendy/images/stairs/scrollingBG', -700, -500);
	setLuaSpriteScrollFactor('StairsBG',0,0)
	scaleObject('StairsBG',1.4,1.4);

	makeLuaSprite('StairsBG2', 'bendy/images/stairs/scrollingBG', -700, -3283);
	setLuaSpriteScrollFactor('StairsBG2',0,0)
	scaleObject('StairsBG2',1.4,1.4);

	if (not lowQuality) then	
		makeLuaSprite('gradient', 'bendy/images/stairs/gradient', -800, -500);
		setLuaSpriteScrollFactor('gradient',0,0)
		scaleObject('gradient',1.6,1.6);

		makeLuaSprite('GayBG3', 'bendy/images/gay/C_03', 995, 125);
		setLuaSpriteScrollFactor('GayBG3', 1.6, 1.6)
		scaleObject('GayBG3', 1.65 , 1.65 );

		makeLuaSprite('GayBG4', 'bendy/images/gay/C_04', 995, -200);
		scaleObject('GayBG4', 1.5, 1.5);

		makeLuaSprite('GayBG5', 'bendy/images/gay/C_05', -195, 105);
		scaleObject('GayBG5', 1.7, 1.7)
	end

	makeLuaSprite('stairs', 'bendy/images/stairs/stairs',-700, -150);
	setLuaSpriteScrollFactor('stairs',0,0)
	scaleObject('stairs',1.8,1.8);

	makeLuaSprite('GayBG', 'bendy/images/gay/C_00', -125, -600);
	setLuaSpriteScrollFactor('GayBG',0,0)
	scaleObject('GayBG', 1.85, 1.85);

	makeLuaSprite('GayBGGround', 'bendy/images/gay/C_01', -1500,0);
	setLuaSpriteScrollFactor('GayBGGround',0,1)
	scaleObject('GayBGGround',1.8,1.8);

	makeLuaSprite('GayBGGround2', 'bendy/images/gay/C_01', 1950,0);
	setLuaSpriteScrollFactor('GayBGGround2',0,1)
	scaleObject('GayBGGround2',1.8,1.8);

	makeLuaSprite('GayBG2', 'bendy/images/gay/C_02', 0, -560);
	setLuaSpriteScrollFactor('GayBG2',0,0)
	scaleObject('GayBG2', 1.65, 1.65);

	makeLuaSprite('GayBGGrad', 'bendy/images/gay/C_06_BLEND_MODE_ADD', -595, -600);
	setLuaSpriteScrollFactor('GayBGGrad', 0, 0)
	scaleObject('GayBGGrad', 1.85, 1.85);

	makeLuaSprite('GayBGShad', 'bendy/images/gay/C_07', -1015, -564);
	setLuaSpriteScrollFactor('GayBGShad', 0, 0)
	
	scaleObject('GayBGShad', 1.725, 1.725);

    BGY = -1000
	stairsY = -2200;
	playerX = -400;

	platformX = -500;

	allowZoom = true;
	animCounter = 0;
end

function onUpdate(elapsed)
	if songName == 'Nightmare-Run' then
		if (curStep == 415) then
			objectPlayAnimation('BendyBGRun', 'Tunnel', true);

		elseif (curStep == 543) then

			objectPlayAnimation('BendyBGRun', 'Loop' ..animCounter)
		
		elseif (curStep == 783) then
			allowZoom = false

			removeLuaSprite('BendyBGRun', false)	
			addLuaSprite('StairsBG', false);
			addLuaSprite('StairsBG2', false);
			addLuaSprite('stairs', true)
			setProperty('defaultCamZoom', 0.6)

			if (not lowQuality) then
				addLuaSprite('gradient',true)
			end

		elseif (curStep >= 783 and curStep <= 1055) then
			setProperty('StairsBG.y', BGY)
			setProperty('StairsBG2.y', BGY - 2093)
			setProperty('stairs.y',stairsY)

			setProperty('boyfriend.x',playerX)
			setProperty('boyfriend.y',stairsY + 2100 - (playerX/2.3 + 150))

			setProperty('dad.x', playerX - 1040)
			setProperty('dad.y', stairsY + 2100 - (playerX/2.3 + 50))

			triggerEvent('Camera Follow Pos', 1500, 1000)
	
			BGY = BGY + 4.5
			stairsY = stairsY + 28
			playerX = playerX + 30

		elseif (curStep == 1056) then
			removeLuaSprite('StairsBG', false)
			removeLuaSprite('StairsBG2', false)
			removeLuaSprite('gradient', false)
			removeLuaSprite('stairs', false)

			if (not lowQuality) then
				addLuaSprite('GayBG', false)
				addLuaSprite('GayBG4', false)
				addLuaSprite('GayBG2', false)
				addLuaSprite('GayBGGrad', true)
				setBlendMode('GayBGGrad', 'add')
				addLuaSprite('GayBG3', true)
				addLuaSprite('GayBG5', true)
			else
				addLuaSprite('GayBG', false)
				addLuaSprite('GayBGGrad', false)
				addLuaSprite('GayBG2', false)
			end

			addLuaSprite('GayBGGround', true)
			addLuaSprite('GayBGGround2', true)

			addLuaSprite('GayBGShad', true)
		
			setProperty('defaultCamZoom', 0.4)

		elseif (curStep >= 1056 and curStep <= 1310) then
			setProperty('boyfriend.x', 1800)
			setProperty('boyfriend.y', 1330)
			setProperty('boyfriend.angle', 0)

			setProperty('dad.x', 460)
			setProperty('dad.y', 1100)
			setProperty('dad.angle', 0)

			setProperty('GayBG.x', getProperty('GayBG.x') - 1)
			if (not lowQuality) then
				setProperty('GayBG4.x', getProperty('GayBG4.x') - 0.9)
				setProperty('GayBG3.x', getProperty('GayBG3.x') - 1.15)
			end
			setProperty('GayBG2.x', getProperty('GayBG2.x') - 1)
			setProperty('GayBGGrad.x', getProperty('GayBGGrad.x') - 1)
			setProperty('GayBGGround.x', platformX)
			setProperty('GayBGGround2.x', platformX + 2200)

			platformX = platformX - 25

		elseif (curStep == 1312) then
			removeLuaSprite('GayBGGround', true);
			removeLuaSprite('GayBGGround2', true);
			removeLuaSprite('GayBG', true);
			removeLuaSprite('GayBG2', true);
			if(not lowQuality) then
				removeLuaSprite('GayBG5', true);
				removeLuaSprite('GayBG3', true);
				removeLuaSprite('GayBG4', true);
			end

			setProperty('boyfriend.x', 1800)
			setProperty('boyfriend.y', 1330)
			setProperty('boyfriend.angle', 0)

			setProperty('dad.x', 460)
			setProperty('dad.y', 1100)
			setProperty('dad.angle', 0)

			addLuaSprite('BendyBGRun', false)
			objectPlayAnimation('BendyBGRun', 'Loop' ..animCounter)

			allowZoom = true
			triggerEvent('Camera Follow Pos', '', '')
			setProperty('defaultCamZoom', 0.75)

		elseif (curStep == 1313) then
			setProperty('boyfriend.x', 1800)
			setProperty('boyfriend.y', 1330)
			setProperty('boyfriend.angle', 0)

			setProperty('dad.x', 460)
			setProperty('dad.y', 1100)
			setProperty('dad.angle', 0)

		elseif (curStep == 1683) then

			objectPlayAnimation('BendyBGRun', 'Tunnel', true);

		elseif (curStep == 1937) then
			objectPlayAnimation('BendyBGRun', 'Loop' ..animCounter, true)
		end

		if (stairsY >= 2000) then
			stairsY = -2200
			playerX = -400
		end
		if (platformX <= -2000) then
			platformX = -1600
		end
		if (BGY >= 1600) then 
			BGY = -1000
		end

		if (curStep < 783 or curStep > 1056) then
			setProperty('dad.x', defaultOpponentX - getProperty('health') * 100)
			if (getProperty('health') * 100 < 80) then
				triggerEvent('Alt Idle Animation', 1, '-alt')
			else
				triggerEvent('Alt Idle Animation', 1, '')
			end
		end
		if (allowZoom == true) then
			if (getProperty('health') * 100 < 76) then
				triggerEvent('Camera Follow Pos', 1575, 1305)
			else
				triggerEvent('Camera Follow Pos', '', '')
			end

			if (getProperty('health') * 100 < 70) then
				setProperty('defaultCamZoom', 1.2 - getProperty('health') / 2)
			else
				setProperty('defaultCamZoom', 0.75)
			end
		end
		
		if (curStep == 410 or curStep == 537 or curStep == 777 or curStep == 1050 or curStep == 1306 or curStep == 1675 or curStep == 1931) then
			addLuaSprite('Transition', false)
			objectPlayAnimation('Transition', 'Trans', true);
			runTimer('TransitionDestroy', 1.5)
		end

		if (getProperty('BendyBGRun.animation.curAnim.finished')) then
			if (getProperty('BendyBGRun.animation.curAnim.name') ~= 'Tunnel') then
				animCounter = animCounter + 1
				objectPlayAnimation('BendyBGRun', 'Loop' ..animCounter, true)
			end
		end
		if (animCounter > 4) then
			animCounter = 0
		end
	end
end

function onTimerCompleted(tag)
	if tag == 'TransitionDestroy' then
		removeLuaSprite('Transition',false)
	end
end