local allowCountdown = false
function onStartCountdown()
	if not allowCountdown and isStoryMode and not seenCutscene then --Block the first countdown
		startVideo('Sans/1');
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end

local allowEndSong = false
function onEndSong()
	if not allowEndSong and isStoryMode and not seenCutscene then --Block the first countdown
		startVideo('Sans/2');
		allowEndSong = true;
		return Function_Stop;
	end
	return Function_Continue;
end
