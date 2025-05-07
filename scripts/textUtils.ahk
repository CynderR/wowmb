#Requires AutoHotkey v2.0

SortByCharacterName(screensArray) {
    sortedArray := []
    tempArray := Map()
    
    ; Create a map of character names to their original objects
    for characterName in screensArray.OwnProps() {
        tempArray[characterName] := screensArray.%characterName%
    }
    
    ; Get all character names and sort them
    names := []
    for name, value in tempArray {
        names.Push(name)
    }
    
    ; Sort the names array manually using StrCompare
    loop names.Length - 1 {
        i := A_Index
        loop names.Length - i {
            j := A_Index + i
            if (StrCompare(names[j], names[j-1]) < 0) {
                temp := names[j]
                names[j] := names[j-1]
                names[j-1] := temp
            }
        }
    }
    
    ; Create new object with sorted properties
    result := {}
    for name in names {
        result.%name% := tempArray[name]
    }
    
    return result
}

TargetCharacterByOrder(screensArray) {
    currentWindow := WinGetTitle("A")
    ;currentWindow := "zendarr"
    index := 0
    foundIndex := 0
    foundCharacter := ""
    
    ; Find the current character's index
    for characterName in screensArray.OwnProps() {
        index++
        if (InStr(currentWindow, characterName)) {
            foundIndex := index
            foundCharacter := characterName
            break
        }
    }
    
    ; If we found the character, reorder the array
    if (foundIndex > 0) {
        ; Create a new array with the found character first
        result := {}
        
        ; Add the found character first
        result.%foundCharacter% := screensArray.%foundCharacter%
        
        ; Add all other characters
        for characterName in screensArray.OwnProps() {
            if (characterName != foundCharacter) {
                result.%characterName% := screensArray.%characterName%
            }
        }
        
        return result
    }
    
    ; If no character was found, return the original array
    return screensArray
}


TargetMainCharacter(screensArray) {
    currentWindow := WinGetTitle("A")
    if (isCharacter(currentWindow)) {
        for characterName in screensArray.OwnProps() {
            ControlSend(TargetCharacter(characterName, screensArray),, characterName)
        }
    }
}

TargetCharacter(currentCharacter, screensArray) {
    currentWindow := WinGetTitle("A")
    if (currentCharacter == currentWindow) {
        return
    }
    newScreensArray := TargetCharacterByOrder(screensArray)
    index := 0
    foundIndex := 0
    ; Find the current character's index
    for characterName in newScreensArray.OwnProps() {
        index++
        if (InStr(currentWindow, characterName)) {
            foundIndex := index
            break
        }
    }
    return "{F" . foundIndex . "}"
}



SendTextMany(text, characterArray) {
    SetKeyDelay 1, 5
    if (IsObject(characterArray)) {
        ; Parse the text, respecting {} as special keys
        pos := 1
        while (pos <= StrLen(text)) {
            ; Check if we have a special key
            if (SubStr(text, pos, 1) = "{") {
                ; Find the closing brace
                endPos := InStr(text, "}", , pos)
                if (endPos) {
                    ; Extract the special key including braces
                    specialKey := SubStr(text, pos, endPos - pos + 1)
                    ; Send the special key to all characters
                    for characterName, characterData in characterArray.OwnProps() {
                        ControlSend(specialKey,, characterName)
                    }
                    ; Move position past the special key
                    pos := endPos + 1
                } else {
                    ; No closing brace found, treat as normal character
                    for characterName, characterData in characterArray.OwnProps() {
                        ControlSend(SubStr(text, pos, 1),, characterName)
                    }
                    pos++
                }
            } else {
                ; Regular character
                for characterName, characterData in characterArray.OwnProps() {
                    ControlSend(SubStr(text, pos, 1),, characterName)
                }
                pos++
            }
            Sleep(20)  ; Delay between each character or special key
        }
    } else if (Type(characterArray) = "Array") {
        ; Similar logic for array type
        pos := 1
        while (pos <= StrLen(text)) {
            if (SubStr(text, pos, 1) = "{") {
                endPos := InStr(text, "}", , pos)
                if (endPos) {
                    specialKey := SubStr(text, pos, endPos - pos + 1)
                    for character in characterArray {
                        ControlSend(specialKey,, character)
                    }
                    pos := endPos + 1
                } else {
                    for character in characterArray {
                        ControlSend(SubStr(text, pos, 1),, character)
                    }
                    pos++
                }
            } else {
                for character in characterArray {
                    ControlSend(SubStr(text, pos, 1),, character)
                }
                pos++
            }
           ; Sleep(5)
        }
    }
}

FilterOutCharacter(originalObject, characterToExclude)
{
    filteredObject := {}
    
    for characterName, characterData in originalObject.OwnProps()
    {
        if (characterName != characterToExclude)
        {
            filteredObject.%characterName% := characterData
        }
    }
    
    return filteredObject
}