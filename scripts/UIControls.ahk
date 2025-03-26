#Requires AutoHotkey v2.0

UI := Gui("+Resize", "MultiBox Controls")
UI.BackColor := "FFFF00"
UI.Add("Text", "Section", "Its a Me, Super Macro!")

On := UI.Add('Button',"Default w80", "Enable")
On.OnEvent("Click", on_click)
Off := UI.Add('Button',"Default w80", "Disable")
Off.OnEvent("Click", off_click)
UI.Show()

Toggle(hotkeysActive){
    Suspend
    if (!A_IsSuspended) {
        UI.BackColor := "FFFF00"
    }
    else {
        UI.BackColor := "FF0000"
    }
}


on_click(*){
    if (A_IsSuspended){
        Suspend
        UI.BackColor := "FFFF00"
    }
}
off_click(*) {
    if (!A_IsSuspended){
        UI.BackColor := "FF0000"
        Suspend
    }
}
