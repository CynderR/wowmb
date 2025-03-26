#Requires AutoHotkey v2.0
FollowSelectedCharacter() {

    UI.BackColor := "FF0000"
    characterToFollow := WinGetTitle("A")
    SetKeyDelay 15, 15

    For name, data in screens.OwnProps() {
        if (name != characterToFollow) {
            WinActivate(name)
            KeyWait()
            SendEvent("{/}follow " . characterToFollow)
            KeyWait()
            Send('{Enter}')
        }
    }
    WinActivate(characterToFollow)
    UI.BackColor := "FFFF00"
}

Blast() {
      UI.BackColor := "FF0000"
    For name, data in screens.OwnProps() {
        ControlSend("2",, name)
    }
    UI.BackColor := "FFFF00"

}
Heals() {
      UI.BackColor := "FF0000"
    For name, data in screens.OwnProps() {
        ControlSend("3",, name)
    }
    UI.BackColor := "FFFF00"

}


SetAssist() {
    UI.BackColor := "FF0000"
    characterToFollow := WinGetTitle("A")
    SetKeyDelay 15, 15
    For name, data in screens.OwnProps() {
        if (name != characterToFollow) {         
            ControlSend("{/}focus " . characterToFollow . "{Enter}", , name)
        }
    }
    UI.BackColor := "FFFF00"

}

AcceptQuest() {
    UI.BackColor := "FF0000"
    characterTo := WinGetTitle("A")
    SetKeyDelay 15, 15
    For name, data in screens.OwnProps() {
        if (name != characterTo) {
        WinActivate(name)
        KeyWait()
        SendEvent("{/}assist " . characterTo)
        KeyWait()
        Send('{Enter}')
        KeyWait()
        Send('^{\}')
        }
    }
    WinActivate(characterTo)

    UI.BackColor := "FFFF00"

}

camp(){
      UI.BackColor := "FF0000"
    SetKeyDelay 15, 15
    For name, data in screens.OwnProps() {
        WinActivate(name)
        KeyWait()
        SendEvent("{/}quit")
        KeyWait()
    }
    UI.BackColor := "FFFF00"
}

party() {
    SetAssist()
    UI.BackColor := "FF0000"
    characterTo := WinGetTitle("A")
    SetKeyDelay 15, 15
    For name, data in screens.OwnProps() {
        KeyWait()
        SendEvent("{/}invite " . name)
        KeyWait()
        Send('{Enter}')
        KeyWait()
    }
    for name, data in screens.OwnProps() {
        WinActivate(name)
        SendEvent('/run AcceptGroup()')
        Send('{Enter}')
        KeyWait()
    }
    WinActivate(characterTo)
    UI.BackColor := "FFFF00"
}

BuffsUp() {
    SetKeyDelay 15, 15
    For name, data in screens.OwnProps() {
        if (data.buffs.party.Length > 0) {
            buffIndex := 1
            Loop data.buffs.party.Length {
                i := 0
                For target, targetData in screens.OwnProps() {
                    i := i + 1
                    ControlSend('{F' . i . '}',, name)
                    KeyWait()
                    ControlSend(data.buffs.party[buffIndex],, name)
                    Sleep(2200)
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