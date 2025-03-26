#Requires AutoHotkey v2.0
#SingleInstance Force
#Include config/vars.ahk
#Include config/_varP.ahk

#Include scripts/UIControls.ahk
#Include scripts/Signin.ahk
#Include scripts/CharacterControls.ahk


screens := group1
global hotkeysActive := True


#SuspendExempt
^F9::Toggle(hotkeysActive)

#SuspendExempt False
^F12::WindowSettup()
^F11::Signin()

^F1::SetAssist()
+f::FollowSelectedCharacter()
^2::Blast()
^3::Heals()
^+1::AcceptQuest()
^+Escape::camp()
^+p::party()
x:=2
^7::Test()
^+b::BuffsUp()
^+t::BuffsUptes()

Test() {
    ControlSend('{F' . x . '}',, "walldough")
}


KeyWait() {
    Sleep(Random(10,100))
}

BuffsUptes() {
    SetKeyDelay 15, 15
    For name, data in screens.OwnProps() {
       if (data.buffs.party.Length > 0) {
            buffIndex := 1
            Loop data.buffs.party.Length {
                i := 0
                For target, targetData in screens.OwnProps() {
                    i := i + 1
                    MsgBox('{F' . i . '}   ' . name . "   " . data.buffs.party[buffIndex])
                    KeyWait()
                    Sleep(220)
                }
                buffIndex := buffIndex + 1
            }
            
        }
        ;Loop data.buffs.self.Length {
        ;    ControlSend(data.buffs.self[A_Index],,name)
        ;    Sleep(2200)
        ;}
    }
}