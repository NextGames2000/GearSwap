	--  Welcome to Logical's Ninja Lua.  This Lua is used for changing gear during precast and midcast and then swapping to the appropriate set for aftercast.
	--  It will also cancel shadows for you when necessary to recast new shadows.
	--  Please refer to my video on my NextGames YouTube channel for how to properly utilize this LUA.  

	-- This is what sets the initial set that you normally want to be in by default.
	tp_mode = 'refresh'
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
		ammo="Impatiens",
		neck="Orunmila's Torque",
		waist="Witful Belt",
		left_ear="Loquac. Earring",
		right_ear="Malignance Earring",
		left_ring="Rahab Ring",
		right_ring="Kishar Ring",
		back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}},
	}
	
	-- This is where we will define our midcast sets.  These are sets of gear that get equiped BEFORE the spell or ability lands.
	sets.midcast = {}
	sets.midcast.magicacc = {
		ammo="Regal Gem",
		head="Malignance Chapeau",
		body="Atrophy Tabard +2",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck={ name="Dls. Torque +2", augments={'Path: A',}},
		waist="Sacro Cord",
		left_ear="Regal Earring",
		right_ear="Malignance Earring",
		left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
		right_ring="Stikini Ring +1",
		back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}},
	}
	
	sets.midcast.haste = {
		ammo="Sapience Orb",
		head="Umuthi Hat",
		body={ name="Viti. Tabard +1", augments={'Enhances "Chainspell" effect',}},
		hands="Atrophy Gloves +2",
		legs="Atrophy Tights +2",
		feet="Leth. Houseaux +1",
		neck="Incanter's Torque",
		waist="Olympus Sash",
		left_ear="Loquac. Earring",
		right_ear="Andoaa Earring",
		left_ring="Stikini Ring",
		right_ring="Stikini Ring +1",
		back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +10','Enha.mag. skill +10','Mag. Acc.+6',}},
	}

	sets.midcast.enhancing = {
		ammo="Staunch Tathlum +1",
		head="Befouled Crown",
		body={ name="Viti. Tabard +3", augments={'Enhances "Chainspell" effect',}},
		hands={ name="Viti. Gloves +3", augments={'Enhancing Magic duration',}},
		legs="Atrophy Tights +2",
		feet="Leth. Houseaux +1",
		neck="Incanter's Torque",
		waist="Olympus Sash",
		left_ear="Mimir Earring",
		right_ear="Andoaa Earring",
		left_ring="Stikini Ring",
		right_ring="Stikini Ring +1",
		back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +10','Enha.mag. skill +10','Mag. Acc.+6',}},
	}

	sets.midcast.enfeebling = {
		ammo="Regal Gem",
		head={ name="Viti. Chapeau +3", augments={'Enfeebling Magic duration','Magic Accuracy',}},
		body="Atrophy Tabard +2",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet={ name="Vitiation Boots +2", augments={'Immunobreak Chance',}},
		neck={ name="Dls. Torque +2", augments={'Path: A',}},
		waist="Sacro Cord",
		left_ear="Regal Earring",
		right_ear="Malignance Earring",
		left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
		right_ring="Stikini Ring +1",
		back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}},
	}

	sets.midcast.refresh = {
		ammo="Sapience Orb",
		head="Atro. Chapeau +2",
		body="Atrophy Tabard +2",
		hands="Atrophy Gloves +2",
		legs="Leth. Fuseau +1",
		feet="Leth. Houseaux +1",
		neck="Orunmila's Torque",
		waist="Gishdubar Sash",
		left_ear="Loquac. Earring",
		right_ear="Malignance Earring",
		left_ring="Rahab Ring",
		right_ring="Kishar Ring",
		back="Grapevine Cape",
	}

	sets.midcast.savage = {
		ammo="Coiste Bodhar",
		head={ name="Taeon Chapeau", augments={'Accuracy+19 Attack+19','"Triple Atk."+2','STR+7 DEX+7',}},
		body="Ayanmo Corazza +2",
		hands="Jhakri Cuffs +2",
		legs={ name="Taeon Tights", augments={'Accuracy+20 Attack+20','"Triple Atk."+2','STR+7 DEX+7',}},
		feet={ name="Taeon Boots", augments={'Accuracy+17 Attack+17','"Triple Atk."+2','STR+6 DEX+6',}},
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		right_ear="Sherida Earring",
		left_ring="Epaminondas's Ring",
		right_ring="Hetairoi Ring",
		back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
	}

	sets.midcast.truestrike = {
		ammo="Coiste Bodhar",
		head={ name="Taeon Chapeau", augments={'Accuracy+19 Attack+19','"Triple Atk."+2','STR+7 DEX+7',}},
		body="Ayanmo Corazza +2",
		hands="Jhakri Cuffs +2",
		legs={ name="Taeon Tights", augments={'Accuracy+20 Attack+20','"Triple Atk."+2','STR+7 DEX+7',}},
		feet={ name="Taeon Boots", augments={'Accuracy+17 Attack+17','"Triple Atk."+2','STR+6 DEX+6',}},
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		right_ear="Sherida Earring",
		left_ring="Epaminondas's Ring",
		right_ring="Hetairoi Ring",
		back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
	}

	sets.midcast.seraphblade = {
		ammo="Coiste Bodhar",
		head={ name="Taeon Chapeau", augments={'Accuracy+19 Attack+19','"Triple Atk."+2','STR+7 DEX+7',}},
		body="Ayanmo Corazza +2",
		hands="Jhakri Cuffs +2",
		legs={ name="Taeon Tights", augments={'Accuracy+20 Attack+20','"Triple Atk."+2','STR+7 DEX+7',}},
		feet={ name="Taeon Boots", augments={'Accuracy+17 Attack+17','"Triple Atk."+2','STR+6 DEX+6',}},
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		right_ear="Sherida Earring",
		left_ring="Epaminondas's Ring",
		right_ring="Hetairoi Ring",
		back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
	}

	sets.midcast.chant = {
		ammo="Yetshila +1",
		head={ name="Blistering Sallet +1", augments={'Path: A',}},
		body={ name="Taeon Tabard", augments={'Accuracy+20 Attack+20','Crit.hit rate+3','Crit. hit damage +3%',}},
		hands={ name="Taeon Gloves", augments={'Accuracy+20 Attack+20','Crit.hit rate+3','Crit. hit damage +3%',}},
		legs={ name="Taeon Tights", augments={'Accuracy+20 Attack+20','Crit.hit rate+3','Crit. hit damage +3%',}},
		feet="Thereoid Greaves",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		right_ear="Sherida Earring",
		left_ring="Ilabrat Ring",
		right_ring="Begrudging Ring",
		back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Crit.hit rate+10',}},
	}

	-- This is where we will define our aftercast sets.  These are sets of gear that get equiped AFTER the spell or ability is used.  Normally this is used to put you back into your current TP set.
	sets.aftercast = {}
	sets.aftercast.refresh = {
		ammo="Staunch Tathlum +1",
		head={ name="Viti. Chapeau +3", augments={'Enfeebling Magic duration','Magic Accuracy',}},
		body="Atrophy Tabard +2",
		hands="Bunzi's Gloves",
		legs={ name="Lengo Pants", augments={'INT+7','Mag. Acc.+7','"Mag.Atk.Bns."+3','"Refresh"+1',}},
		feet="Bunzi's Sabots",
		neck={ name="Warder's Charm +1", augments={'Path: A',}},
		waist="Flume Belt",
		left_ear="Eabani Earring",
		right_ear="Sanare Earring",
		left_ring="Defending Ring",
		right_ring="Stikini Ring +1",
		back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
	}
	
	sets.aftercast.melee = {
		ammo={ name="Coiste Bodhar", augments={'Path: A',}},
		head="Malignance Chapeau",
		body="Ayanmo Corazza +2",
		hands="Bunzi's Gloves",
		legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
		feet="Malignance Boots",
		neck="Twilight Torque",
		waist="Orpheus's Sash",
		left_ear="Brutal Earring",
		right_ear="Sherida Earring",
		left_ring="Defending Ring",
		right_ring="Hetairoi Ring",
		back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dual Wield"+10','Damage taken-5%',}},
	}

	sets.aftercast.dw10 = {
		ammo={ name="Coiste Bodhar", augments={'Path: A',}},
		head={ name="Taeon Chapeau", augments={'Accuracy+20 Attack+20','Crit.hit rate+3','Crit. hit damage +3%',}},
		body="Ayanmo Corazza +2",
		hands="Bunzi's Gloves",
		legs={ name="Taeon Tights", augments={'Accuracy+20 Attack+20','"Triple Atk."+2','STR+7 DEX+7',}},
		feet={ name="Taeon Boots", augments={'Accuracy+17 Attack+17','"Triple Atk."+2','STR+6 DEX+6',}},
		neck="Portus Collar",
		waist={ name="Sailfi Belt +1", augments={'Path: A',}},
		left_ear="Brutal Earring",
		right_ear="Sherida Earring",
		left_ring="Haverton Ring",
		right_ring="Hetairoi Ring",
		back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
	}

	sets.aftercast.dw30 = {
		ammo={ name="Coiste Bodhar", augments={'Path: A',}},
		head={ name="Taeon Chapeau", augments={'Accuracy+20 Attack+20','Crit.hit rate+3','Crit. hit damage +3%',}},
		body="Ayanmo Corazza +2",
		hands="Bunzi's Gloves",
		legs={ name="Taeon Tights", augments={'Accuracy+20 Attack+20','"Triple Atk."+2','STR+7 DEX+7',}},
		feet={ name="Taeon Boots", augments={'Accuracy+17 Attack+17','"Triple Atk."+2','STR+6 DEX+6',}},
		neck="Portus Collar",
		waist="Shetal Stone",
		left_ear="Eabani Earring",
		right_ear="Sherida Earring",
		left_ring="Haverton Ring",
		right_ring="Hetairoi Ring",
		back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dual Wield"+10','Damage taken-5%',}},
	}

	sets.aftercast.dt = {
		ammo="Staunch Tathlum +1",
		head="Bunzi's Hat",
		body="Bunzi's Robe",
		hands="Bunzi's Gloves",
		legs="Bunzi's Pants",
		feet="Bunzi's Sabots",
		neck={ name="Warder's Charm +1", augments={'Path: A',}},
		waist="Flume Belt",
		left_ear="Eabani Earring",
		right_ear="Crematio Earring",
		left_ring="Vengeful Ring",
		right_ring="Purity Ring",
		back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dual Wield"+10','Damage taken-5%',}},
	}
end
-----------------------------------------------------------------------------------
  -- This is the precast section.  It is used for things you want to happen before you start to start to use the ability or spell.
  function precast(spell, act)
	if spell.english:startswith('Utsusemi') then
		equip(sets.precast.fc)
	end

	if spell.type == "WhiteMagic" then
		equip(sets.precast.fc)
	end

	if spell.type == "BlackMagic" then
		equip(sets.precast.fc)
	end

	if spell.type == "Trust" then
		equip(sets.precast.fc)
	end
	
end

-----------------------------------------------------------------------------------
  -- This is the midcast section.  It is used to designate gear that you want on as the ability or spell is used.
function midcast(spell, act)
	if spell.skill == 'Enhancing Magic' and not spell.english:startswith('Refresh') then
		equip (sets.midcast.enhancing)
	end

	if spell.english:startswith('Refresh') then
		equip (sets.midcast.refresh)
	end

	if spell.english:startswith('Refresh') then
		equip (sets.midcast.haste)
	end

	if spell.skill == 'Enfeebling Magic' then
		equip (sets.midcast.enfeebling)
	end

	if spell.skill == 'Elemental Magic' then
		equip (sets.midcast.magicacc)
	end

	if spell.skill == 'Healing Magic' then
		equip (sets.midcast.magicacc)
	end

	if spell.skill == 'Divine Magic' then
		equip (sets.midcast.magicacc)
	end

	if spell.skill == 'Dark Magic' then
		equip (sets.midcast.magicacc)
	end

	if spell.english == "Savage Blade" then
		equip (sets.midcast.savage)
	end

	if spell.english == "Seraph Blade" then
		equip (sets.midcast.savage)
	end

	if spell.english == "True Strike" then
		equip (sets.midcast.truestrike)
	end

	if spell.english == "Black Halo" then
		equip (sets.midcast.truestrike)
	end

	if spell.english == "Requiescat" then
		equip (sets.midcast.savage)
	end

	if spell.english == "Chant du Cygne" then
		equip (sets.midcast.chant)
	end

	if spell.type == "Trust" then
		equip(sets.precast.fc)
	end
end

-----------------------------------------------------------------------------------

	-- This section is the aftercast section that makes it so that after any of the above abilities you get put back into the correct gearset.
	-- You can create tp_mode gearsets for ANY purpose.  Just make sure you label them correctly.  All must be in the sets.aftercast section.  For instance sets.aftercast.dw40.
	-- Don't forget to create a new gearset section defining the gear you want in it if you don't want to use my predefined sets.  Ie create a gearset for sets.aftercast.storetp.
function aftercast(spell, act, spellMap, eventArgs)
    set = sets.aftercast
	if set[tp_mode] then
		set = set[tp_mode]
	end
	equip(set)
end

