function onCreate()
	-- background shit



	makeAnimatedLuaSprite('SansBS-BG', 'sans/Nightmare Sans Stage',300,500);
	addAnimationByPrefix('SansBS-BG','BG1','Normal instance 1',24,true);
	addAnimationByPrefix('SansBS-BG','BG2','sdfs instance 1',24,true);
	setProperty('SansBS-BG.animation.curAnim.frameRate',0)
	objectPlayAnimation('SansBS-BG','BG1',false)


	addLuaSprite('SansBS-BG', false);
    if songName == 'Bad-Time' then
		if not lowQuality and flashingLights then
			makeAnimatedLuaSprite('BeatSans', 'sans/Nightmare Sans Stage',0,170);
			addAnimationByPrefix('BeatSans','Beat','dd instance 1',24,false);
			objectPlayAnimation('BeatSans','Beat',false)
			setObjectCamera('BeatSans','hud')
			setBlendMode('BeatSans','add')
			setProperty('BeatSans.alpha',0.8)
			BeatEffect = 0
		end
	end

end

function onUpdate(elapsed)
	if curStep == 384 then
		setProperty('SansBS-BG.animation.curAnim.frameRate', 24)
	end
	if songName == 'Bad-Time' then
		if curStep == 512 or curStep == 928 or curStep == 1440 then
			objectPlayAnimation('SansBS-BG','BG2')	
		
			if not lowQuality and flashingLights then
				BeatEffect = 1;	
				addLuaSprite('BeatSans',true)
			end
		end
		if curStep == 768 or curStep == 1184 then
			objectPlayAnimation('SansBS-BG','BG1')	
			BeatEffect = 0
			if not lowQuality and flashingLights then
			 removeLuaSprite('BeatSans',false)
			end
		end
	end
end

function onBeatHit()
	if curBeat % 2 == 0 and BeatEffect == 1 and not lowQuality and flashingLights then
		objectPlayAnimation('BeatSans','Beat',true)
	end
end

