local BeatPorcent = 0

function onBeatHit()
    if curBeat % BeatPorcent == 0 and curBeat % 4 ~= 0 then
        triggerEvent('Add Camera Zoom','','')
    end
end
function onStepHit()
    if curStep == 224 or curStep == 607 or curStep == 768 or curStep == 894 or curStep == 1600 then
        BeatPorcent = 1
    end
    if curStep == 320 or curStep == 400 or curStep == 482 or curStep == 623 or curStep == 642 or curStep == 1072 or curStep == 1098 or curStep == 1520 or curStep == 1712 or curStep == 1840 then
        BeatPorcent = 2
    end
    if curStep == 342 or curStep == 350 or curStep == 464 or curStep == 634 or curStep == 1008 or curStep == 1088 or curStep == 1502 or curStep == 1646 or curStep == 1776 or curStep == 2048 then
        BeatPorcent = 0
    end
end
function opponentNoteHit(id,data,cu,sus)
    if curStep >= 1645 and curStep <= 1664 and not sus then
        cameraShake('game',0.02,0.05)
        cameraShake('hud',0.01,0.05)
    end
end