local InkedEffect = 0
local RemoveInkEffect = false
local EnableInkedEffect = true
function onCreate()
    if (not lowQuality) then
        makeLuaSprite('InkedShit','bendy/images/third/Ink_Shit',520,0)
        makeLuaSprite('InkedShit2','bendy/images/third/Ink_Shit',-240,0)
        makeLuaSprite('InkedShit3','bendy/images/third/Ink_Shit',-1000,0)
        makeAnimatedLuaSprite('Inked_Rain','bendy/images/third/InkRain',0,0)
        addAnimationByPrefix('Inked_Rain','Rain','erteyd instance 1',24,true)
        setObjectCamera('InkedShit','hud')
        setObjectCamera('InkedShit2','hud')
        setObjectCamera('InkedShit3','hud')
        setObjectCamera('Inked_Rain','hud')
    end
end
function onUpdate()
    if (not lowQuality) then
        setProperty('InkedShit.x',getProperty('InkedShit.x') + 2)
        setProperty('InkedShit2.x',getProperty('InkedShit2.x') + 2)
        setProperty('InkedShit3.x',getProperty('InkedShit3.x') + 2)

        setProperty('InkedShit.alpha',InkedEffect)
        setProperty('InkedShit2.alpha',InkedEffect)
        setProperty('InkedShit3.alpha',InkedEffect)
        setProperty('Inked_Rain.alpha',InkedEffect)

        if (getProperty('InkedShit2.x') >= 520) then
            setProperty('InkedShit.x',520)
            setProperty('InkedShit2.x',-240)
            setProperty('InkedShit3.x',-1000)
        end

        if EnableInkedEffect and InkedEffect < 0.5 then
            InkedEffect = InkedEffect + 0.02
        end
        if (curStep > 1664 and InkedEffect < 0.5 and curStep < 1792) then
            RemoveInkEffect = false
            EnableInkedEffect = true
            if (curStep > 1664 and getProperty('health') > 0.05 and curStep < 1792) then
                setProperty('health',getProperty('health') - 0.005)
            end
           
        elseif (curStep > 1792) then
            RemoveInkEffect = true
            EnableInkedEffect = false
        end
    
        if (RemoveInkEffect and not lowQuality) then
            if InkedEffect > 0 then
                InkedEffect = InkedEffect - 0.02
            end
    
            if (InkedEffect == 0) then
                removeLuaSprite('InkedShit', true)
                removeLuaSprite('InkedShit2', true)
                removeLuaSprite('InkedShit3', true)
                removeLuaSprite('Inked_Rain', true)
            end
        end
    end
end

function onStepHit()
    if (curStep == 1664) and (not lowQuality) then
        addLuaSprite('InkedShit', false)
        addLuaSprite('InkedShit2', false)
        addLuaSprite('InkedShit3', false)
        addLuaSprite('Inked_Rain', true)
    end
end

function opponentNoteHit()
    cameraShake('camGame', 0.005, 0.5);
    cameraShake('camHud', 0.0005, 0.01);
end