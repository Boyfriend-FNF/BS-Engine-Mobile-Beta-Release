local attack = 0
local SoundToPlay = 1;
local RandomSound = 0
local AttackEnable = true
local Bf_AttackSansVisible = 0

function onCreate()

   
   makeAnimatedLuaSprite('SansDodge','characters/sans/Sans_IC',getProperty('dad.x') - 125,getProperty('dad.y') - 20)
   addAnimationByPrefix('SansDodge','Dodge','SansDodge instance 1',24,false)
   objectPlayAnimation('SansDodge','Dodge',false)


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

local allowEndSong = false
function onEndSong()
    if not allowEndSong and not seenCutscene and isStoryMode then
        if attack < 3 then
            loadSong('Final-Stretch',difficuty)
            return Function_Stop
        elseif attack >= 3 then
            loadSong('Burning-In-Hell',difficuty)
            return Function_Stop
        end
    end
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
        Bf_AttackSansVisible = 1
        attack = attack + 1
    end
    if Bf_AttackSansVisible == 1 then
        for i = 0,getProperty('notes.length')-1 do
            if getPropertyFromGroup('notes', i, 'mustPress') == true then
                if getProperty('boyfriend.animation.curAnim.name') == 'attack' then
                    setPropertyFromGroup('notes', i, 'noAnimation', true)
                end
                if getProperty('boyfriend.animation.curAnim.finished') and getProperty('boyfriend.animation.curAnim.name') == 'attack' and Bf_AttackSansVisible == 1 or  getProperty('boyfriend.animation.curAnim.name') ~= 'attack' and Bf_AttackSansVisible == 1 then
                    setPropertyFromGroup('notes', i, 'noAnimation', false)
                end
            end
        end
    end

    if getProperty('boyfriend.animation.curAnim.finished') and getProperty('boyfriend.animation.curAnim.name') == 'attack' then
        Bf_AttackSansVisible = 0
    end

    if getProperty('AttackButton.animation.curAnim.finished') == true then
        objectPlayAnimation('AttackButton','Static',true)
        setProperty('AttackButton.y',getProperty('AttackButton.y')+ 20)
    end

    if curStep == 775 and attack == 1 then
        triggerEvent('Play Animation','snap','dad')
        triggerEvent('Camera Follow Pos',getProperty('dad.x') + 485,getProperty('dad.y') + 200)
        runTimer('eyeSound',0.1)
        
    end

    if curStep == 782 and attack == 1 then
        removeLuaSprite('AttackButton',true)
        removeLuaSprite('SansBG',true)
        addLuaSprite('SansBattle',false)
        triggerEvent('Change Character','dad','UT-Sans')
        triggerEvent('Change Character','bf','UT-BF')
        triggerEvent('Add Camera Zoom',0.35,0.35)
        BfFly = true;
        setProperty('defaultCamZoom',0.4)
        setProperty('dad.y',50)
        triggerEvent('Camera Follow Pos','','')
    end

    if BfFly == true then
        songPos = getSongPosition()
        local currentBeat = (songPos/1000)*(bpm/80)
   
        doTweenY(boyfriendTweenY, 'boyfriend', 700 + 300 *math.sin((currentBeat *1) * math.pi),10)         
    end

    if getProperty('SansDodge.animation.curAnim.finished') then
        removeLuaSprite('SansDodge',false)
        setProperty('dad.visible',true)
    end
end

function onTimerCompleted(tag)
    if tag == 'eyeSound' then
        playSound('sans/eye')
    end
    if tag == 'SansDodge' then
        setProperty('health',getProperty('health') + 0.25)
     playSound('sans/dodge')
     setProperty('dad.visible',false)
     addLuaSprite('SansDodge',true)
     objectPlayAnimation('SansDodge','Dodge',false)
     cameraShake('game','0.01','0.5')
    end
end