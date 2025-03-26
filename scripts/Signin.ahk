#Requires AutoHotkey v2.0


MoveWindow(data, name) {
    WinMove( data.x, data.y, data.w, data.h, name)
}

Signin() {
    For name, data in ac1.OwnProps() {
        WinActivate(name)
        KeyWait()
        Send data.u
        KeyWait()
        Send A_Tab
        KeyWait()
        Send data.p
        sleep(4000)
        Send('{Enter}')
    }

    SelectCharacter()
}

WindowSettup() {
    For name, data in screens.OwnProps() {
        OpenWindowRename(name)
        MoveWindow(data, name)
    }
}

OpenWindowRename(name) {
    Run('C:\Program Files (x86)\World of Warcraft 3.3.5a\wow.exe')
    Sleep 1000
    if WinWait("World of Warcraft", , 3)
        WinSetTitle(name, "World of Warcraft")
    else
        MsgBox "Timeout. 1000 might be too slow"
}

SelectCharacter() {
    For name, data in screens.OwnProps() {
        WinActivate(name)
        
        Send('{Enter}')
    }
}