function onCreate() 


    makeLuaSprite('BlackRitual','sans/white',0,0)
    setObjectCamera('BlackRitual','hud')
    doTweenColor('BlackToWhiteRitual','BlackRitual','000000',0.01,'linear')
    addLuaSprite('BlackRitual',true)
end

function onUpdate()
    if curStep > 62 and curStep < 85 and getProperty('BlackRitual.alpha') < 1 or curStep > 1310 then
        setProperty('BlackRitual.alpha',getProperty('BlackRitual.alpha') + 0.014)
        addLuaSprite('BlackRitual',true)
    end
    if curStep <= 62 then
        setProperty('BlackRitual.alpha',0)
    end
    
    if curStep >= 86 and curStep < 1310 then
        setProperty('BlackRitual.alpha',getProperty('BlackRitual.alpha') - 0.015)

        if getProperty('BlackRitual.alpha') < 0 then
            removeLuaSprite('BlackRitual')
        end
    end
end