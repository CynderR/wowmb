#Requires AutoHotkey v2.0
#SingleInstance Force
#Include config/vars.ahk
#Include config/_varP.ahk
#Include scripts/textUtils.ahk

#Include scripts/UIControls.ahk
#Include scripts/Signin.ahk
#Include scripts/CharacterControls.ahk


;global screens := grouptest

;global screens := Ateam
;global ac1 := fiveman
global ac1 := fiveMage
global screens := SortByCharacterName(mageteam)


;~XButton1 & 1::TargetMainCharacter(screens)

;global screens := temp
;global ac1 := broken

global hotkeysActive := True


#SuspendExempt
^F9::Toggle(hotkeysActive)

#SuspendExempt False
~XButton1 & F12::WindowSettup()
~XButton1 & F11::party()
~XButton1 & F10::SetAssist()


~XButton1 & `::TargetClear()
; ^F1::SetAssist()
!F::FollowSelectedCharacter()
^!F::StopFollowSelectedCharacter()
~XButton1 & 1::blastName('instant')
~XButton1 & 2::blastName('long')
~XButton1 & j::blastName('arcaneBlast')

!a::AcceptQuest()
^+Escape::camp()
^+p::party()
^+b::BuffsUp()
!s::Drink()
!Space::Space()

~XButton1 & q::RotatingSheep()  ; Rotate through mages to cast sheep
~XButton1 & z::SimpleKeyPress('waterEle')

~XButton1 & m::SimpleKeyPress('horse')
~XButton1 & E::FrostNova()
~XButton1 & R::Blizzard()
~XButton1 & P::MouseMove()
;~XButton1 & a::PassThru('a')
;~XButton1 & s::PassThru('a')
;~XButton1 & w::PassThru('a')
;~XButton1 & d::PassThru('a')


global healer := FindFirstHealRole(screens)
global healerData := FindFirstHealerData(screens)

;Healer
;~XButton1 & 1::TargetMainCast('1', healer)
;~XButton1 & 2::TargetMainCast('2', healer)
;~XButton1 & 3::TargetMainCast('3', healer)
;~XButton1 & 4::TargetMainCast('4', healer)
;~XButton1 & 5::TargetMainCast('5', healer)
;~XButton1 & 6::TargetMainCast('6', healer)
;~XButton1 & 7::TargetMainCast('7', healer)
;~XButton1 & 8::TargetMainCast('8', healer)
;~XButton1 & 9::TargetMainCast('9', healer)
;~XButton1 & 0::TargetMainCast('0', healer)
~XButton1 & F1::TargetCast(healer, 'F1', healerData.heals.quick)
~XButton1 & F2::TargetCast(healer, 'F2', healerData.heals.quick)
~XButton1 & F3::TargetCast(healer, 'F3', healerData.heals.quick)
~XButton1 & F4::TargetCast(healer, 'F4', healerData.heals.quick)
~XButton1 & F5::TargetCast(healer, 'F5', healerData.heals.quick)
~XButton2 & F1::TargetCast(healer, 'F1', healerData.heals.shield)
~XButton2 & F2::TargetCast(healer, 'F2', healerData.heals.shield)
~XButton2 & F3::TargetCast(healer, 'F3', healerData.heals.shield)
~XButton2 & F4::TargetCast(healer, 'F4', healerData.heals.shield)
~XButton2 & F5::TargetCast(healer, 'F5', healerData.heals.shield)

; Movement coordination
~XButton1 & w::PassThru('w')  ; Move Forward for all characters
~XButton1 & a::PassThru('a')  ; Move Left for all characters
~XButton1 & s::PassThru('s')  ; Move Back for all characters
~XButton1 & d::PassThru('d')  ; Move Right for all characters

; Combat hotkeys
!3::PassThru('3')  ; Use ability on 3rd slot for all characters
!4::PassThru('4')  ; Use ability on 4th slot for all characters
!5::PassThru('5')  ; Use ability on 5th slot for all characters

; Target management
!t::PassThru('t')  ; Target nearest enemy for all characters
; ~XButton1 & Tab::PassThru('{Tab}')  ; Cycle targets for all characters
~XButton1 & Space::PassThru("{Space}")

; Utility
!i::PassThru('i')  ; Open inventory for all characters
!c::PassThru('c')  ; Open character panel for all characters
!m::PassThru('m')  ; Open map for all characters

; Emergency buttons
!r::PassThru('{Escape}')  ; Cancel casting/targeting for all characters
!v::EmergencyCooldowns()  ; Trigger emergency cooldowns for all characters

; Looting
!l::GroupLoot()  ; Alt+L to have all characters loot the current target

KeyDelay() {
    Sleep(Random(20,100))
}

