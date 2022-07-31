local EnableBFFrames = false
local EnableDadFrames = false
local EnabledCharacters = {
    'BF_IC_Cuphead',
    'BF_IC_Rain',
    'BF_Bendy_IC',
    'BF_Bendy_IC_Phase2',
    'BF_Bendy_IC_Phase3',
    'BF_Bendy_NM_Bendy',
    'BF_Sammy',
    'BF_Sans_BS',
    'BF_Sans_Chara',
    'BF_Sans_IC',
    'BF_Sans_WT',
    'BF_Christmas_IC',
    'BoyFriend_DA',
    'BoyFriend_DA - Black and White',
    'BoyFriend_NM',
    'UT-BF',
    'UT-BF_Chara',
    'Bendy_DA',
    'Bendy_DAPhase2',
    'Bendy_IC',
    'Cuphead Pissed',
    'Cuphead',
    'Devil_Cup',
    'Nightmare-Bendy',
    'Nightmare-Cuphead',
    'Nightmare-Sans',
    'Papyrus_IC',
    'Sammy',
    'Sans_IC',
    'Sans_IC_WT',
    'Sans_Phase2_IC',
    'Sans_Phase3',
    'Sans_Phase3_Tired',
    'UT-Sans'}

function onUpdate()
    for Characters = 0,#EnabledCharacters do
        if getProperty('boyfriend.curCharacter') == EnabledCharacters[Characters] then
            EnableBFFrames = true
        end
        if getProperty('dad.curCharacter') == EnabledCharacters[Characters] then
            EnableDadFrames = true
        end
    end
end
function goodNoteHit(id, direction, noteType, isSustainNote)
    if isSustainNote and EnableBFFrames then
        setProperty('boyfriend.animation.curAnim.curFrame',2)
    end
end
function opponentNoteHit(id, direction, noteType, isSustainNote)
    if isSustainNote and EnableDadFrames then
        setProperty('dad.animation.curAnim.curFrame',2)
    end
end