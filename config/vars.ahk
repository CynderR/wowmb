#Requires AutoHotkey v2.0
Ateam := {
    walldough: {x: -732,	y: -642,	w: 750,	h: 498 , class: 'warlock',blast:{long: '2', opener: '1'}, buffs:{self:['3'],party:[]}, role:'dps', drink:'8'},
    iowaski: {x: -1462,	y: -149,	w: 750,	h: 498, class: 'shaman', blast:{long: '2', opener: '7'}, buffs:{self:['7'],party:[]},role:'dps', drink:'8'},
   
    frozendown: {x: -1462,	y: 340,	w: 750,	h: 498, class:'mage',blast:{long: '2', opener: '7'}, buffs:{self:['='],party:['g']}, role: 'dps', drink:'8'},
    pestcontrol: {x: -732,	y: 340,	w: 750,	h: 498, class: 'paladin', blast:{opener: '1'},  buffs:{self:[],party:['^g']}, role: 'tank', drink:''},
 }
	

mageteam :={
    shadowing: {x: -8,	y: -8,	w: 2576,	h: 1408, class: "priest", blast:{opener: ''}, buffs:{self:[],party:['g']}, role:'heal', heals: {shield:'5', quick: '6'}, drink:'8', horse:'{Ctrl Down}p{Ctrl Up}', accept: ''},

    flamedrinker: {x: 2552,	y: 0,	w: 1109,	h: 722, class:'mage',blast:{long: '2', instant: '7', fnova:'{Alt DOWN}i{Alt UP}',arcaneBlast:'j', blizzard:'{Alt DOWN}n{Alt UP}'}, blink:'{Alt DOWN}b{Alt UP}', buffs:{self:['3'],party:[]}, role: 'dps', drink:'8',  horse:'{Ctrl Down}p{Ctrl Up}', accept: '=', waterEle: '{Ctrl Down}o{Ctrl Up}', sheep: '{Ctrl Down}i{Ctrl Up}'},
    flameguard: {x: 4008,	y: 668,	w: 1123,	h: 731, class:'mage',blast:{long: '2', instant: '7', fnova:'{Alt DOWN}i{Alt UP}',arcaneBlast:'j', blizzard:'{Alt DOWN}n{Alt UP}'}, blink:'{Alt DOWN}b{Alt UP}', buffs:{self:['3'],party:['5']}, role: 'dps', drink:'8',  horse:'{Ctrl Down}p{Ctrl Up}', accept: '=', waterEle: '{Ctrl Down}o{Ctrl Up}', sheep: '{Ctrl Down}i{Ctrl Up}'},
    flamesmelter: {x: 2550,	y: 673,	w: 1112,	h: 724, class:'mage',blast:{long: '2', instant: '7', fnova:'{Alt DOWN}i{Alt UP}',arcaneBlast:'j', blizzard:'{Alt DOWN}n{Alt UP}'}, blink:'{Alt DOWN}b{Alt UP}', buffs:{self:['3'],party:[]}, role: 'dps', drink:'8',  horse:'{Ctrl Down}p{Ctrl Up}', accept: '=', waterEle: '{Ctrl Down}o{Ctrl Up}', sheep: '{Ctrl Down}i{Ctrl Up}'},
    flametamer: {x: 4006,	y:0,	w: 1122,	h: 730, class:'mage',blast:{long: '2', instant: '7', fnova:'{Alt DOWN}i{Alt UP}',arcaneBlast:'j', blizzard:'{Alt DOWN}n{Alt UP}'}, blink:'{Alt DOWN}b{Alt UP}', buffs:{self:['3'],party:[]}, role: 'dps', drink:'8',  horse:'{Ctrl Down}p{Ctrl Up}', accept: '=', waterEle: '{Ctrl Down}o{Ctrl Up}', sheep: '{Ctrl Down}i{Ctrl Up}'},
    ; zendarr: {x: -8,	y: -8,	w: 2576,	h: 1408, class: "shamen", blast:{opener: ''}, buffs:{self:[],party:['g']}, role:'heal', heals: {shield:'5', quick: '6'}, drink:'8', horse:'{Ctrl Down}p{Ctrl Up}', accept: ''},
}

group2 := {
    beet: {x: -732,	y: 340,	w: 750,	h: 498, class: 'druid',blast:{long: '2', opener: '3'},  buffs:{self:[],party:['^g']}, role: 'tank'},
    ;limrix: {x:-1469,y:-1131,w:750,h:498, class: 'warlock'},
    burnonedown: {x: -735,	y: -1131,	w: 750,	h: 498, class: 'mage'},
    itswagyu: {x: -1466,	y: -640,	w: 750,	h: 498, class: 'druid' },
    ; nine: {x: -1462,	y: 830,	w: 750,	h: 498 },
    ; ten: {x: -740,	y: 830,	w: 750,	h: 498 },
}


grouptest := {
    shadowing: {x: -728,	y: -149,	w: 750,	h: 498, class: "priest", blast:{}, buffs:{self:[],party:['g']}, role:'heal', heals: {shield:'5', quick: '6'}},
    pestcontrol: {x: -732,	y: 340,	w: 750,	h: 498, class: 'paladin', blast:{},  buffs:{self:['6'],party:['^g']}, role: 'tank'},
 }

 temp := {
    walldough: {x: -732,	y: -642,	w: 750,	h: 498 , class: 'warlock',blast:{long: '2', opener: '3'}, buffs:{self:['3'],party:[]}, role:'dps'},
    iowaski: {x: -1462,	y: -149,	w: 750,	h: 498, class: 'shaman', blast:{long: '2', opener: '3'}, buffs:{self:['7'],party:[]},role:'dps'},
 }