local AlphaEffect = -1
local Timer = 2
local MaxValueEffect = 0.5
function onCreatePost()
    if songName == 'Last-Reel' or songName == 'Nightmare-Run' or songName == 'Despair' or songName == 'Terrible-Sin' or songName == 'imminent-demise' or songName == 'Devils-Gambit' or songName == 'Ritual' or songName == 'Burning-In-Hell' then
        BendyEffect = 1
        makeLuaSprite('BlackSubEffectBendyIC','',0,0)
        makeGraphic('BlackSubEffectBendyIC',screenWidth,screenHeight,'646464')
        setObjectCamera('BlackSubEffectBendyIC','other')
        setProperty('BlackSubEffectBendyIC.alpha',0)
        addLuaSprite('BlackSubEffectBendyIC',true)
        setBlendMode('BlackSubEffectBendyIC','SUBTRACT')
        runTimer('BackToBlackBendy',Timer)
    end
end
function onTimerCompleted(tag)
    if tag == 'BackToWhiteBendy' then
        doTweenAlpha('BlackLightEffect', 'BlackSubEffectBendyIC', 0, Timer,'linear')
        runTimer('BackToBlackBendy',Timer * 1.5)
    end
    if tag == 'BackToBlackBendy' then
        doTweenAlpha('BlackLightEffect', 'BlackSubEffectBendyIC', MaxValueEffect, Timer,'linear')
        runTimer('BackToWhiteBendy',Timer * 1.5)
    end
end