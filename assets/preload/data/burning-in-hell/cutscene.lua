local allowCountdown = false
function onStartCountdown()
	if not allowCountdown and not seenCutscene and isStoryMode then --Block the first countdown
		startVideo('sans/3b');
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end

local allowCountdownEnd = false
local exitSong = false
function onEndSong()
    if not allowCountdownEnd and not seenCutscene and isStoryMode then
        startVideo('sans/4b');   
        allowCountdownEnd = true;
        exitSong = true
        return Function_Stop;
    end
    if exitSong == true and allowCountdownEnd == true and not seenCutscene and isStoryMode then
        exitSong(false)
        return Function_Stop;
    end
    return Function_Continue;
end