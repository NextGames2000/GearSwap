	--  Welcome to Logical's Ninja Lua.  This Lua is used for changing gear during precast and midcast and then swapping to the appropriate set for aftercast.
	--  It will also cancel shadows for you when necessary to recast new shadows.
	--  Please refer to my video on my NextGames YouTube channel for how to properly utilize this LUA.  

	-- This is what sets the initial set that you normally want to be in by default.
	tp_mode = 'dw0'
    mb_mode = 'mbnin'
	
function self_command(command)
	 local args = split_args(command)
		if args[1] == 'tp' then
		tp_mode = args[2]
	 elseif args[1] == 'mb' then
		mb_mode = args[2]
	 end
end
 
function split_args(args)
		fields = {}
		args:gsub("([^ ]*) ?", function(c)
		table.insert(fields, c)
	end)
	return fields
end

function get_sets()

	-- This is where we will define our precast sets.  These are sets of gear that get equiped BEFORE the spell or ability is used.
	sets.precast = {}
	sets.precast.fc = {
		ammo="Sapience Orb",
		head={ name="Herculean Helm", augments={'Accuracy+13','"Fast Cast"+6',}},
		body="Dread Jupon",
		hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
		legs={ name="Herculean Trousers", augments={'Mag. Acc.+14 "Mag.Atk.Bns."+14','"Fast Cast"+6',}},
		feet="Hattori Kyahan +1",
		neck="Baetyl Pendant",
		waist="Oneiros Belt",
		left_ear="Loquac. Earring",
		right_ear="Enchntr. Earring +1",
		left_ring="Kishar Ring",
		right_ring="Rahab Ring",
		back={ name="Andartia's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}},
	}
	sets.precast.utsusemi = {
		ammo="Sapience Orb",
		head={ name="Herculean Helm", augments={'Accuracy+13','"Fast Cast"+6',}},
		body="Dread Jupon",
		hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
		legs={ name="Herculean Trousers", augments={'Mag. Acc.+14 "Mag.Atk.Bns."+14','"Fast Cast"+6',}},
		feet="Hattori Kyahan +1",
		neck="Baetyl Pendant",
		waist="Oneiros Belt",
		left_ear="Loquac. Earring",
		right_ear="Enchntr. Earring +1",
		left_ring="Kishar Ring",
		right_ring="Rahab Ring",
		back={ name="Andartia's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}},
	}
	
	-- This is where we will define our midcast sets.  These are sets of gear that get equiped BEFORE the spell or ability lands.
	sets.midcast = {}
	sets.midcast.enmity = {
		ammo="Sapience Orb",
		head={ name="Naga Somen", augments={'HP+50','VIT+10','Evasion+20',}},
		body="Emet Harness +1",
		hands="Kurys Gloves",
		legs="Zoar Subligar +1",
		feet={ name="Mochi. Kyahan +3", augments={'Enh. Ninj. Mag. Acc/Cast Time Red.',}},
		neck="Unmoving Collar +1",
		waist="Trance Belt",
		left_ear="Trux Earring",
		right_ear="Cryptic Earring",
		left_ring="Supershear Ring",
		right_ring="Eihwaz Ring",
		back={ name="Andartia's Mantle", augments={'AGI+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Damage taken-5%',}},
	}

	sets.midcast.elenin = {
		ammo="Pemphredo Tathlum",
		head={ name="Mochi. Hatsuburi +3", augments={'Enhances "Yonin" and "Innin" effect',}},
		body={ name="Samnuha Coat", augments={'Mag. Acc.+12','"Mag.Atk.Bns."+12','"Dual Wield"+3',}},
		hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
		legs="Gyve Trousers",
		feet={ name="Mochi. Kyahan +3", augments={'Enh. Ninj. Mag. Acc/Cast Time Red.',}},
		neck="Baetyl Pendant",
		waist="Orpheus's Sash",
		left_ear="Novio Earring",
		right_ear="Friomisi Earring",
		left_ring="Shiva Ring +1",
		right_ring="Shiva Ring +1",
		back={ name="Andartia's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
	}
	
	sets.midcast.mbnin = {
		ammo="Pemphredo tathlum",
		head={ name="Mochi. Hatsuburi +3", augments={'Enhances "Yonin" and "Innin" effect',}},
		body={ name="Samnuha Coat", augments={'Mag. Acc.+12','"Mag.Atk.Bns."+12','"Dual Wield"+3',}},
		hands={ name="Herculean Gloves", augments={'"Mag.Atk.Bns."+24','Magic burst dmg.+6%','INT+8',}},
		legs={ name="Herculean Trousers", augments={'"Mag.Atk.Bns."+24','Magic burst dmg.+8%','Mag. Acc.+15',}},
		feet={ name="Mochi. Kyahan +3", augments={'Enh. Ninj. Mag. Acc/Cast Time Red.',}},
		neck="Baetyl Pendant",
		waist="Orpheus's Sash",
		left_ear="Static Earring",
		right_ear="Friomisi Earring",
		left_ring="Locus Ring",
		right_ring="Mujin Band",
		back={ name="Andartia's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
	}
	
	sets.midcast.enfnin = {
		ammo="Yamarang",
		head="Hachiya Hatsu. +3",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Hachiya Kyahan +3",
		neck="Incanter's Torque",
		waist="Eschan Stone",
		left_ear="Digni. Earring",
		right_ear="Hnoss Earring",
		left_ring="Stikini Ring",
		right_ring="Stikini Ring +1",
		back={ name="Andartia's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Magic Damage +10','"Mag.Atk.Bns."+10',}},
	}
	
	sets.midcast.waltz = {
		ammo="Yamarang",
		head="Mummu Bonnet +2",
		body={ name="Mochi. Chainmail +3", augments={'Enhances "Sange" effect',}},
		hands={ name="Herculean Gloves", augments={'Accuracy+16 Attack+16','"Waltz" potency +11%','MND+6',}},
		legs={ name="Herculean Trousers", augments={'"Waltz" potency +11%','INT+4',}},
		feet={ name="Herculean Boots", augments={'Attack+7','"Waltz" potency +11%','AGI+6',}},
		right_ring="Valseur's Ring",
	}

	sets.midcast.bladehi = {
		ammo="Yetshila +1",
		head="Hachiya Hatsu. +3",
		body="Mummu Jacket +2",
		hands="Mummu Wrists +2",
		legs={ name="Mochi. Hakama +3", augments={'Enhances "Mijin Gakure" effect',}},
		feet="Mummu Gamash. +2",
		neck={ name="Ninja Nodowa +2", augments={'Path: A',}},
		waist="Gerdr Belt",
		left_ear="Ishvara Earring",
		right_ear="Odr Earring",
		left_ring="Mummu Ring",
		right_ring="Begrudging ring",
		back={ name="Andartia's Mantle", augments={'AGI+20','Accuracy+20 Attack+20','AGI+10','Weapon skill damage +10%',}},
	}
	
	sets.midcast.blademetsu = {
		ammo="Date Shuriken",
		head="Hachiya Hatsu. +3",
		body={ name="Herculean Vest", augments={'Weapon skill damage +5%','STR+9','Attack+13',}},
		hands={ name="Herculean Gloves", augments={'Accuracy+10','Weapon skill damage +5%','Attack+10',}},
		legs={ name="Mochi. Hakama +3", augments={'Enhances "Mijin Gakure" effect',}},
		feet={ name="Herculean Boots", augments={'Weapon skill damage +5%','AGI+9','Accuracy+13',}},
		neck={ name="Ninja Nodowa +2", augments={'Path: A',}},
		waist="Fotia Belt",
		left_ear="Ishvara Earring",
		right_ear="Odr Earring",
		left_ring="Karieyh Ring",
		right_ring="Epaminondas's Ring",
		back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
	}
	
	sets.midcast.bladeshun = {
		ammo="Date Shuriken",
		head="Ken. Jinpachi +1",
		body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		hands="Ken. Tekko +1",
		legs="Jokushu Haidate",
		feet="Ken. Sune-Ate +1",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Odr Earring",
		right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		left_ring="Ilabrat Ring",
		right_ring="Regal Ring",
		back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
	}
	
	sets.midcast.bladeten = {
		ammo="Voluspa Tathlum",
		head="Hachiya Hatsu. +3",
		body={ name="Herculean Vest", augments={'Weapon skill damage +5%','STR+9','Attack+13',}},
		hands={ name="Herculean Gloves", augments={'Accuracy+10','Weapon skill damage +5%','Attack+10',}},
		legs={ name="Mochi. Hakama +3", augments={'Enhances "Mijin Gakure" effect',}},
		feet={ name="Herculean Boots", augments={'Weapon skill damage +5%','AGI+9','Accuracy+13',}},
		neck={ name="Ninja Nodowa +2", augments={'Path: A',}},
		waist="Grunfeld Rope",
		left_ear="Odr Earring",
		right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		left_ring="Karieyh Ring",
		right_ring="Epaminondas's Ring",
		back={ name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	}
	
	sets.midcast.bladechi = {
		ammo="Voluspa Tathlum",
		head={ name="Mochi. Hatsuburi +3", augments={'Enhances "Yonin" and "Innin" effect',}},
		body={ name="Samnuha Coat", augments={'Mag. Acc.+12','"Mag.Atk.Bns."+12','"Dual Wield"+3',}},
		hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
		legs="Gyve Trousers",
		feet="Hachiya Kyahan +3",
		neck="Baetyl Pendant",
		waist="Orpheus's Sash",
		left_ear="Friomisi Earring",
		right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		left_ring="Epaminondas's Ring",
		right_ring="Dingir Ring",
		back={ name="Andartia's Mantle", augments={'STR+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','Weapon skill damage +10%',}},
	}
		
	sets.midcast.bladekamu = {
		ammo="Date Shuriken",
		head={ name="Mochi. Hatsuburi +3", augments={'Enhances "Yonin" and "Innin" effect',}},
		body={ name="Mochi. Chainmail +3", augments={'Enhances "Sange" effect',}},
		hands={ name="Mochizuki Tekko +3", augments={'Enh. "Ninja Tool Expertise" effect',}},
		legs={ name="Mochi. Hakama +3", augments={'Enhances "Mijin Gakure" effect',}},
		feet="Hachiya Kyahan +3",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Ishvara Earring",
		right_ear="Odr Earring",
		left_ring="Epaminondas's Ring",
		right_ring="Ilabrat Ring",
		back={ name="Andartia's Mantle", augments={'STR+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','Weapon skill damage +10%',}},
	}

	sets.midcast.bladeretsu = {
		ammo="Date Shuriken",
		head="Ken. Jinpachi +1",
		body="Ken. Samue +1",
		hands="Ken. Tekko +1",
		legs="Ken. Hakama +1",
		feet="Ken. Sune-Ate +1",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Ishvara Earring",
		right_ear="Odr Earring",
		left_ring="Epaminondas's Ring",
		right_ring="Ilabrat Ring",
		back={ name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	}

	sets.midcast.bladeto = {
		ammo="Voluspa Tathlum",
		head={ name="Mochi. Hatsuburi +3", augments={'Enhances "Yonin" and "Innin" effect',}},
		body={ name="Samnuha Coat", augments={'Mag. Acc.+12','"Mag.Atk.Bns."+12','"Dual Wield"+3',}},
		hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
		legs="Gyve Trousers",
		feet="Hachiya Kyahan +3",
		neck="Baetyl Pendant",
		waist="Orpheus's Sash",
		left_ear="Friomisi Earring",
		right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		left_ring="Epaminondas's Ring",
		right_ring="Dingir Ring",
		back={ name="Andartia's Mantle", augments={'STR+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','Weapon skill damage +10%',}},
	}

	-- This is where we will define our aftercast sets.  These are sets of gear that get equiped AFTER the spell or ability is used.  Normally this is used to put you back into your current TP set.
	sets.aftercast = {}
	sets.aftercast.dw40 = {
		ammo="Seki Shuriken",
		head={ name="Ryuo Somen +1", augments={'HP+65','"Store TP"+5','"Subtle Blow"+8',}},
		body={ name="Mochi. Chainmail +3", augments={'Enhances "Sange" effect',}},
		hands={ name="Floral Gauntlets", augments={'Rng.Acc.+15','Accuracy+15','"Triple Atk."+3','Magic dmg. taken -4%',}},
		legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
		feet="Hiza. Sune-Ate +2",
		neck={ name="Ninja Nodowa +2", augments={'Path: A',}},
		waist="Windbuffet Belt +1",
		left_ear="Suppanomimi",
		right_ear="Eabani Earring",
		left_ring="Gere Ring",
		right_ring="Chirich Ring +1",
		back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
	}
	
	sets.aftercast.dw20 = {
		ammo="Seki Shuriken",
		head={ name="Ryuo Somen +1", augments={'HP+65','"Store TP"+5','"Subtle Blow"+8',}},
		body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		hands={ name="Floral Gauntlets", augments={'Rng.Acc.+15','Accuracy+15','"Triple Atk."+3','Magic dmg. taken -4%',}},
		legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
		feet={ name="Herculean Boots", augments={'Accuracy+20','"Triple Atk."+4',}},
		neck={ name="Ninja Nodowa +2", augments={'Path: A',}},
		waist="Windbuffet Belt +1",
		left_ear="Cessance Earring",
		right_ear="Brutal Earring",
		left_ring="Gere Ring",
		right_ring="Chirich Ring +1",
		back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
	}

	sets.aftercast.dw0 = {
		ammo="Happo Shuriken +1",
		head="Ken. Jinpachi +1",
		body="Ken. Samue +1",
		hands="Ken. Tekko +1",
		legs="Ken. Hakama +1",
		feet="Ken. Sune-Ate +1",
		neck="Ninja Nodowa +2",
		waist="Windbuffet Belt +1",
		left_ear="Cessance Earring",
		right_ear="Brutal Earring",
		left_ring="Gere Ring",
		right_ring="Epona's Ring",
		back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
	}
	sets.aftercast.accuracy = {
	    ammo="Yamarang",
		head="Ken. Jinpachi +1",
		body="Ken. Samue +1",
		hands="Ken. Tekko +1",
		legs="Ken. Hakama +1",
		feet="Ken. Sune-Ate +1",
		neck="Ninja Nodowa +2",
		waist="Olseni Belt",
		left_ear="Mache Earring +1",
		right_ear="Mache Earring +1",
		left_ring="Chirich Ring +1",
		right_ring="Chirich Ring +1",
		back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
	}

	sets.aftercast.evasion = {
		ammo="Yamarang",
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck="Combatant's Torque",
		waist="Nesanica Belt",
		left_ear="Ran Earring",
		right_ear="Eabani Earring",
		left_ring="Portus Annulet",
		right_ring="Chirich Ring +1",
		back={ name="Andartia's Mantle", augments={'AGI+20','Eva.+20 /Mag. Eva.+20','Evasion+10','"Dual Wield"+10','Evasion+15',}},
	}
	
	sets.aftercast.magicdef = {
		ammo="Staunch Tathlum +1",
		head="Ken. Jinpachi +1",
		body="Ken. Samue +1",
		hands="Ken. Tekko +1",
		legs="Ken. Hakama +1",
		feet="Ken. Sune-Ate +1",
		neck="Inq. Bead Necklace",
		waist="Engraved Belt",
		left_ear="Sanare Earring",
		right_ear="Odnowa Earring +1",
		left_ring="Vexer Ring +1",
		right_ring="Defending Ring",
		back="Moonlight Cape",
	}
	
	sets.aftercast.magiceva = {
		ammo="Staunch Tathlum +1",
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck="Warder's Charm +1",
		waist="Engraved Belt",
		left_ear="Sanare Earring",
		right_ear="Eabani Earring",
		left_ring="Purity Ring",
		right_ring="Vengeful Ring",
		back={ name="Andartia's Mantle", augments={'AGI+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Damage taken-5%',}},
	}
end

-----------------------------------------------------------------------------------
  -- This is the precast section.  It is used to tell the game you should be wearing BEFORE you take an action..
  function precast(spell, act)

	if spell.english:startswith('Utsusemi') then
		equip(sets.precast.utsusemi)
	end

	if spell.english:startswith('Monomi') then
		equip (sets.precast.fc)
	end

	if spell.english:startswith('Tonko') then
		equip (sets.precast.fc)
	end
	
	if spell.english:startswith('Gekka') then
		equip (sets.precast.fc)
	end

	if spell.english:startswith('Yain') then
		equip (sets.precast.fc)
	end
	
	if spell.english:startswith('Kakka') then
		equip (sets.precast.fc)
	end

	if spell.english:startswith('Myoshu') then
		equip (sets.precast.fc)
	end

	if spell.english:startswith('Migawari') then
		equip (sets.precast.fc)
	end
	
	if spell.english:startswith('Yurin') then
		equip (sets.precast.fc)
	end
	
	if spell.english:startswith('Dokumori') then
		equip (sets.precast.fc)
	end

	if spell.english:startswith('Aisha') then
		equip (sets.precast.fc)
	end

	if spell.english:startswith('Kurayami') then
		equip (sets.precast.fc)
	end
	
	if spell.english:startswith('Hojo') then
		equip (sets.precast.fc)
	end

	if spell.english:startswith('Jubaku') then
		equip (sets.precast.fc)
	end

	if spell.english:startswith('Katon') then
		equip(sets.precast.fc)
	end

	if spell.english:startswith('Hyoton') then
		equip(sets.precast.fc)
	end
	
	if spell.english:startswith('Huton') then
		equip(sets.precast.fc)
	end

	if spell.english:startswith('Doton') then
		equip(sets.precast.fc)
	end

	if spell.english:startswith('Raiton') then
		equip(sets.precast.fc)
	end
	
	if spell.english:startswith('Suiton') then
		equip(sets.precast.fc)
	end
	
	if spell.type == "Trust" then
		equip(sets.precast.fc)
	end
	
end

-----------------------------------------------------------------------------------
  -- This is the midcast section.  It is used to designate gear that you want on as the ability or spell is used.
function midcast(spell, act)

	-- The below command is used to cancel old shadows if they can not be overwritten by the newly cased Utsusemi.
	if spell.english == "Utsusemi: Ichi" then
		if buffactive['Copy Image'] then
			send_command('cancel 66')
		elseif buffactive['Copy Image (2)'] then 
			send_command('cancel 444')
		elseif buffactive['Copy Image (3)'] then
			send_command('cancel 445')
		elseif buffactive['Copy Image (4+)'] then
			send_command('cancel 446')
		end
	end

	if spell.english == "Provoke" then
		equip (sets.midcast.enmity)
	end

	if spell.english == "Warcry" then
		equip (sets.midcast.enmity)
	end

	if spell.english == "Animated Flourish" then
		equip (sets.midcast.enmity)
	end

	if spell.english == "Violent Flourish" then
		equip (sets.midcast.enfnin)
	end

	if spell.english:startswith('Curing') then
		equip (sets.midcast.waltz)
	end

	if spell.english == "Divine Waltz" then
		equip (sets.midcast.waltz)
	end
	
	if spell.english:startswith('Migawari') then
		equip (sets.midcast.migawari)
	end
	
	if spell.english:startswith('Kurayami') then
		equip (sets.midcast.enfnin)
	end

	if spell.english:startswith('Hojo') then
		equip (sets.midcast.enfnin)
	end

	if spell.english:startswith('Jubaku') then
		equip (sets.midcast.enfnin)
	end

	if spell.english:startswith('Katon') then
		set = sets.midcast
		if set[mb_mode] then
			set = set[mb_mode]
		end
		equip(set)
	end

	if spell.english:startswith('Hyoton') then
		set = sets.midcast
		if set[mb_mode] then
			set = set[mb_mode]
		end
		equip(set)
	end

	if spell.english:startswith('Huton') then
		set = sets.midcast
		if set[mb_mode] then
			set = set[mb_mode]
		end
		equip(set)
	end

	if spell.english:startswith('Doton') then
		set = sets.midcast
		if set[mb_mode] then
			set = set[mb_mode]
		end
		equip(set)
	end

	if spell.english:startswith('Raiton') then
		set = sets.midcast
		if set[mb_mode] then
			set = set[mb_mode]
		end
		equip(set)
	end

	if spell.english:startswith('Suiton')then
		set = sets.midcast
		if set[mb_mode] then
			set = set[mb_mode]
		end
		equip(set)
	end
	
	if spell.english == "Blade: Hi" then
		equip (sets.midcast.bladehi)
	end

	if spell.english == "Blade: Metsu" then
		equip (sets.midcast.blademetsu)
	end

	if spell.english == "Blade: Shun" then
		equip (sets.midcast.bladeshun)
	end

	if spell.english == "Blade: Ten" then
		equip (sets.midcast.bladeten)
	end
	
	if spell.english == "Blade: Chi" then
		equip (sets.midcast.bladechi)
	end
	
	if spell.english == "Blade: To" then
		equip (sets.midcast.bladechi)
	end
	
	if spell.english == "Blade: Kamu" then
		equip (sets.midcast.bladechi)
	end

	if spell.english == "Blade: Retsu" then
		equip (sets.midcast.bladeten)
	end

	if spell.type == "Trust" then
		equip(sets.precast.fc)
	end
end

-----------------------------------------------------------------------------------

	-- This section is the aftercast section that makes it so that after any of the above abilities you get put back into the correct gearset.  It should not be modified.
function aftercast(spell, act, spellMap, eventArgs)
    set = sets.aftercast
	if set[tp_mode] then
		set = set[tp_mode]
	end
	equip(set)
end

