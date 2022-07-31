
local StopAnim = 0
local StopAnimName = ''
local SplashEffect = 1;
local SplashDamage = 0

local BFBendy_Attacking = false
local BFBendy_Dodge = false

local CameraEffect = false

local PiperX = false
local StrikerX = false
local PiperSpawn = 100
local StrikerSpawn = 200
local PiperAttack = 0
local StrikerAttack = 0
local PiperAttackTimeMax = 400
local StrikerAttackTimeMax = 400

local PiperOffsetX = 0
local StrikerOffsetX = 0

local PiperOffsetY = 0
local StrikerOffsetY = 0

local PiperBFX = 500
local StrikerBFX = -300


local PiperAttacking = false
local Dodge1 = 0

local StrikerAttacking = false
local Dodge2 = 0


local PiperHP = 3
local StrikerHP = 3

local enableAttack = false


function onCreatePost()
    if difficulty ~= 0 then
        if songName == 'Last-Reel' then
            PiperOffsetY = 40
            StrikerOffsetY = 50

            PiperOffsetX = 1220
            StrikerOffsetX = -750
            makeAnimatedLuaSprite('Piper','bendy/images/third/Piper',2500,getProperty('boyfriend.y'))
            addAnimationByPrefix('Piper','Walking','pip walk instance 1',24,true)
            addAnimationByPrefix('Piper','Idle','Piperr instance 1',24,false)
            addAnimationByPrefix('Piper','Hurt','Piper gets Hit instance 1',24,false)
            addAnimationByPrefix('Piper','Dead','Piper ded instance 1',24,false)
            addAnimationByPrefix('Piper','Attack','PeepAttack instance 1',24,false)
            addAnimationByPrefix('Piper','Pre-Attack','PipAttack instance 1',24,false)
            scaleObject('Piper',1.8,1.8)
            
            makeAnimatedLuaSprite('Striker','bendy/images/third/Striker',-200,getProperty('boyfriend.y'))
            addAnimationByPrefix('Striker','Walking','Str walk instance 1',24,true)
            addAnimationByPrefix('Striker','Hurt','Sticker  instance 1',24,false)
            addAnimationByPrefix('Striker','Dead','I ded instance 1',24,false)
            addAnimationByPrefix('Striker','Pre-Attack','PunchAttack_container instance 1',24,false)
            addAnimationByPrefix('Striker','Attack','regeg instance 1',24,false)
            addAnimationByPrefix('Striker','Idle','strrr instance 1',24,false)
            scaleObject('Striker',1.8,1.8)

            AttackEnable = true
        end
        if songName == 'Despair' then
            PiperOffsetY = -100
            StrikerOffsetY = -80

            PiperBFX = 350
            StrikerBFX = -400

            PiperOffsetX = 2000
            StrikerOffsetX = 0
            makeAnimatedLuaSprite('Piper','bendy/images/third/PiperDespair',screenWidth + PiperOffsetX,getProperty('boyfriend.y') + PiperOffsetY)
            addAnimationByPrefix('Piper','Walking','pip walk instance 1',24,true)
            addAnimationByPrefix('Piper','Idle','Piperr instance 1',24,false)
            addAnimationByPrefix('Piper','Hurt','Piper gets Hit instance 1',24,false)
            addAnimationByPrefix('Piper','Dead','Piper ded instance 1',24,false)
            addAnimationByPrefix('Piper','Attack','PeepAttack instance 1',24,false)
            addAnimationByPrefix('Piper','Pre-Attack','PipAttack instance 1',24,false)
            scaleObject('Piper',1.8,1.8)
            
            makeAnimatedLuaSprite('Striker','bendy/images/third/StrikerDespair',0 + StrikerOffsetX,getProperty('boyfriend.y') + StrikerOffsetY)
            addAnimationByPrefix('Striker','Walking','Str walk instance 1',24,true)
            addAnimationByPrefix('Striker','Hurt','Sticker  instance 1',24,false)
            addAnimationByPrefix('Striker','Dead','I ded instance 1',24,false)
            addAnimationByPrefix('Striker','Pre-Attack','PunchAttack_container instance 1',24,false)
            addAnimationByPrefix('Striker','Attack','regeg instance 1',24,false)
            addAnimationByPrefix('Striker','Idle','strrr instance 1',24,false)
            scaleObject('Striker',1.8,1.8)



            AttackEnable = false
        end
    end
    if songName == 'Last-Reel' or songName == 'Despair' then
        removeLuaScript('custom_notetypes/BendySplashNote')
        makeAnimatedLuaSprite('AttackButton','IC_Buttons',50,300)
        addAnimationByPrefix('AttackButton','Static','Attack instance 1',24,true)
        addAnimationByPrefix('AttackButton','NA','AttackNA instance 1',30,false)
        objectPlayAnimation('AttackButton','Static',true)
        setObjectCamera('AttackButton','hud')
        addLuaSprite('AttackButton',false)
        scaleObject('AttackButton',0.6,0.6)
        setProperty('AttackButton.alpha',0.5)

    
        makeLuaSprite('SplashScreen1','bendy/images/Damage01',0,0)
        scaleObject('SplashScreen1',0.7,0.7)

        makeLuaSprite('SplashScreen2','bendy/images/Damage02',0,0)
        scaleObject('SplashScreen2',0.7,0.7)

        makeLuaSprite('SplashScreen3','bendy/images/Damage03',0,0)
        scaleObject('SplashScreen3',0.7,0.7)

        makeLuaSprite('SplashScreen4','bendy/images/Damage04',0,0)
        scaleObject('SplashScreen4',0.7,0.7)

        setObjectCamera('SplashScreen1','other')
        setObjectCamera('SplashScreen2','other')
        setObjectCamera('SplashScreen3','other')
        setObjectCamera('SplashScreen4','other')
        
        enableAttack = true
    end
end

function onUpdate(elapsed)

    if enableAttack then
        if (SplashDamage == 1) then
            addLuaSprite('SplashScreen1', true)
        
        elseif (SplashDamage == 2) then
            removeLuaSprite('SplashScreen1', false)
            addLuaSprite('SplashScreen2', true)
        
        elseif (SplashDamage == 3) then
            removeLuaSprite('SplashScreen2', false)
            addLuaSprite('SplashScreen3', true)
        
        elseif (SplashDamage == 4) then
            removeLuaSprite('SplashScreen3', false)
            addLuaSprite('SplashScreen4', true)

        elseif (SplashDamage >= 5) then
            setProperty('health', -1)
            removeLuaSprite('SplashScreen4', false)
        end
    
        if (SplashEffect < 1) then
            SplashEffect = SplashEffect - 0.01
        end
        if (SplashEffect <= 0) then
            SplashEffect = 1
            SplashDamage = 0
            removeLuaSprite('SplashScreen1', false)
            removeLuaSprite('SplashScreen2', false)
            removeLuaSprite('SplashScreen3', false)
            removeLuaSprite('SplashScreen4', false)
        end
        if difficulty ~= 0 then
            if PiperHP == 0 then
                playSound('bendy/butcherSounds/Dead')
                objectPlayAnimation('Piper','Dead',false)
                PiperX = false
                PiperHP = -1
            end

            if StrikerHP == 0 then
                playSound('bendy/butcherSounds/Dead')
                objectPlayAnimation('Striker','Dead',false)
                StrikerX = false
                StrikerHP = -1
            end
        end

        if StopAnim == 2 then
            for i = 0,getProperty('notes.length') do 
                if getPropertyFromGroup('notes', i,'mustPress') == true then
                    setPropertyFromGroup('notes', i, 'noAnimation',true)
                end
            end
        elseif StopAnim == 1 then
            for i = 0,getProperty('notes.length') do 
                if getPropertyFromGroup('notes', i,'mustPress') == true then
                    setPropertyFromGroup('notes', i, 'noAnimation',false)
                end
            end
            StopAnim = 0
        end
        if StopAnim == 2 then
            if getProperty('boyfriend.animation.curAnim.name') == 'attack' and BFBendy_Attacking and getProperty('boyfriend.animation.curAnim.finished') or getProperty('boyfriend.animation.curAnim.name') == 'attack2' and BFBendy_Attacking and getProperty('boyfriend.animation.curAnim.finished') or getProperty('boyfriend.animation.curAnim.name') ~= 'attack' and getProperty('boyfriend.animation.curAnim.name') ~= 'attack2' and BFBendy_Attacking then
                BFBendy_Attacking = false
                StopAnim = 1
                StopAnimName = ''
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'dodge' and BFBendy_Dodge and getProperty('boyfriend.animation.curAnim.finished') or getProperty('boyfriend.animation.curAnim.name') ~= 'dodge' and BFBendy_Dodge then
                StopAnim = 1
                BFBendy_Dodge = false
                StopAnimName = ''
            end
            if getProperty('boyfriend.animation.curAnim.name') ~= StopAnimName then
                StopAnim = 1
            end
        end
    end

    if (AttackEnable) then

        if (PiperSpawn > 0) then
            PiperSpawn = PiperSpawn - 1
        end
        if (StrikerSpawn > 0) then
            StrikerSpawn = StrikerSpawn - 1
        end

        if (PiperSpawn == 0) then
            setProperty('Piper.x', screenWidth + PiperOffsetX)
            setProperty('Piper.y', getProperty('boyfriend.y') + PiperOffsetY)
            PiperHP = 3
            addLuaSprite('Piper', false)
            setObjectOrder('Piper', 14)
            PiperX = false
            PiperSpawn = -1
        end

        if (StrikerSpawn == 0) then
            addLuaSprite('Striker', false)
            setProperty('Striker.x', 0 + StrikerOffsetX)
            setProperty('Striker.y', getProperty('boyfriend.y') + StrikerOffsetY)
            setObjectOrder('Striker', 14)
            StrikerHP = 3
            StrikerX = false
            StrikerSpawn = -1
        end

        if (StrikerHP > 0 and StrikerX == true) then
            if (StrikerAttack < StrikerAttackTimeMax) then
                StrikerAttack = StrikerAttack + 1
            end
            if (StrikerAttack == StrikerAttackTimeMax and StrikerAttacking == false) then
                Dodge2 = 2
                objectPlayAnimation('Striker','Pre-Attack',false)

                StrikerAttacking = true
            end
        end

        if (PiperHP > 0 and PiperX == true and PiperAttacking == false) then
            if (PiperAttack < PiperAttackTimeMax) then
                PiperAttack = PiperAttack + 1
            end
            if (PiperAttack == PiperAttackTimeMax) then
                Dodge1 = 2
                objectPlayAnimation('Piper','Pre-Attack',false)
                PiperAttacking = true

            end
        end
        if PiperHP > 1 then
            if getProperty('Piper.x') > getProperty('boyfriend.x') + PiperBFX and PiperX == false and PiperHP > 0 then
                objectPlayAnimation('Piper','Walking',false)
                setProperty('Piper.x',getProperty('Piper.x') - 1)
            end

            if getProperty('Piper.x') <= getProperty('boyfriend.x') + PiperBFX and PiperX == false and PiperHP > 0 then
                PiperX = true
                objectPlayAnimation('Piper','Idle',false)
                PiperAttack = PiperAttackTimeMax
            end
        end
        if StrikerHP > 1 then
            if getProperty('Striker.x') < getProperty('boyfriend.x') + StrikerBFX and StrikerX == false and StrikerHP > 0 then
                objectPlayAnimation('Striker','Walking',false)
                setProperty('Striker.x',getProperty('Striker.x') + 3)
            end

            if getProperty('Striker.x') >= getProperty('boyfriend.x') + StrikerBFX and StrikerX == false and StrikerHP > 0 then
                StrikerX = true
                objectPlayAnimation('Striker','Idle',false)
                StrikerAttack = StrikerAttackTimeMax
            end
        end



        if (getPropertyFromClass('flixel.FlxG', 'keys.pressed.SHIFT') and getProperty('AttackButton.animation.curAnim.name') == 'Static' and BFBendy_Attacking == false) then

            if (keyPressed('left') or not keyPressed('right') and not keyPressed('left') and (PiperX == false and StrikerX == true))  then

                objectPlayAnimation('AttackButton','NA',false)
                setProperty('AttackButton.y',getProperty('AttackButton.y') - 35)

                

                characterPlayAnim('boyfriend','attack',true)
                setProperty('boyfriend.specialAnim',true)
                StopAnim = 2
                StopAnimName = 'attack'

                BFBendy_Attacking = true

                if (StrikerX == true) then
                    objectPlayAnimation('Striker','Hurt',true)
                    StrikerAttacking = false
                    Dodge2 = 0

                    StrikerAttack = StrikerAttack - 100
                    StrikerHP = StrikerHP - 1
                      
                    playSound('bendy/butcherSounds/Hurt0' ..math.random(1,2))
                end
            
            elseif (keyPressed('right') or not keyPressed('right') and not keyPressed('left') and (StrikerX == false and PiperX == true)) then

                objectPlayAnimation('AttackButton','NA',false)
                setProperty('AttackButton.y',getProperty('AttackButton.y') - 35)

                characterPlayAnim('boyfriend','attack2',true)
                setProperty('boyfriend.specialAnim',true)
                StopAnim = 2
                StopAnimName = 'attack2'
                
                
                BFBendy_Attacking = true

                if (PiperX == true) then
                    PiperAttacking = false
                    Dodge1 = 0

                    PiperAttack = PiperAttack - 100
                    PiperHP = PiperHP - 1

                    objectPlayAnimation('Piper', 'Hurt', true)
                    playSound('bendy/butcherSounds/Hurt0' ..math.random(1,2), 50)
                end
            end
        end


        if keyJustPressed('space') and Dodge1 == 2 or Dodge1 == 2 and botPlay then
         Dodge1 = 1
        end

        
        if keyJustPressed('space') and Dodge2 == 2 or Dodge2 == 2 and botPlay then
            Dodge2 = 1
        end


        if getProperty('Piper.animation.curAnim.finished') == true then

            if getProperty('Piper.animation.curAnim.name') == 'Dead' then
                removeLuaSprite('Piper', false)
                if (AttackEnable) then
                    if PiperSpawn == -1 then
                        PiperSpawn = math.random(600,800)
                    end
                end
            end
        
            if getProperty('Piper.animation.curAnim.name') == 'Attack' then
                PiperAttacking = false
                objectPlayAnimation('Piper','Idle',false)
            end

            if  getProperty('Piper.animation.curAnim.name') == 'Hurt' then
                objectPlayAnimation('Piper','Idle',false)
            end

            if (getProperty('Piper.animation.curAnim.name') == 'Pre-Attack') then
                PiperAttack = 0  
                objectPlayAnimation('Piper', 'Attack', false)

                if (Dodge1 == 2) then
                    SplashDamage = SplashDamage + 1
                    playSound('bendy/inked')
                    characterPlayAnim('boyfriend','hurt',true)
                    setProperty('boyfriend.specialAnim',true)
                    runTimer('SplashDestroy',2)
                    SplashEffect = 1
                
                elseif (Dodge1 == 1) then
                    Dodge1 = 0

                    characterPlayAnim('boyfriend', 'dodge', true)
                    setProperty('boyfriend.specialAnim',true)
                    StopAnim = 2
                    StopAnimName = 'dodge'
                    BFBendy_Dodge = true
                end
            end
        end

        if getProperty('Striker.animation.curAnim.finished') == true then

            if getProperty('Striker.animation.curAnim.name') == 'Dead' then
                removeLuaSprite('Striker',false)
                if (AttackEnable) then
                    if (StrikerSpawn == -1) then
                        StrikerSpawn = math.random(600,800)
                    end
                end
            end
        
            if getProperty('Striker.animation.curAnim.name') == 'Attack' then
                StrikerAttacking = false
                objectPlayAnimation('Striker','Idle',false)
            end

            if  getProperty('Striker.animation.curAnim.name') == 'Hurt' then
                objectPlayAnimation('Striker','Idle',false)
            end

            if getProperty('Striker.animation.curAnim.name') == 'Pre-Attack' then
                StrikerAttack = 0
                objectPlayAnimation('Striker','Attack',false)
    
                if (Dodge2 == 2) then
                    SplashDamage = SplashDamage + 1
                    playSound('bendy/inked')
                    characterPlayAnim('boyfriend','hurt',true)
                    setProperty('boyfriend.specialAnim',true)
                    runTimer('SplashDestroy',2)
                    SplashEffect = 1

                elseif (Dodge2 == 1) then
                    Dodge2 = 0
                    characterPlayAnim('boyfriend', 'dodge', true)
                    setProperty('boyfriend.specialAnim',true)
                    StopAnim = 2
                    StopAnimName = 'dodge'
                    BFBendy_Dodge = true
                    
                end
            end
        end
    end
    --CameraEffect
    if (getProperty('Piper.animation.curAnim.name') == 'Pre-Attack' or getProperty('Striker.animation.curAnim.name') == 'Pre-Attack' and BFBendy_Attacking == false) or (getProperty('Striker.animation.curAnim.name') == 'Pre-Attack' or getProperty('Striker.animation.curAnim.name') == 'Pre-Attack' and BFBendy_Attacking == false)then

        doTweenZoom('AttackZoom', 'camGame', '0.8', '1.5', 'QuintOut')
        cameraSetTarget('bf')
        CameraEffect = true
    end
    if CameraEffect then
        if (getProperty('Striker.animation.curAnim.name') ~= 'Pre-Attack' and getProperty('Piper.animation.curAnim.name') ~= 'Pre-Attack' or not AttackEnable) then
            CameraEffect = false
            doTweenZoom('AttackZoom', 'camGame', getProperty('defaultCamZoom'), '1.5', 'QuintOut')
            if not mustHitSection and not gfSection then
                cameraSetTarget('dad')
            end
        end
    end
    --Animation fix
    if getProperty('Piper.animation.curAnim.name') == 'Idle' then
        setProperty('Piper.offset.x',0)
        setProperty('Piper.offset.y',40)
    end

    if getProperty('Piper.animation.curAnim.name') == 'Walking' then
        setProperty('Piper.offset.x',100)
        setProperty('Piper.offset.y',40)
    end

    if getProperty('Piper.animation.curAnim.name') == 'Attack' then
        setProperty('Piper.offset.x',350)
        setProperty('Piper.offset.y',250)
    end
    
    if getProperty('Piper.animation.curAnim.name') == 'Pre-Attack' then
        setProperty('Piper.offset.x',70)
        setProperty('Piper.offset.y',90)
    end

    if getProperty('Piper.animation.curAnim.name') == 'Hurt' then
        setProperty('Piper.offset.x',120)
        setProperty('Piper.offset.y',200)
    end
    if getProperty('Piper.animation.curAnim.name') == 'Dead' then
        setProperty('Piper.offset.x',120)
        setProperty('Piper.offset.y',180)
    end


    
    if getProperty('Striker.animation.curAnim.name') == 'Idle' then
        setProperty('Striker.offset.x',0)
        setProperty('Striker.offset.y',40)
    end

    if getProperty('Striker.animation.curAnim.name') == 'Walking' then
        setProperty('Striker.offset.x',0)
        setProperty('Striker.offset.y',40)
    end

    if getProperty('Striker.animation.curAnim.name') == 'Attack' then
        setProperty('Striker.offset.x',0)
        setProperty('Striker.offset.y',40)
    end
    
    if getProperty('Striker.animation.curAnim.name') == 'Pre-Attack' then
        setProperty('Striker.offset.x',20)
        setProperty('Striker.offset.y',47)
    end

    if getProperty('Striker.animation.curAnim.name') == 'Hurt' then
        setProperty('Striker.offset.x',150)
        setProperty('Striker.offset.y',120)
    end

    if getProperty('Striker.animation.curAnim.name') == 'Dead' then
        setProperty('Striker.offset.x',120)
        setProperty('Striker.offset.y',120)
    end
    --Attack Button Animation
    if getProperty('AttackButton.animation.curAnim.finished') == true then
        attackTimer = 0
        objectPlayAnimation('AttackButton','Static',true)
        setProperty('AttackButton.y',getProperty('AttackButton.y') + 35)
    end

    setProperty('SplashScreen1.alpha', SplashEffect)
    setProperty('SplashScreen2.alpha', SplashEffect)
    setProperty('SplashScreen3.alpha', SplashEffect)
    setProperty('SplashScreen4.alpha', SplashEffect)


end
    
    
function onStepHit()
    if (curStep % 2 == 0) then
        if getProperty('Piper.animation.curAnim.name') == 'Idle' then
            objectPlayAnimation('Piper', 'Idle', false)
        end
        if getProperty('Striker.animation.curAnim.name') == 'Idle' then
            objectPlayAnimation('Striker', 'Idle', false)
        end
    end
end

function goodNoteHit(id, noteData, noteType, isSustainNote)
	if (noteType == 'BendySplashNote') and enableAttack then
		-- put something here if you want
		playSound('bendy/inked')
		SplashDamage = SplashDamage + 1
		SplashEffect = 1
		runTimer('SplashDestroy', 2)
	end
end

function onTimerCompleted(tag)
	if (tag == 'SplashDestroy') then
		SplashEffect = SplashEffect - 0.1
	end
end

function onStepHit()
    if (curStep % 2 == 0) then
        if getProperty('Piper.animation.curAnim.name') == 'Idle' then
            objectPlayAnimation('Piper','Idle',false)
        end
        if getProperty('Striker.animation.curAnim.name') == 'Idle' then
            objectPlayAnimation('Striker','Idle',false)
        end
    end
    if difficulty ~= 0 then
        if (curStep >= 1664 and curStep < 1670 and songName == 'Last-Reel') then
            PiperHP = 0
            StrikerHP = 0
            AttackEnable = false
        end
        if songName == 'Despair' then
            if curStep == 1355 or curStep == 2064 or curStep == 3215 then
                AttackEnable = true
                PiperHP = 3
                StrikerHP = 3
            end
            if curStep == 1680 or curStep == 3023 or curStep == 3912 then
                PiperHP = 0
                StrikerHP = 0
                AttackEnable = false
            end
        end
    end
end


