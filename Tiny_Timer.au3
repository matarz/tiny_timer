#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=clock3.ico
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

If FileExists(@ScriptDir & "\Notify.wav") <> 1 Then
	;use your own path of where the sound file is so when you compile, the sound
	;file will be packaged with the exe file
	FileInstall("D:\Programming\GitHub\Tiny_Timer\Notify.wav", @ScriptDir & "\")
EndIf

;call movep() when key F2 is pressed
HotKeySet("{F2}", "movep")

$min = InputBox("Timer", "How long in minutes: ", "", "", 170, 130)
$min1 = $min
$sec = -1
Dim $pos[2]
$pos[0] = 0
$pos[1] = 0

While 1
	If $sec < 0 Then
		$sec = 59
		$min -= 1
	EndIf
	If $min < 0 Then
		SoundPlay(@ScriptDir & "\Notify.wav", 2)
		MsgBox(0, "Done", $min1 & " minutes have passed!", 3)
		Exit
	EndIf

	ToolTip($min & ":" & $sec, $pos[0], $pos[1])
	$sec = $sec - 1
	Sleep(1000)
WEnd

;changes the position of the countdown tooltip
Func movep()
	$pos = MouseGetPos()
EndFunc   ;==>movep
