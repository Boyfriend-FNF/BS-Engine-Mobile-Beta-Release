function onCreatePost()
    if songName == 'Snake-Eyes' or songName == 'Technicolor-Tussle' or songName == 'Knockout' or songName == 'Devils-Gambit' or songName == 'Satanic-Funkin' then
        setTextFont('scoreTxt', 'CupheadICFont.ttf')
        setTextFont('timeTxt','CupheadICFont.ttf')
    elseif songName == 'Despair' or songName == 'Nightmare-Run' or songName == 'Last-Reel' or songName == 'Terrible-Sin' or songName == 'imminent-demise' then
        setTextFont('scoreTxt', 'BendyICFont.ttf')
        setTextFont('timeTxt','BendyICFont.ttf')
    elseif songName == 'Burning-In-Hell' or songName == 'Final-Stretch' or songName == 'Bad-Time' or songName == 'Whoopee' or songName == 'Sansational' then
        setTextFont('scoreTxt', 'SansICFont.ttf')
        setTextFont('timeTxt','SansICFont.ttf')
    elseif songName == 'Bonedoggle' or songName == 'Bad-To-The-Bone' then
        setTextFont('scoreTxt', 'PapyrusICFont.ttf')
        setTextFont('timeTxt','PapyrusICFont.ttf')
    end
end