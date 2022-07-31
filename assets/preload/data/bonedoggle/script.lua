PapyrusAlt = false
SansAltAnimation = false
function onUpdate()

	if curStep >= 192 then
		if not middlescroll then
			noteTweenX('NoteMove1',0, 416 ,1,'QuartOut')
			noteTweenX('NoteMove2',1, 528 ,1,'QuartOut')
			noteTweenX('NoteMove3',2, 637 ,1,'QuartOut')
			noteTweenX('NoteMove4',3, 743 ,1,'QuartOut')
			noteTweenX('NoteMove5',4, 849 ,2,'QuartOut')
			noteTweenX('NoteMove6',5, 958 ,2,'QuartOut')
			noteTweenX('NoteMove7',6, 1065 ,2,'QuartOut')
			noteTweenX('NoteMove8',7, 1170 ,2,'QuartOut')
		end
	end

end

function onStepHit()
	if getProperty('gf.curCharacter') == 'Papyrus_IC' and PapyrusAlt then
		if PapyrusAlt and getProperty('girlfriend.animation.curAnim.name') ~= 'idle-alt' or PapyrusAlt and curStep % 2 == 0 and getProperty('girlfriend.animation.curAnim.name') == 'idle-alt' then 
		characterPlayAnim('girlfriend','idle-alt',false)
		setProperty('gf.specialAnim',true)
		end
	end
	if curStep == 811 or curStep == 352 then
		PapyrusAlt = true
	end
	if curStep == 811 or curStep == 384 then
		PapyrusAlt = false
	end

	if SansAltAnimation and getProperty('dad.animation.curAnim.name') == 'idle' or SansAltAnimation and curStep % 6 == 0 and getProperty('dad.animation.curAnim.name') == 'idle-alt' then 
		characterPlayAnim('dad','idle-alt',true)
		setProperty('dad.specialAnim',true)
	end
    if curStep == 770  then
		SansAltAnimation = true
	end
	if curStep == 812 then
		SansAltAnimation = false
	end
	if curStep == 1244 then
		setProperty('camHUD.visible',false)
	end
end