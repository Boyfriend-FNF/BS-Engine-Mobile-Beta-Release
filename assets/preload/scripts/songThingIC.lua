function onCreate()
    if songName == 'Bad-Time' then
        setPropertyFromClass("openfl.Lib", "application.window.title", 'Indie Cross - Tenzubushi - Bad Time')
    end

    if songName == 'Bad-To-The-Bone' then
        setPropertyFromClass("openfl.Lib", "application.window.title", 'Indie Cross - Yamahearted - Bad To The Bone')
    end

    if songName == 'Bonedoggle' then
        setPropertyFromClass("openfl.Lib", "application.window.title", 'Indie Cross - Saster - Bonedoggle')
    end

    if songName == 'Burning-In-Hell' then
        setPropertyFromClass("openfl.Lib", "application.window.title", 'Indie Cross - TheInnuendo & Saster - Burning in Hell')
    end

    if songName == 'Despair' then
        setPropertyFromClass("openfl.Lib", "application.window.title", 'Indie Cross - CDMusic, Joan Atlas & Rozebud - Despair')
    end

    if songName == 'Devils-Gambit' then
        setPropertyFromClass("openfl.Lib", "application.window.title", 'Indie Cross - Saru & TheInnuend0 - Devils Gambit')
    end

    if songName == 'Final-Stretch' then
        setPropertyFromClass("openfl.Lib", "application.window.title", 'Indie Cross - Saru - Final Stretch')
    end

    if songName == 'Freaky-Machine' then
        setPropertyFromClass("openfl.Lib", "application.window.title", 'Indie Cross - DAGames & Saster - Freaky Machine')
    end

    if songName == 'Gose' then
        setPropertyFromClass("openfl.Lib", "application.window.title", 'Indie Cross - CrystalSlime - Gose')
    end

    if songName == 'Imminent-Demise' then
        setPropertyFromClass("openfl.Lib", "application.window.title", 'Indie Cross - Saru & CDMusic - Imminent Demise')
    end

    if songName == 'Knockout' then
        setPropertyFromClass("openfl.Lib", "application.window.title", 'Indie Cross - Orenji Music - Knockout')
    end

    if songName == 'Last-Reel' then
        setPropertyFromClass("openfl.Lib", "application.window.title", 'Indie Cross - Joan Atlas - Last Reel')
    end

    if songName == 'Nightmare-Run' then
        setPropertyFromClass("openfl.Lib", "application.window.title", 'Indie Cross - Orenji Music & Rozebud - Nightmare Run')
    end

    if songName == 'Ritual' then
        setPropertyFromClass("openfl.Lib", "application.window.title", 'Indie Cross - BBPanzu & Brandxns - Ritual')
    end

    if songName == 'Saness' then
        setPropertyFromClass("openfl.Lib", "application.window.title", 'Indie Cross - CrystalSlime - Saness')
    end

    if songName == 'Sansational' then
        setPropertyFromClass("openfl.Lib", "application.window.title", 'Indie Cross - Tenzubushi - Sansational')
    end

    if songName == 'Satanic-Funkin' then
        setPropertyFromClass("openfl.Lib", "application.window.title", 'Indie Cross - TheInnuend0 - Satanic Funkin')
    end

    if songName == 'Snake-Eyes' then
        setPropertyFromClass("openfl.Lib", "application.window.title", 'Indie Cross - Mike Geno - Snake Eyes')
    end

    if songName == 'Technicolor-Tussle' then
        setPropertyFromClass("openfl.Lib", "application.window.title", 'Indie Cross - BLVKAROT - Technicolor Tussle')
    end

    if songName == 'Terrible-Sin' then
        setPropertyFromClass("openfl.Lib", "application.window.title", 'Indie Cross - CDMusic & Rozebud - Terrible Sin')
    end

    if songName == 'Whoopee' then
        setPropertyFromClass("openfl.Lib", "application.window.title", 'Indie Cross - YingYang48 & Saster - Whoopee')
    end
end

function onDestroy()
    if songName == 'Whoopee' or 'Terrible-Sin' or 'Technicolor-Tussle' or 'Snake-Eyes' or 'Satanic-Funkin' or 'Sansational' or 'Saness' or 'Ritual' or 'Nightmare-Run' or 'Last-Reel' or 'Knockout' or 'Imminent-Demise' or 'Gose' or 'Freaky-Machine' or 'Final-Stretch' or 'Devils-Gambit' or 'Snake-Eyes' or 'Burning-In-Hell' or 'Bonedoggle' or 'Bad-To-The-Bone' or 'Bad-Time' then
    setPropertyFromClass("openfl.Lib", "application.window.title", "Friday Night Funkin': Psych Engine")
    end
end