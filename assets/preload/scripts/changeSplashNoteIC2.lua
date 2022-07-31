local splashCount = 0;

local splashThing = 'note splash purple 1';

local fuck = 0;

local sickTrack = 0;

local enableNewSystem = true; -- Toggles Psych Splashes or New Splashes On/Off

local texture = 'IC_NoteSplash';


-- No longer messes with your ClientPrefs! Which means Note Splashes no longer randomly turn off!

-- function onCreate()
-- 	preCacheShit()
-- end

function onCreatePost()

	makeAnimatedLuaSprite('noteSplashp', texture, 100, 100);
	addLuaSprite('noteSplashp',false);
	setProperty('noteSplashp.alpha',0.001)
    -- setProperty('noteSplashp.alpha', 0.0)
end

function goodNoteHit(note, direction, type, sus)
	if sickTrack < getProperty('sicks') then
		sickTrack = sickTrack + 1;

		if type == '' then
			spawnCustomSplash(note, direction, type, sus);
		end
	end
end

function spawnCustomSplash(note, direction, type, sus)
	splashCount = splashCount + 1;

	if direction == 0 then
		splashThing = 'note splash purple 1';
	elseif direction == 1 then
		splashThing = 'note splash blue 1';
	elseif direction == 2 then
		splashThing = 'note splash green 1';
	else
		splashThing = 'note splash red 1';
	end

	makeAnimatedLuaSprite('noteSplash' .. splashCount, texture, getPropertyFromGroup('playerStrums', direction, 'x'), getPropertyFromGroup('playerStrums', direction, 'y'));
		
	addAnimationByPrefix('noteSplash' .. splashCount, 'anim', splashThing, 22, false);
	addLuaSprite('noteSplash' .. splashCount);
    -- objectPlayAnimation('noteSplash' .. splashCount, 'anim')

	setProperty('noteSplash' .. splashCount .. '.offset.x', 85);
	setProperty('noteSplash' .. splashCount .. '.offset.y', 85);
	-- setProperty('noteSplash' .. splashCount .. '.scale.y', 0.9);
	-- setProperty('noteSplash' .. splashCount .. '.scale.x', 0.9);
	setProperty('noteSplash' .. splashCount .. '.alpha', 0.6);

	setObjectCamera('noteSplash' .. splashCount, 'hud');
	setObjectOrder('noteSplash' .. splashCount, 9999); -- this better make the splashes go in front-
	setObjectOrder('timeBarBG', 99999);
	setObjectOrder('timeBar', 999999);
	setObjectOrder('timeTxt', 9999999);
end

function onUpdatePost()
	for i = 0, splashCount do
		if getProperty('noteSplash' .. i .. '.animation.curAnim.finished') then
			removeLuaSprite('noteSplash' .. i);
		end
	end
	for s = 0, getProperty('grpNoteSplashes.length')-1 do
		setPropertyFromGroup('grpNoteSplashes', s, 'visible', false);
	end	
end