#Requires AutoHotkey v2.0


MoveWindow(data, name) {
    WinMove( data.x, data.y, data.w, data.h, name)
}

Signin() {
    For name, data in ac1.OwnProps() {
        WinActivate(name)
        KeyDelay()
        Send data.u
        KeyDelay()
        Send A_Tab
        KeyDelay()
        Send data.p
        sleep(4000)
        Send('{Enter}')
    }
    KeyDelay()
    SelectCharacter()
}

WindowSettup() {
    For name, data in screens.OwnProps() {
        OpenWindowRename(name)
        Sleep 1000
        WinActivate(name)
        MoveWindow(data, name)
    }
     Sleep 1000
     Signin()
}

OpenWindowRename(name) {
    Run('C:\Program Files (x86)\World of Warcraft 3.3.5a\wow.exe')
    Sleep 3000
    if WinWait("World of Warcraft", , 10)
        WinSetTitle(name, "World of Warcraft")
    else
        MsgBox "Timeout. 1000 might be too slow"
}

SelectCharacter() {
    For name, data in screens.OwnProps() {
        WinActivate(name)
        sleep(1000)
        Send('{Enter}')
    }
}


