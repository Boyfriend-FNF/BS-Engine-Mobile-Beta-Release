local splashCount = 0;

local splashThing = 'note splash purple 1';

local fuck = 0;

local sickTrack = 0;

local enableNewSystem = true; -- Toggles Psych Splashes or New Splashes On/Off

local texture = 'IC_NoteSplash';

local disableDefaultSplash = true;

local splashID = 0


-- No longer messes with your ClientPrefs! Which means Note Splashes no longer randomly turn off!

-- function onCreate()
-- 	preCacheShit()
-- end

function onCreatePost()
	makeAnimatedLuaSprite('noteSplashp', texture, 100, 100);
	addLuaSprite('noteSplashp',false);
	setProperty('noteSplashp.alpha',0.001)

	makeAnimatedLuaSprite('noteSplashp2', 'cup/NOTECup_assetsSplash', 100, 100);
	addLuaSprite('noteSplashp2',false);
	setProperty('noteSplashp2.alpha',0.001)
	

    -- setProperty('noteSplashp.alpha', 0.0)
end

function goodNoteHit(note, direction, type, sus)
	if sickTrack < getProperty('sicks') then
		sickTrack = sickTrack + 1;
	end
    if not sus and type ~= '' then
		disableDefaultSplash = true
		spawnCustomSplash(note, direction, type, sus);
	end
end

function spawnCustomSplash(note, direction, type, sus)
		splashCount = splashCount + 1;

		if type == 'BlueBoneNote' then

			splashThing = 'note splash blue 1'


		elseif type == 'OrangeBoneNote' or type == 'PapyrusNote' then
            
			splashThing = 'note splash orange 1'

		elseif type == 'CupheadNote' then
            
			splashThing = 'note splash purple 1'

		elseif type == 'BendySplashNote' then

			splashThing = 'note splash purple 1'
		end
        if type ~= 'CupheadNote' then
			makeAnimatedLuaSprite('noteSplash' .. splashCount, texture, getPropertyFromGroup('playerStrums', direction, 'x'), getPropertyFromGroup('playerStrums', direction, 'y'));

			addAnimationByPrefix('noteSplash' .. splashCount, 'anim', splashThing, 22, false);
			addLuaSprite('noteSplash' .. splashCount);
		else
			makeAnimatedLuaSprite('noteSplash' .. splashCount, 'cup/NOTECup_assetsSplash', getPropertyFromGroup('playerStrums', direction, 'x') - 120, getPropertyFromGroup('playerStrums', direction, 'y') - 150);
            scaleObject('noteSplash' .. splashCount,0.8,0.8)
			addAnimationByPrefix('noteSplash' .. splashCount, 'anim', 'ParryFX', 22, false);
			addLuaSprite('noteSplash' .. splashCount);
		end
		if type == 'BendySplashNote' or type == 'Devil Note' then
			doTweenColor('SplashBendy','noteSplash' .. splashCount,'000000',0.00001,'linearIn')
		end
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
end
function onTimerCompleted(tag)
	if tag == 'precacheshit' then
		removeLuaSprite('noteSplashp', true)
    end
end

-- function preCacheShit()
--     precacheImage(texture)
-- end