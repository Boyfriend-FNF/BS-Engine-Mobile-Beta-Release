local IndieCrossCountDownStyle = ''
local scaleEffect = 1
local alphaEffect = 0
local alphaEffectDisable = false




function onCreate()
    if songName == 'Snake-Eyes' or songName == 'Knockout' or songName == 'Technicolor-Tussle' or songName == 'Devils-Gambit' or songName == 'Satanic-Funkin' then
        IndieCrossCountDownStyle = 'Cuphead'
        setProperty('skipCountdown', true)
        makeAnimatedLuaSprite('CupTitle','cup/ready_wallop',-600,-150)
        addAnimationByPrefix('CupTitle','Ready?','Ready? WALLOP!',24,false)
        objectPlayAnimation('CupTitle','Ready?',false)
        setLuaSpriteScrollFactor('CupTitle',0,0)
       
        makeAnimatedLuaSprite('CupThing','cup/the_thing2.0',-345,-200)
        setLuaSpriteScrollFactor('CupThing',0,0)
        addAnimationByPrefix('CupThing','BOO','BOO instance 1',20,false)
        objectPlayAnimation('CupThing','BOO',false)
        scaleObject('CupThing',1.6,1.6)
        addLuaSprite('CupThing',true)
        setObjectCamera('CupThing', 'hud');
           
        runTimer('CupReady',0.5)

    elseif songName == 'Whoopee' or songName == 'Sansational' or songName == 'Final-Stretch' or songName == 'Burning-In-Hell' or songName == 'Bad-Time' or songName == 'Bad-To-The-Bone' or songName == 'Bonedoggle' then
        setProperty('introSoundsSuffix','Sans')
    elseif songName == 'imminent-demise' or songName == 'Terrible-Sin' or songName == 'Last-Reel' or songName == 'Last-Reel' or songName == 'Nightmare-Run' or songName == 'Ritual' or songName == 'Despair' or songName == 'Freaky-Machine' or songName == 'build-our-freaky-machine'then
        setProperty('introSoundsSuffix','Sans')
        IndieCrossCountDownStyle = 'Bendy'
    end

    if songName == 'imminent-demise' then
        makeLuaSprite('TextIntro','bendy/images/introductionsong1',360,300)
        scaleEffect = 0.8;
        
    elseif songName == 'Terrible-Sin' then
        makeLuaSprite('TextIntro','bendy/images/introductionsong2',320,280)
        scaleEffect = 0.8;

    elseif songName == 'Last-Reel' then
        makeLuaSprite('TextIntro','bendy/images/introductionsong3',380,300)
        scaleEffect = 0.8;

    elseif songName == 'Nightmare-Run' then
        makeLuaSprite('TextIntro','bendy/images/introductionsong4',400,300)
        scaleEffect = 0.8;

    elseif songName == 'Ritual' then
        makeLuaSprite('TextIntro','bendy/images/introductionbonus2',360,300)
        scaleEffect = 0.75;

    elseif songName == 'Freaky-Machine' or songName == 'build-our-freaky-machine' then
        makeLuaSprite('TextIntro','bendy/images/introductionbonus',340,300) 
        scaleEffect = 0.8;

    elseif songName == 'Despair' then
        makeLuaSprite('TextIntro','bendy/images/introductiondespair',400,320)
        scaleEffect = 0.8;

    end
    if IndieCrossCountDownStyle == 'Bendy' then
        makeLuaSprite('BlackFadeBendy','',0,0)
        makeGraphic('BlackFadeBendy',screenWidth,screenHeight,'000000')
        setObjectCamera('BlackFadeBendy','other')
        addLuaSprite('BlackFadeBendy',true)
        doTweenColor('WhiteToBlack','BlackFadeBendy','000000',0.01,'LinearOut')
        setProperty('skipCountdown',true)
        CountTextCompleted = false
        runTimer('textSongDestroy',2)
        setObjectCamera('TextIntro','other')
        addLuaSprite('TextIntro',true)
        runTimer('playBendySongCountDown',0.2)
    end
end

local allowCountdown = false
function onStartCountdown()
	if not allowCountdown and IndieCrossCountDownStyle == 'Cuphead' or not allowCountdown and IndieCrossCountDownStyle == 'Bendy' then
		return Function_Stop;
	end
    return Function_Continue;
end

function onUpdate()
    if IndieCrossCountDownStyle == 'Bendy' then
        scaleEffect = scaleEffect + 0.0005
        scaleObject('TextIntro',scaleEffect,scaleEffect)
        setProperty('TextIntro.x',getProperty('TextIntro.x') - 0.20)
        setProperty('TextIntro.y',getProperty('TextIntro.y') - 0.05)

        if alphaEffectDisable then
            setProperty('BlackFadeBendy.alpha',alphaEffect)
            alphaEffect = alphaEffect - 0.01
        end
        if alphaEffect < -1 and alphaEffectDisable then
            removeLuaSprite('TextIntro',true)
            removeLuaSprite('BlackFadeBendy',true)
            alphaEffect = null
        end

        if not alphaEffectDisable and alphaEffect < 1 then
            alphaEffect = alphaEffect + 0.01
        end
        setProperty('TextIntro.alpha',alphaEffect * 2)
    elseif IndieCrossCountDownStyle == 'Cuphead' then
        if getProperty('CupTitle.animation.curAnim.finished') == true then
            removeLuaSprite('CupTitle',true)
        end
        if not lowQuality then
            if getProperty('CupThing.animation.curAnim.finished') == true then
                removeLuaSprite('CupThing',true)
            end
        end
    end
end


function onTimerCompleted(tag)
	if tag == 'textSongDestroy' then
		CountTextCompleted = true
		alphaEffectDisable = true
        allowCountdown = true
        startCountdown()
	end
    if tag == 'playBendySongCountDown' then
        playSound('bendy/whoosh')
	end
    if tag == 'CupReady' then
        if songName ~= 'Knockout' then
            playSound('Cup/intros/normal/'..math.random(0,4))
        else
            playSound('Cup/intros/angry/'..math.random(0,1))
        end
        allowCountdown = true
        startCountdown()
        addLuaSprite('CupTitle',true)
		runTimer('CupTitleDestroy',4)
    end
end
