local attack = 0
local RandomSound = 0
local AttackEnable = true
local Bf_AttackSansVisible = false

local DadStopAnim = 0
local BFStopAnim = 0

function onCreate()



   makeAnimatedLuaSprite('AttackButton','IC_Buttons',50,300)
   addAnimationByPrefix('AttackButton','Static','Attack instance 1',24,true)
   addAnimationByPrefix('AttackButton','NA','AttackNA instance 1',30,false)
   objectPlayAnimation('AttackButton','Static',true)
   setObjectCamera('AttackButton','hud')
   addLuaSprite('AttackButton',false)
   scaleObject('AttackButton',0.7,0.7)
   setProperty('AttackButton.alpha',0.5)


   makeLuaSprite('SansBattle','sans/battle',0,-800)
   scaleObejct('SansBattle',1.55,1.5)


end

function onUpdate()

    RandomSound = math.random(1,3)


    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SHIFT') and AttackEnable == true and getProperty('AttackButton.animation.curAnim.name') == 'Static' then
        characterPlayAnim('boyfriend','attack',false)
        setProperty('boyfriend.specialAnim',true)
        objectPlayAnimation('BF_Attack','attack',false)
        playSound('IC/Throw'..RandomSound)
        runTimer('SansDodge',0.3)
        objectPlayAnimation('AttackButton','NA',false)
        setProperty('AttackButton.y',getProperty('AttackButton.y') - 20)
        BFStopAnim = 2
    end
    if BFStopAnim == 2 then
        if getProperty('boyfriend.animation.curAnim.finished') and getProperty('boyfriend.animation.curAnim.name') == 'attack' then
            BFStopAnim = 1
        end
        for StopAnim = 0,getProperty('notes.length')-1 do
            setPropertyFromGroup('notes', StopAnim, 'noAnimation', true)
        end
    end
    if BFStopAnim == 1 then
        for StopAnim = 0,getProperty('notes.length')-1 do
            setPropertyFromGroup('notes', StopAnim, 'noAnimation', false)
        end
        BFStopAnim = 0
    end
    if DadStopAnim == 2 then
        if getProperty('dad.animation.curAnim.finished') and getProperty('dad.animation.curAnim.name') == 'dodge' then
            DadStopAnim = 1
        end
        for StopAnim2 = 0,getProperty('notes.length')-1 do
            if getPropertyFromGroup('notes', StopAnim2, 'mustPress') == false then
                setPropertyFromGroup('notes', StopAnim2, 'noAnimation', true)
            end
        end
    elseif DadStopAnim == 1 then
        
        for StopAnim2 = 0,getProperty('notes.length')-1 do
            if getPropertyFromGroup('notes', StopAnim2, 'mustPress') == false then
                setPropertyFromGroup('notes', StopAnim2, 'noAnimation', false)
            end
        end
        DadStopAnim = 0
    end




    if getProperty('AttackButton.animation.curAnim.finished') == true then
        objectPlayAnimation('AttackButton','Static',true)
        setProperty('AttackButton.y',getProperty('AttackButton.y')+ 20)
    end

    if AttackEnable == false and getProperty('AttackButton.alpha') > 0 then
        setProperty('AttackButton.alpha',getProperty('AttackButton.alpha') - 0.01)
    end
    if AttackEnable == true and getProperty('AttackButton.alpha') < 0.5 then
        setProperty('AttackButton.alpha',getProperty('AttackButton.alpha') + 0.01)
    end


end

function onTimerCompleted(tag)
    if tag == 'eyeSound' then
        playSound('sans/eye')
    end
    if tag == 'SansDodge' then
     playSound('sans/dodge')
     DadStopAnim = 2
     characterPlayAnim('dad','dodge',true)
     setProperty('dad.specialAnim',true)
     setProperty('health',getProperty('health') + 0.5)
     cameraShake('game','0.01','0.5') 
    end
end

function onStepHit()
    if curStep >=  379 and curStep < 896 or curStep >= 1146 and curStep < 1408 then
        AttackEnable = false
    end
    if curStep ==  896 or curStep == 1408 then
        AttackEnable = true
    end
end