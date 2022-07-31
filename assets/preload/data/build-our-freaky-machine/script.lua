local FlashCreate = false
local removeFlash = false


function onCreate()
    makeLuaSprite('FlashBendy','',0,0)
    setObjectCamera('FlashBendy','other')

    makeLuaSprite('BlackScreenBendy','','')
    setObjectCamera('BlackScreenBendy','hud')
    setScrollFactor('BlackScreenBendy',0,0)

end

function onUpdate()

    if FlashCreate == true then
        if removeFlash == true then
            setProperty('FlashBendy.alpha',getProperty('FlashBendy.alpha') - 0.02)
        end
        if getProperty('FlashBendy.alpha') <= 0 then
            removeLuaSprite('FlashBendy',false)
            FlashCreate = false
        end
    end
end

function onStepHit()
    if curStep == 1280 then
        flash('FFFFFFF',0,nil,1)
    end
    if curStep == 1535 then
        flash('000000',0,nil,1)
    end
    if curStep == 1646 then
        flash('FF0000',2,'add',0.5)
    end
    if curStep == 503 or curStep == 566 or curStep == 1174 or curStep == 1238 or curStep == 1943 or curStep == 2006 then
        AnotherEffect('000000',1,0.6,'linear')
    end
    if curStep == 510 or curStep == 574 or curStep == 1182 or curStep == 1248 or curStep == 1950 or curStep == 2014 then
        AnotherEffect('FFFFFF',0.5,0.2,'linear')
    end
    if curStep == 512 or curStep == 575 or curStep == 1184 or curStep == 1250 or curStep == 1952 or curStep == 2016 then
        AnotherEffect('FFFFFF',0,0.2,'linear')
    end
end
function flash(colorHex,timerForFlash,blendMode,alpha)

    makeGraphic('FlashBendy',screenWidth,screenHeight,colorHex)
    addLuaSprite('FlashBendy',true)
    runTimer('removeFlash',timerForFlash)
    setBlendMode('FlashBendy',blendMode)
    setProperty('FlashBendy.alpha',alpha)
    removeFlash = false
    FlashCreate = true
end

function AnotherEffect(color,alpha,time,tween)
    makeGraphic('BlackScreenBendy',screenWidth,screenHeight,color)
    if alpha == 1 then
        setProperty('BlackScreenBendy.alpha',0)
    end
    addLuaSprite('BlackScreenBendy',false)
    doTweenAlpha('BlackEffectWOW','BlackScreenBendy',alpha,time,'linear')
end
function onTimerCompleted(tag)
    if tag == 'removeFlash' then
        removeFlash = true
    end
end