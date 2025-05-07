#Requires AutoHotkey v2.0


FollowSelectedCharacter() {
    UI.BackColor := "FF0000"
    characterTo := WinGetTitle("A")
    SetKeyDelay 30, 15
    if (isCharacter(characterTo)) {
        filteredScreens := FilterOutCharacter(screens, characterTo)
        SendTextMany("{/}follow " . characterTo . "{Enter}", filteredScreens)
    }
    UI.BackColor := "FFFF00"
}

StopFollowSelectedCharacter(){
    characterTo := WinGetTitle("A")
    SetKeyDelay 15, 15
    if (isCharacter(characterTo)) {
        For name, data in screens.OwnProps() {
            if (name != characterTo) {
                ControlSend("s",, name)
                KeyDelay()
            }
        }
    }
}

FrostNova() {
    UI.BackColor := "FF0000"
    For name, data in screens.OwnProps() {
        if (data.class == 'mage' ) {
            ControlSend(data.blast.fnova,, name)
        }
    }
    UI.BackColor := "FFFF00"
}

blastName(spell) {
    UI.BackColor := "FF0000"
    For name, data in screens.OwnProps() {
        if (data.role == 'dps' ) {
            if (data.HasOwnProp("blast") && data.blast.HasOwnProp(spell)) {
          
                spellKey := data.blast.%spell%  ; First get the property using dynamic access
                ControlSend(spellKey,, name)    ; Then use the value
            }
        }
    }
    UI.BackColor := "FFFF00"
}

Blast() {
    UI.BackColor := "FF0000"
    For name, data in screens.OwnProps() {
        if (data.role == 'dps' ) {
            if (data.HasOwnProp("blast") && data.blast.HasOwnProp("long")) {
                ControlSend(data.blast.long,, name)
            }
        }
    }
    UI.BackColor := "FFFF00"
}

Opener() {
    UI.BackColor := "FF0000"
    For name, data in screens.OwnProps() {
        if (data.HasOwnProp("blast") && data.blast.HasOwnProp("opener")) {
            ControlSend(data.blast.opener,, name)
        }
    }
    UI.BackColor := "FFFF00"
}



Drink() {
    UI.BackColor := "FF0000"
    For name, data in screens.OwnProps() {
        ControlSend(data.drink,, name)
    }
    UI.BackColor := "FFFF00"
}

TargetClear(){
    UI.BackColor := "FF0000"
    characterTo := WinGetTitle("A")
    SetKeyDelay 15, 15
    if (isCharacter(characterTo)) {
        For name, data in screens.OwnProps() {
            if (name != characterTo) {         
                ControlSend("{F1}", , name)
            }
        }
    }
    UI.BackColor := "FFFF00"  
}

PassThru(key) {
    SetKeyDelay 15, 15
    For name, data in screens.OwnProps() {
        ControlSend("{" . key . " down}",, name)
    }
    
    KeyWait key, "U"  ; Wait for the key to be released
    
    For name, data in screens.OwnProps() {
        ControlSend("{" . key . " up}",, name)
    }
}

SetAssist() {
    UI.BackColor := "FF0000"
    characterTo := WinGetTitle("A")
    SetKeyDelay 15, 15
    if (isCharacter(characterTo)) {
        For name, data in screens.OwnProps() {
            if (name != characterTo) {         
                ControlSend("{/}focus " . characterTo . "{Enter}", , name)
            }
        }
    }
    UI.BackColor := "FFFF00"
}

AcceptQuest() {
    ; Dont forget to set up interact with target as ctrl =
    UI.BackColor := "FF0000"
    characterTo := WinGetTitle("A")
    SetKeyDelay 15, 15
    if (isCharacter(characterTo)) {
        For name, data in screens.OwnProps() {
            if (name != characterTo && data.accept) {
                ControlSend("{/}assist focus{Enter}", , name)
                KeyDelay()
                ControlSend("{\}", , name)
                KeyDelay()
                ControlSend(data.accept, , name)
                KeyDelay()
            }
        }
    }

    UI.BackColor := "FFFF00"

}

camp(){
      UI.BackColor := "FF0000"
    SetKeyDelay 15, 15
    For name, data in screens.OwnProps() {
        ControlSend("{/}quit {Enter}",, name)
        KeyDelay()
    }
    UI.BackColor := "FFFF00"
}

party() {
    UI.BackColor := "FF0000"
    characterTo := WinGetTitle("A")
    SetKeyDelay 15, 15
    if (isCharacter(characterTo)) {
        For name, data in screens.OwnProps() {
            if (name != characterTo) {
                ControlSend("{/}invite " . name . "{Enter}",, characterTo)
            }
        }
        KeyDelay()

        For name, data in screens.OwnProps() {
            if (characterTo != name) {
                ControlSend('{/}run AcceptGroup() {Enter}',, name)
            }
        }
        KeyDelay()
        SetAssist()
    }
    UI.BackColor := "FFFF00"
}


BuffsUp() {
    SetKeyDelay 15, 15
    For name, data in screens.OwnProps() {
        buffLoop(data, name)
    }
}

buffLoop(details, caster) {
    if (details.buffs.party.Length > 0) {
        buffIndex := 0
        While (buffIndex< details.buffs.party.Length) {
            buffIndex := buffIndex + 1
            i := 0
            For target, targetData in screens.OwnProps() {
                i := i + 1
                if (details.buffs.party.Length > 0) {
                    ControlSend('{F' . i . '}',, caster)
                    KeyDelay()
                    hotkey := details.buffs.party[buffIndex]
                    ControlSend(hotkey,, caster)
                    Sleep(2200)
                }
            }
        }
    }
    if (details.buffs.self.Length > 0) {
        bi := 0
        While (bi < details.buffs.self.Length) {   
            bi := bi + 1
            ;MsgBox(details.buffs.self.Length . '  ' . caster)
            hotkey := details.buffs.self[bi]
            ControlSend(hotkey,, caster)    
            Sleep(2200)
        }
    }
      
}


; Function to find the first "heal" role
FindFirstHealRole(group) {
    For name, data in group.OwnProps() {
        if (data.role = "heal") {
            return name
        }
    }
    return ""
}
FindFirstHealerData(group) {
    for name, data in group.OwnProps() {
        if (data.role = "heal") {
            return data
        }
    }
    return ""
}

TargetMainCast(key, caster) {
    ControlSend('{F2}',, caster)
    KeyDelay()
    ControlSend(key,, caster)
    KeyDelay()
}

TargetCast(caster, targetFkey, key) {
    ControlSend(targetFkey,, caster)
    KeyDelay()
    ControlSend(key,, caster)
}


isCharacter(name) {
   For n, d in screens.OwnProps() {
        if (name == n) {
            return True
        }
    }
    return False
}

Space(){
    For name, data in screens.OwnProps() {
        ControlSend('{Space}',, name)
    }
}


global currentSheepMageIndex := 1
global mageList := []

; Function to initialize the mage list (call this when loading screens)
InitializeMageList() {
    global mageList := []
    For name, data in screens.OwnProps() {
        if (data.class == "mage" && data.HasOwnProp("sheep")) {
            mageList.Push({name: name, key: data.sheep})
        }
    }
    global currentSheepMageIndex := 1
}

; Function to cast sheep with the next mage in rotation
RotatingSheep() {
    global currentSheepMageIndex, mageList
    
    UI.BackColor := "FF0000"
    
    ; Initialize mage list if it's empty
    if (mageList.Length == 0) {
        InitializeMageList()
    }
    
    ; Check if we have any mages with sheep ability
    if (mageList.Length == 0) {
        UI.BackColor := "FFFF00"
        return
    }
    
    ; Get the current mage's info
    currentMage := mageList[currentSheepMageIndex]
    ;MsgBox(currentMage.name)
    ; Cast sheep with the current mage
    ControlSend(currentMage.key,, currentMage.name)
    KeyDelay()
    ControlSend("{F1}", , currentMage.name)
    KeyDelay()

    ; Move to the next mage in the rotation
    currentSheepMageIndex++
    if (currentSheepMageIndex > mageList.Length) {
        currentSheepMageIndex := 1
    }
    
    UI.BackColor := "FFFF00"
}



SimpleKeyPress(aKey) {
    UI.BackColor := "FF0000"
    SetKeyDelay 15, 15
    For name, data in screens.OwnProps() {
        if (data.HasOwnProp(aKey)) {
            aKeyKey := data.%aKey%  ; Use dynamic property access with %variable%
            ControlSend(aKeyKey,, name)
        }
    }
    UI.BackColor := "FFFF00"
}

Blizzard() {
    UI.BackColor := "FF0000"
    characterTo := WinGetTitle("A")
    SetKeyDelay 15, 15
    if (isCharacter(characterTo)) {
        ; Get the current mouse position relative to the active window
        WinGetPos &activeX, &activeY, &activeW, &activeH, characterTo
        MouseGetPos &mouseX, &mouseY
        
        ; Calculate relative position (percentage) within the active window
        relativeX := (mouseX - activeX) / activeW
        relativeY := (mouseY - activeY) / activeH
        list := screens
        for name, data in screens.OwnProps() {
            if (name != characterTo) {
                ; Check if blast property exists and has a blizzard property
                if (data.HasOwnProp("blast") && data.blast.HasOwnProp("blizzard")) {
                    ; Get the target window's position and size
                    WinGetPos &targetX, &targetY, &targetW, &targetH, name
                    
                    ; Calculate the absolute position in the target window
                    targetMouseX := targetX + (relativeX * targetW)
                    targetMouseY := targetY + (relativeY * targetH)
                    
                    ; Send the blizzard hotkey
                    ControlSend(data.blast.blizzard,, name)
    
                } else {
                    list := FilterOutCharacter(list, name)
                }
            }
        }

        Sleep(100)  ; Give time for the spell to activate
        for name, data in list.OwnProps() {
            WinActivate name
            
                    Sleep(20)  ; Brief delay to ensure window activation
                    ControlClick("x" . Round(targetMouseX - targetX) . " y" . Round(targetMouseY - targetY), name)
                    Sleep(20)  ; Brief delay to ensure window activation                    
                    ; Click at the calculated position
                    ;Click targetMouseX, targetMouseY
                    ControlClick("x" . Round(targetMouseX - targetX) . " y" . Round(targetMouseY - targetY), name)
                    ;MsgBox("x" . Round(targetMouseX - targetX) . " y" . Round(targetMouseY - targetY))
        }
    }
    UI.BackColor := "FFFF00"
}

MouseMove() {
    UI.BackColor := "FF0000"
    characterTo := WinGetTitle("A")
    
    if (isCharacter(characterTo)) {
        ; Store the original mouse position
        MouseGetPos &originalX, &originalY
        
        ; Set up tracking loop
        SetTimer(MirrorMouseToAllWindows, 10)  ; Update every 10ms
        
        ; Wait for XButton1 & P to be released
        KeyWait "XButton1"
        
        ; Stop tracking
        SetTimer(MirrorMouseToAllWindows, 0)
        
        ; Return mouse to original position to prevent drift
        DllCall("SetCursorPos", "Int", originalX, "Int", originalY)
    }
    
    UI.BackColor := "FFFF00"
}

MirrorMouseToAllWindows() {
    static lastProcessedX := -1, lastProcessedY := -1
    
    characterTo := WinGetTitle("A")
    if (!isCharacter(characterTo)) {
        return
    }
    
    ; Get active window info
    WinGetPos &activeX, &activeY, &activeW, &activeH, characterTo
    
    ; Get current mouse position
    MouseGetPos &mouseX, &mouseY
    
    ; Only update if mouse has moved since last processed position
    if (mouseX == lastProcessedX && mouseY == lastProcessedY) {
        return
    }
    
    ; Save current position as processed
    lastProcessedX := mouseX
    lastProcessedY := mouseY
    
    ; Calculate relative position within active window
    relativeX := (mouseX - activeX) / activeW
    relativeY := (mouseY - activeY) / activeH
    
    ; Store current mouse position to restore later
    currentX := mouseX
    currentY := mouseY
    
    ; Mirror to all other windows
    for name, data in screens.OwnProps() {
        if (name != characterTo) {
            ; Get target window position and size
            WinGetPos &targetX, &targetY, &targetW, &targetH, name
            
            ; Calculate absolute position in target window
            targetMouseX := targetX + (relativeX * targetW)
            targetMouseY := targetY + (relativeY * targetH)
            
            ; Move mouse in target window without activating it
            BlockInput "On"  ; Prevent user input during cursor movement
            DllCall("SetCursorPos", "Int", Round(targetMouseX), "Int", Round(targetMouseY))
            Sleep(1)  ; Brief pause to allow cursor to move
            
            ; Return cursor to original window position
            DllCall("SetCursorPos", "Int", currentX, "Int", currentY)
            BlockInput "Off"  ; Re-enable user input
        }
    }
}

EmergencyCooldowns() {
    UI.BackColor := "FF0000"
    For name, data in screens.OwnProps() {
        if (data.HasOwnProp("emergency")) {
            ControlSend(data.emergency,, name)
            KeyDelay()
        }
    }
    UI.BackColor := "FFFF00"
}

GroupLoot() {
    UI.BackColor := "FF0000"
    characterTo := WinGetTitle("A")
    SetKeyDelay 15, 15
    
    if (isCharacter(characterTo)) {
        ; First, have all other characters assist the current character
        For name, data in screens.OwnProps() {
            if (name != characterTo) {
                ControlSend("{/}assist " . characterTo . "{Enter}", , name)
                KeyDelay()
                ; Then send the interact/loot key to all characters
                ControlSend(data.interact, , name)
                KeyDelay()
            }
        }
    }
    UI.BackColor := "FFFF00"
}

