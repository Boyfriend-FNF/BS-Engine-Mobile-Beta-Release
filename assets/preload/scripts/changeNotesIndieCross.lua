local changedNotes = -1
local noteStyle = ''

function onUpdate()
    if songName == 'Snake-Eyes' or songName == 'Knockout' or songName == 'Technicolor-Tussle' or songName == 'Devils-Gambit' or songName == 'Satanic-Funkin' then
        changedNotes = 0
        noteStyle = 'Cuphead'

    end
    if changedNotes == 0 then
        for i = 0,7 do
            if noteStyle == 'Cuphead' then
                setPropertyFromGroup('strumLineNotes', i, 'texture', 'cup/Cuphead_NOTE_assets')
            end
        end 
        changedNotes = 1
    end
    if changedNotes >= 0 then
        for j = 0,getProperty('notes.length')-1 do
            if getPropertyFromGroup('notes', j, 'noteType') == '' then
                if noteStyle == 'Cuphead' then
                 setPropertyFromGroup('notes', j,'texture','cup/Cuphead_NOTE_assets')
                end
            end
        end
    end
end