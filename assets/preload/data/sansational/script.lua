function onCreate()
   attack = 0
   attackTimer = 0;
   changedNotes = false;
   SoundToPlay = 1;


   makeLuaSprite('SansBattle','sans/battle',0,-800)
   scaleObejct('SansBattle',1.55,1.5)
   precacheImage('sans/battle')

end

function onUpdate(elapsed)


    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SHIFT') and curStep< 780 then
        attack = attack + 1
    end

    if getProperty('AttackButton.animation.curAnim.finished') == true then
        attackTimer = 0
        objectPlayAnimation('AttackButton','Static',true)
        setProperty('AttackButton.y',getProperty('AttackButton.y')+ 20)
    end

    if curStep == 775 and attack >= 3 then
        triggerEvent('Play Animation','snap','dad')
        triggerEvent('Camera Follow Pos',getProperty('dad.x') + 485,getProperty('dad.y') + 200)
        runTimer('eyeSound',0.1)
        
    end

    if curStep == 782 and attack >= 3 then
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
end

function onUpdatePost()
    if attack < 3 then
        for j = 0, getProperty('notes.length')-1 do
            if getPropertyFromGroup('notes', j, 'noteType') == 'OrangeBoneNote' then
                setPropertyFromGroup('notes', j, 'texture', '');
                setPropertyFromGroup('notes', j, 'noteType', '');
            end

            if getPropertyFromGroup('notes', j, 'noteType') == 'BlueBoneNote' then
                removeFromGroup('notes', j,false);
            end
        end
    end
end