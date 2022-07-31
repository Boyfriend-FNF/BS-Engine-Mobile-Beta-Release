local BfFrames = 0
local DadFrames = 0
local EnableDadBendyFrames = false
local EnableBFBendyFrames = false
local ChangeBendyNotes = true
local BfMaxFrames = 11
local DadMaxFrames = 9
local BeatHit = 0


function onUpdate()
    if getProperty('boyfriend.curCharacter') == 'BF_Bendy_Run' or getProperty('boyfriend.curCharacter') == 'BF_Bendy_Run-Dark' then
     BfFrames = BfFrames + 0.4
     EnableBFBendyFrames = true
    else
        EnableBFBendyFrames = false
    end
    if getProperty('dad.curCharacter') == 'Bendy_Run' or getProperty('dad.curCharacter') == 'Bendy_Run-Dark' then
        DadFrames = DadFrames + 0.4
        EnableDadBendyFrames = true
    else
        EnableDadBendyFrames = false
    end
    if(ChangeBendyNotes) then
        if (curStep > 416 and curStep < 543 or curStep > 1055 and curStep < 1311 or curStep > 1680 and curStep < 1937) then
            for j = 0,getProperty('notes.length') -1 do
                noteType = getPropertyFromGroup('notes', j, 'noteType')

                if (noteType ~= 'BendySplashNote' and noteType ~= 'BendyShadowNote') then
                    setPropertyFromGroup('notes', j, 'texture','bendy/images/BendyNotes')
                end
                if (noteType == 'BendyShadowNote') then
                    setPropertyFromGroup('notes', j, 'texture','bendy/images/BendyShadowNoteDark')
                end
                if (noteType == 'BendySplashNote') then
                    setPropertyFromGroup('notes', j, 'texture','bendy/images/BendySplashNoteDark')
                end
            end
            for i = 0,7 do
                setPropertyFromGroup('strumLineNotes', i, 'texture','bendy/images/BendyNotes')
            end
        end
    end
        
    if (curStep == 543 or curStep == 1311 or curStep == 1937) then
        for j = 0,getProperty('notes.length') -1 do
            if getPropertyFromGroup('notes', j, 'noteType') ~= 'BendySplashNote' and getPropertyFromGroup('notes', j, 'noteType') ~= 'BendyShadowNote' then
                setPropertyFromGroup('notes', j, 'texture','')
            end
            if getPropertyFromGroup('notes', j, 'noteType') == 'BendyShadowNote' then
                setPropertyFromGroup('notes', j, 'texture','bendy/images/BendyShadowNoteAssets')
            end
            if getPropertyFromGroup('notes', j, 'noteType') == 'BendySplashNote' then
                setPropertyFromGroup('notes', j, 'texture','bendy/images/BendySplashNoteAssets')
            end
        end
        for i = 0,7 do
            setPropertyFromGroup('strumLineNotes', i, 'texture','NOTE_assets')
        end
    end


    if (EnableBFBendyFrames == true) then
        setProperty('boyfriend.animation.curAnim.curFrame',math.min(math.floor(BfFrames), BfMaxFrames))
        setProperty('boyfriend.animation.curAnim.frameRate',0)
    end
    if EnableDadBendyFrames then
        setProperty('dad.animation.curAnim.curFrame',math.min(math.floor(DadFrames), DadMaxFrames))
        setProperty('dad.animation.curAnim.frameRate',0)
    end

    if (getProperty('boyfriend.animation.curAnim.name') ~= 'idle-alt') then
        BfMaxFrames = 11
    else
        BfMaxFrames = 9
    end
    if (math.floor(BfFrames) > BfMaxFrames) then
        BfFrames = 0
    end
    if (math.floor(DadFrames) > DadMaxFrames) then
        DadFrames = 0
    end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
    if (isSustainNote) then
        setProperty('health', getProperty('health') + 0.01)
    else
        setProperty('health', getProperty('health') + 0.02)
    end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
    cameraShake('camGame', 0.0025, 0.1);
    cameraShake('hud', 0.0025, 0.01);

    if (getProperty('health') > 0.4) then
        if (isSustainNote) then
            setProperty('health', getProperty('health') - 0.0375)
        else
            setProperty('health', getProperty('health') - 0.045)
        end
    end
end



function onStepHit()
    if curStep > 800 and curStep < 1312 or curStep >= 164 and curStep < 288 or curStep == 400 or curStep == 671 or curStep == 864 or curStep == 962 or curStep == 1504 or curStep == 1600 or curStep == 1948 then
        BeatHit = 1
    elseif curStep == 288 or curStep == 608 or curStep == 736 or curStep == 800 or curStep == 928 or curStep == 1312 or curStep == 1440 or curStep == 1568 or curStep == 1632 or curStep == 1696 then
        BeatHit = 2
    elseif curStep == 544 or curStep == 768 or curStep == 1664 or curStep == 1936 or curStep == 2078 then
        BeatHit = 0
    end
end
function onBeatHit()
    if curBeat % BeatHit == 0 then
        triggerEvent('Add Camera Zoom','','')
    end
end