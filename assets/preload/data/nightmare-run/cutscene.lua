local allowEndSong = false
function onEndSong()
    if not allowEndSong and isStoryMode and not seenCutscene then
        startVideo('bendy/5')
        allowEndSong = true
        return Function_Stop;
    end
    return Function_Continue;
end