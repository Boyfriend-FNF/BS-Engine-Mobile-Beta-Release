local RemoveInkEffect = false
local InkedEffect = 0
local EnableInkedEffect = false
function onCreate()
    if not lowQuality then
        makeLuaSprite('InkedShit','bendy/images/third/Ink_Shit',520,0)
        makeLuaSprite('InkedShit2','bendy/images/third/Ink_Shit',-240,0)
        makeLuaSprite('InkedShit3','bendy/images/third/Ink_Shit',-1000,0)
        makeAnimatedLuaSprite('Inked_Rain','bendy/images/third/InkRain',0,0)
        addAnimationByPrefix('Inked_Rain','Rain','erteyd instance 1',24,true)
        setObjectCamera('InkedShit','other')
        setObjectCamera('InkedShit2','other')
        setObjectCamera('InkedShit3','other')
        setObjectCamera('Inked_Rain','other')
    end
end

function onUpdate(elapsed)
    if not lowQuality then
        setProperty('InkedShit.x',getProperty('InkedShit.x') + 2)
        setProperty('InkedShit2.x',getProperty('InkedShit2.x') + 2)
        setProperty('InkedShit3.x',getProperty('InkedShit3.x') + 2)

        setProperty('InkedShit.alpha',InkedEffect)
        setProperty('InkedShit2.alpha',InkedEffect)
        setProperty('InkedShit3.alpha',InkedEffect)
        setProperty('Inked_Rain.alpha',InkedEffect)


        if getProperty('InkedShit2.x') >= 520 then
            setProperty('InkedShit.x',520)
            setProperty('InkedShit2.x',-240)
            setProperty('InkedShit3.x',-1000)
        end
        if not RemoveInkEffect and InkedEffect < 0.5 and EnableInkedEffect then
            InkedEffect = InkedEffect + 0.02
        end
    
        if curStep > 1680 and getProperty('health') > 0.05 and curStep < 1792 then
            setProperty('health',getProperty('health') - 0.005)
        end
    
        if curStep > 1792 then
            InkedEffect = InkedEffect - 0.02
            if InkedEffect == 0 and not lowQuality then
                removeLuaSprite('InkedShit',true)
                removeLuaSprite('InkedShit2',true)
                removeLuaSprite('InkedShit3',true)
                removeLuaSprite('Inked_Rain',true)
            end
        end
        if difficulty ~= 0 then
            if RemoveInkEffect == false then
                if curStep == 1355 and curStep < 1680 or curStep == 1860 or curStep >= 2064 and curStep < 3023 or curStep >= 3215 and curStep < 3912  then
                    RemoveInkEffect = true
                    EnableInkedEffect = false
                end
            end
    
            if curStep >= 1680 and curStep < 1860 or curStep == 3023 or curStep == 3912 then
                if not lowQuality then
                    addLuaSprite('InkedShit',false)
                    addLuaSprite('InkedShit2',false)
                    addLuaSprite('InkedShit3',false)
                    addLuaSprite('Inked_Rain',true)
                    RemoveInkEffect = false
                    EnableInkedEffect = true
                end
            end
        end
    end
    
end
    
    
function onStepHit()
    if curStep >= 112 and curStep < 128 then
        cameraShake('camGame', 0.05, 0.05);
        cameraShake('camHud', 0.02, 0.05);
    end
end

function opponentNoteHit()
    cameraShake('camGame', 0.02, 0.1);
    cameraShake('camHud', 0.008, 0.1);
end

