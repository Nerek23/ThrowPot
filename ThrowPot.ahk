#SingleInstance force

Paused := false
SendQ := 1

Gui, Add, Text, , Settings
Gui, Add, Text, , [F] Delay:
Gui, Add, Edit, vFWaitTime, 100
Gui, Add, Checkbox, vSendQ, ThrowPot 
Gui, Add, Button, gGuardarConfig, Save 

Gui, Show, w250 h125, Made by Nerek
return

~F:: 
    global n
    if (!Paused) {
        n := (n = "") ? 2 : (n >= 9) ? 2 : n + 1 
        Sleep, %FWaitTime%
		Send, %n%
        Sleep, %FWaitTime%
        Click right  
        Sleep, 30
        if (SendQ)
            Send, q
        Sleep, 100
        Send, 1
    }
return

~E:: 
    if (!Paused) {
        global n
        n := 1  
    }
return

GuardarConfig:
    Gui, Submit, NoHide
    SendQ := (SendQ = "0") ? 1 : 0
return

GuiClose:
    ExitApp

~T:: 
    Paused := true
return

~Enter:: 
~Esc:: 
~F6:: 
    if (Paused) {
        Paused := false
    }
return
