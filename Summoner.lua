	--  Welcome to Logical's Summoner Lua. 
	
	-- This is what sets the initial set that you normally want to be in by default.
	prep_mode = 'prep'
    bp_mode = 'bp'
	
function self_command(command)
	 local args = split_args(command)
		if args[1] == 'prep' then
		prep_mode = args[2]
	 elseif args[1] == 'bp' then
		bp_mode = args[2]
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

	sets.precast.skill = {
	    main={ name="Espiritus", augments={'Summoning magic skill +15','Pet: Mag. Acc.+30','Pet: Damage taken -4%',}},
		sub="Vox Grip",
		ammo="Sancus Sachet +1",
		head="Beckoner's Horn +1",
		body="Baayami Robe",
		hands="Baayami Cuffs",
		legs="Baayami Slops",
		feet="Baaya. Sabots +1",
		neck="Incanter's Torque",
		waist="Kobo Obi",
		left_ear="Smn. Earring",
		right_ear="Andoaa Earring",
		left_ring="Stikini Ring +1",
		right_ring="Evoker's Ring",
		back={ name="Conveyance Cape", augments={'Summoning magic skill +5','Pet: Enmity+8','Blood Pact Dmg.+2','Blood Pact ab. del. II -1',}},
	}

	sets.precast.delay = {
	    main={ name="Espiritus", augments={'Summoning magic skill +15','Pet: Mag. Acc.+30','Pet: Damage taken -4%',}},
		sub="Vox Grip",
		ammo="Sancus Sachet +1",
		head="Beckoner's Horn +1",
		body="Baayami Robe",
		hands="Baayami Cuffs",
		legs="Baayami Slops",
		feet="Baaya. Sabots +1",
		neck="Incanter's Torque",
		waist="Kobo Obi",
		left_ear="Smn. Earring",
		right_ear="Andoaa Earring",
		left_ring="Stikini Ring +1",
		right_ring="Evoker's Ring",
		back={ name="Conveyance Cape", augments={'Summoning magic skill +5','Pet: Enmity+8','Blood Pact Dmg.+2','Blood Pact ab. del. II -1',}},
	}

	sets.precast.fc = {
		main={ name="Nibiru Staff", augments={'Pet: Mag. Acc.+20','Pet: "Mag.Atk.Bns."+20','Pet: "Regen"+2',}},
		sub="Elan Strap +1",
		ammo="Impatiens",
		head={ name="Amalric Coif", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
		body="Inyanga Jubbah +2",
		hands={ name="Merlinic Dastanas", augments={'Pet: "Mag.Atk.Bns."+15','Blood Pact Dmg.+10',}},
		legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
		feet="Regal Pumps +1",
		neck="Baetyl Pendant",
		waist="Witful Belt",
		left_ear="Evans Earring",
		right_ear="Loquac. Earring",
		left_ring="Rahab Ring",
		right_ring="Kishar Ring",
		back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Pet: Magic Damage+10','"Fast Cast"+10',}},
	}
	
	sets.precast.refresh = {
		head={ name="Amalric Coif", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
		body="Baayami Robe",
		feet="Inspirited Boots",
		back="Grapevine Cape",
	}	
	
	-- This is where we will define our midcast sets.  These are sets of gear that get equiped BEFORE the spell or ability lands.
	sets.midcast = {}

	sets.midcast.refresh = {
		head={ name="Amalric Coif", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
		body="Baayami Robe",
	    feet="Inspirited Boots",
		back="Grapevine Cape",
	}
	
	sets.midcast.ward = {
	    main={ name="Espiritus", augments={'Summoning magic skill +15','Pet: Mag. Acc.+30','Pet: Damage taken -4%',}},
		sub="Vox Grip",
		ammo="Sancus Sachet +1",
		head="Baayami Hat",
		body="Baayami Robe",
		hands="Baayami Cuffs",
		legs="Baayami Slops",
		feet="Baaya. Sabots +1",
		neck="Incanter's Torque",
		waist="Kobo Obi",
		left_ear="Smn. Earring",
		right_ear="Andoaa Earring",
		left_ring="Stikini Ring +1",
		right_ring="Evoker's Ring",
		back={ name="Conveyance Cape", augments={'Summoning magic skill +5','Pet: Enmity+8','Blood Pact Dmg.+2','Blood Pact ab. del. II -1',}},
	}
	
	sets.midcast.pbp = {
		main="Nirvana",
		sub="Elan Strap +1",
		ammo="Sancus Sachet +1",
		head="Convoker's Horn +3",
		body="Con. Doublet +3",
		hands="Convo. Bracers +3",
		legs={ name="Apogee Slacks", augments={'Pet: STR+15','Blood Pact Dmg.+13','Pet: "Dbl. Atk."+3',}},
		feet="Convo. Pigaches +2",
		neck={ name="Smn. Collar +2", augments={'Path: A',}},
		waist="Incarnation Sash",
		left_ear="Gelos Earring",
		right_ear="Lugalbanda Earring",
		left_ring="Varar Ring +1",
		right_ring="Varar Ring +1",
		back={ name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Pet: Accuracy+10 Pet: Rng. Acc.+10','Pet: Haste+10','Pet: "Regen"+5',}},
	}
	
	sets.midcast.mbp = {
		main="Nirvana",
		sub="Elan Strap +1",
		ammo="Sancus Sachet +1",
		head={ name="Apogee Crown", augments={'MP+60','Pet: "Mag.Atk.Bns."+30','Blood Pact Dmg.+7',}},
		body="Con. Doublet +3",
		hands={ name="Merlinic Dastanas", augments={'Pet: "Mag.Atk.Bns."+15','Blood Pact Dmg.+10',}},
		legs={ name="Enticer's Pants", augments={'MP+45','Pet: Accuracy+14 Pet: Rng. Acc.+14','Pet: Mag. Acc.+13','Pet: Damage taken -3%',}},
		feet={ name="Apogee Pumps", augments={'MP+60','Pet: "Mag.Atk.Bns."+30','Blood Pact Dmg.+7',}},
		neck={ name="Smn. Collar +2", augments={'Path: A',}},
		waist="Regal Belt",
		left_ear="Gelos Earring",
		right_ear="Lugalbanda Earring",
		left_ring="Varar Ring +1",
		right_ring="Varar Ring +1",
		back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Pet: Magic Damage+10','"Fast Cast"+10',}},
	}
	
	sets.midcast.hbp = {
		main="Nirvana",
		sub="Elan Strap +1",
		ammo="Sancus Sachet +1",
		head={ name="Apogee Crown", augments={'MP+60','Pet: "Mag.Atk.Bns."+30','Blood Pact Dmg.+7',}},
		body="Con. Doublet +3",
		hands={ name="Apogee Mitts", augments={'MP+60','Pet: "Mag.Atk.Bns."+30','Blood Pact Dmg.+7',}},
		legs={ name="Apogee Slacks", augments={'Pet: STR+15','Blood Pact Dmg.+13','Pet: "Dbl. Atk."+3',}},
		feet={ name="Apogee Pumps", augments={'MP+60','Pet: "Mag.Atk.Bns."+30','Blood Pact Dmg.+7',}},
		neck={ name="Smn. Collar +2", augments={'Path: A',}},
		waist="Regal Belt",
		left_ear="Gelos Earring",
		right_ear="Lugalbanda Earring",
		left_ring="Varar Ring +1",
		right_ring="Varar Ring +1",
		back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Pet: Magic Damage+10','"Fast Cast"+10',}},
	}
	
	sets.midcast.garland = {
		main="Nirvana",
	}
	
	-- This is where we will define our aftercast sets.  These are sets of gear that get equiped AFTER the spell or ability is used.  Normally this is used to put you back into your current TP set.
	sets.aftercast = {}
	sets.aftercast.prep = {
		main="Nirvana",
		sub="Oneiros Grip",
		ammo="Sancus Sachet +1",
		head="Convoker's Horn +3",
		body="Shomonjijoe +1",
		hands="Asteria Mitts +1",
		legs="Assid. Pants +1",
		feet="Baaya. Sabots +1",
		neck={ name="Smn. Collar +2", augments={'Path: A',}},
		waist="Fucho-no-Obi",
		left_ear="Evans Earring",
		right_ear="Lugalbanda Earring",
		left_ring="Stikini Ring +1",
		right_ring="Evoker's Ring",
		back={ name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Pet: Accuracy+10 Pet: Rng. Acc.+10','Pet: Haste+10','Pet: "Regen"+5',}},
	}
	
	sets.aftercast.acc = {}
	sets.exported={
		main="Nirvana",
		sub="Oneiros Grip",
		ammo="Sancus Sachet +1",
		head="Convoker's Horn +3",
		body="Con. Doublet +3",
		hands="Tali'ah Gages +2",
		legs="Assid. Pants +1",
		feet="Baaya. Sabots +1",
		neck={ name="Smn. Collar +2", augments={'Path: A',}},
		waist="Fucho-no-Obi",
		left_ear="Kyrene's Earring",
		right_ear="Enmerkar Earring",
		left_ring="Varar Ring +1",
		right_ring="Varar Ring +1",
		back={ name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Pet: Accuracy+10 Pet: Rng. Acc.+10','Pet: Haste+10','Pet: "Regen"+5',}},
	}
end

-----------------------------------------------------------------------------------
  -- This is the precast section.  It is used for things you want to happen before you start to start to use the ability or spell.
  function precast(spell, act)

	if spell.english == "Carbuncle" then
		equip (sets.precast.fc)
	end

	if spell.english == "Fenrir" then
		equip (sets.precast.fc)
	end

	if spell.english == "Ifrit" then
		equip (sets.precast.fc)
	end

	if spell.english == "Titan" then
		equip (sets.precast.fc)
	end

	if spell.english == "Leviathan" then
		equip (sets.precast.fc)
	end

	if spell.english == "Garuda" then
		equip (sets.precast.fc)
	end

	if spell.english == "Shiva" then
		equip (sets.precast.fc)
	end

	if spell.english == "Ramuh" then
		equip (sets.precast.fc)
	end

	if spell.english == "Diabolos" then
		equip (sets.precast.fc)
	end

	if spell.english == "Siren" then
		equip (sets.precast.fc)
	end

	if spell.english == "Odin" then
		equip (sets.precast.fc)
	end

	if spell.english == "Alexander" then
		equip (sets.precast.fc)
	end

	if spell.english == "Cait Sith" then
		equip (sets.precast.fc)
	end

	if spell.english == "Atomos" then
		equip (sets.precast.fc)
	end

	if spell.english == "Fire Spirit" then
		equip (sets.precast.fc)
	end

	if spell.english == "Ice Spirit" then
		equip (sets.precast.fc)
	end

	if spell.english == "Air Spirit" then
		equip (sets.precast.fc)
	end

	if spell.english == "Earth Spirit" then
		equip (sets.precast.fc)
	end

	if spell.english == "Thunder Spirit" then
		equip (sets.precast.fc)
	end

	if spell.english == "Water Spirit" then
		equip (sets.precast.fc)
	end

	if spell.english == "Light Spirit" then
		equip (sets.precast.fc)
	end

	if spell.english == "Dark Spirit" then
		equip (sets.precast.fc)
	end

	if spell.english:startswith('Refresh') then
		equip (sets.precast.fc)
	end

	if spell.english:startswith('Cure') then
		equip (sets.precast.fc)
	end

	if spell.type == "Trust" then
		equip(sets.precast.fc)
	end
end

-----------------------------------------------------------------------------------
  -- This is the midcast section.  It is used to designate gear that you want on as the ability or spell is used.
function midcast(spell, act)

	if spell.english:startswith('Refresh') then
		equip(sets.midcast.refresh)
	end

	if spell.english:startswith('Cure') then
		equip(sets.midcast.cure)
	end

	-- Carbuncle Section
	if spell.english == "Carbuncle" then
		equip (sets.precast.skill)
	end

	if spell.english == "Healing Ruby" then
		equip (sets.precast.skill)
	end

	if spell.english == "Shining Ruby" then
		equip (sets.precast.skill)
	end

	if spell.english == "Glittering Ruby" then
		equip (sets.precast.skill)
	end

	if spell.english == "Healing Ruby II" then
		equip (sets.precast.skill)
	end

	if spell.english == "Soothing Ruby" then
		equip (sets.precast.skill)
	end

	if spell.english == "Pacifying Ruby" then
		equip (sets.precast.skill)
	end

	if spell.english == "Poison Nails" then
		equip (sets.midcast.pbp)
	end

	if spell.english == "Meteorite" then
		equip (sets.midcast.mbp)
	end

	if spell.english == "Holy Mist" then
		equip (sets.midcast.mbp)
	end

	-- Fenrir Section
	if spell.english == "Fenrir" then
		equip (sets.precast.skill)
	end

	if spell.english == "Lunar Cry" then
		equip (sets.precast.skill)
	end

	if spell.english == "Lunar Roar" then
		equip (sets.precast.skill)
	end

	if spell.english == "Ecliptic Growl" then
		equip (sets.precast.skill)
	end

	if spell.english == "Ecliptic Howl" then
		equip (sets.precast.skill)
	end

	if spell.english == "Heavenward Howl" then
		equip (sets.precast.skill)
	end

	if spell.english == "Moonlit Charge" then
		equip (sets.midcast.pbp)
	end

	if spell.english == "Crescent Fang" then
		equip (sets.midcast.pbp)
	end

	if spell.english == "Eclipse Bite" then
		equip (sets.midcast.pbp)
	end

	if spell.english == "Lunar Bay" then
		equip (sets.midcast.mbp)
	end

	if spell.english == "Impact" then
		equip (sets.midcast.mbp)
	end

	-- Ifrit Section
	if spell.english == "Ifrit" then
		equip (sets.precast.skill)
	end

	if spell.english == "Flaming Crush" then
		equip (sets.midcast.hbp)
	end

	if spell.english == "Conflag Strike" then
		equip (sets.midcast.mbp)
	end

	if spell.english == "Crimson Howl" then
		equip (sets.precast.skill)
	end

	if spell.english == "Inferno Howl" then
		equip (sets.precast.skill)
	end

	if spell.english == "Punch" then
		equip (sets.midcast.pbp)
	end

	if spell.english == "Double Punch" then
		equip (sets.midcast.pbp)
	end

	if spell.english == "Fire II" then
		equip (sets.midcast.mbp)
	end

	if spell.english == "Fire IV" then
		equip (sets.midcast.mbp)
	end

	if spell.english == "Burning Strike" then
		equip (sets.midcast.mbp)
	end

	if spell.english == "Meteor Strike" then
		equip (sets.midcast.mbp)
	end

	-- Titan Section
	if spell.english == "Titan" then
		equip (sets.precast.skill)
	end
	
	if spell.english == "Earthen Ward" then
		equip (sets.precast.skill)
	end

	if spell.english == "Earthen Armor" then
		equip (sets.precast.skill)
	end

	if spell.english == "Rock Throw" then
		equip (sets.midcast.php)
	end

	if spell.english == "Store II" then
		equip (sets.midcast.mbp)
	end

	if spell.english == "Store IV" then
		equip (sets.midcast.mbp)
	end

	if spell.english == "Rock Buster" then
		equip (sets.midcast.pbp)
	end

	if spell.english == "Megalith Throw" then
		equip (sets.midcast.pbp)
	end

	if spell.english == "Mountian Buster" then
		equip (sets.midcast.pbp)
	end

	if spell.english == "Geocrush" then
		equip (sets.midcast.mbp)
	end

	if spell.english == "Craw Throw" then
		equip (sets.midcast.pbp)
	end
	
	-- Leviathan Section
	if spell.english == "Leviathan" then
		equip (sets.precast.skill)
	end

	if spell.english == "Spring Water" then
		equip (sets.precast.skill)
	end

	if spell.english == "Slowga" then
		equip (sets.precast.skill)
	end

	if spell.english == "Tidal Roar" then
		equip (sets.precast.skill)
	end

	if spell.english == "Soothing Current" then
		equip (sets.precast.skill)
	end

	if spell.english == "Barracuda Dive" then
		equip (sets.precast.pbp)
	end

	if spell.english == "Water II" then
		equip (sets.midcast.mbp)
	end

	if spell.english == "Water IV" then
		equip (sets.midcast.mbp)
	end

	if spell.english == "Tail Whip" then
		equip (sets.midcast.pbp)
	end

	if spell.english == "Spinning Dive" then
		equip (sets.midcast.pbp)
	end

	if spell.english == "Grand Fall" then
		equip (sets.midcast.mbp)
	end

	-- Garuda Section
	if spell.english == "Garuda" then
		equip (sets.precast.skill)
	end

	if spell.english == "Whispering Wind" then
		equip (sets.precast.skill)
	end

	if spell.english == "Hastega" then
		equip (sets.precast.skill)
	end

	if spell.english == "Aerial Armor" then
		equip (sets.precast.skill)
	end

	if spell.english == "Fleet Wind" then
		equip (sets.precast.skill)
	end

	if spell.english == "Hastega II" then
		equip (sets.precast.skill)
	end

	if spell.english == "Claw" then
		equip (sets.midcast.pbp)
	end

	if spell.english == "Predator Claws" then
		equip (sets.midcast.pbp)
	end

	if spell.english == "Aero II" then
		equip (sets.midcast.mbp)
	end

	if spell.english == "Aero IV" then
		equip (sets.midcast.mbp)
	end

	if spell.english == "Wind Blade" then
		equip (sets.midcast.pbp)
	end
	
	-- Shiva Section
	if spell.english == "Shiva" then
		equip (sets.precast.skill)
	end

	if spell.english == "Frost Armor" then
		equip (sets.precast.skill)
	end

	if spell.english == "Sleepga" then
		equip (sets.precast.skill)
	end

	if spell.english == "Diamond Storm" then
		equip (sets.precast.skill)
	end

	if spell.english == "Crystal Blessing" then
		equip (sets.precast.skill)
	end

	if spell.english == "Axe Kick" then
		equip (sets.midcast.pbp)
	end

	if spell.english == "Blizzard II" then
		equip (sets.midcast.mbp)
	end

	if spell.english == "Blizzard IV" then
		equip (sets.midcast.mbp)
	end

	if spell.english == "Double Slap" then
		equip (sets.midcast.pbp)
	end

	if spell.english == "Rush" then
		equip (sets.midcast.pbp)
	end

	if spell.english == "Heavenly Strike" then
		equip (sets.midcast.mbp)
	end
	
	-- Ramuh Section
	if spell.english == "Ramuh" then
		equip (sets.precast.skill)
	end

	if spell.english == "Rolling Thunder" then
		equip (sets.precast.skill)
	end

	if spell.english == "Lightning Armor" then
		equip (sets.precast.skill)
	end

	if spell.english == "Shock Squall" then
		equip (sets.precast.skill)
	end

	if spell.english == "Thunder II" then
		equip (sets.midcast.mbp)
	end

	if spell.english == "Thunder IV" then
		equip (sets.midcast.mbp)
	end

	if spell.english == "Shock Strike" then
		equip (sets.midcast.pbp)
	end

	if spell.english == "Thunderspark" then
		equip (sets.midcast.mbp)
	end

	if spell.english == "Chaotic Strike" then
		equip (sets.midcast.pbp)
	end

	if spell.english == "Thunderstorm" then
		equip (sets.midcast.mbp)
	end

	if spell.english == "Volt Strike" then
		equip (sets.midcast.pbp)
	end

	-- Siren Section
	if spell.english == "Welt" then
		equip (sets.midcast.pbp)
	end

	if spell.english == "Roundhouse" then
		equip (sets.midcast.pbp)
	end

	if spell.english == "Sonic Buffet" then
		equip (sets.midcast.mbp)
	end

	if spell.english == "Tornado II" then
		equip (sets.midcast.mbp)
	end

	if spell.english == "Hysteric Assault" then
		equip (sets.midcast.pbp)
	end

	if spell.english == "Katabatic Blades" then
		equip (sets.precast.skill)
	end

	if spell.english == "Lunatic Voice" then
		equip (sets.precast.skill)
	end

	if spell.english == "Chinook" then
		equip (sets.precast.skill)
	end

	if spell.english == "Bitter Elegy" then
		equip (sets.precast.skill)
	end

	if spell.english == "Wind's Blessing" then
		equip (sets.precast.skill)
	end

	-- Diabolos Section
	if spell.english == "Diabolos" then
		equip (sets.precast.skill)
	end

	if spell.english == "Somnolence" then
		equip (sets.precast.skill)
	end

	if spell.english == "Nightmare" then
		equip (sets.precast.skill)
	end

	if spell.english == "Ultimate Terror" then
		equip (sets.precast.skill)
	end

	if spell.english == "Noctoshield" then
		equip (sets.precast.skill)
	end

	if spell.english == "Dream Shroud" then
		equip (sets.precast.skill)
	end

	if spell.english == "Pavor Nocturnus" then
		equip (sets.precast.skill)
	end

	if spell.english == "Camisado" then
		equip (sets.midcast.pbp)
	end

	if spell.english == "Nether Blast" then
		equip (sets.midcast.pbp)
	end

	if spell.english == "Night Terror" then
		equip (sets.midcast.mbp)
	end

	if spell.english == "Blindside" then
		equip (sets.midcast.pbp)
	end

	-- Cait Sith Section
	if spell.english == "Cait Sith" then
		equip (sets.precast.skill)
	end

	if spell.english == "Mewing Lullaby" then
		equip (sets.precast.skill)
	end

	if spell.english == "Raise II" then
		equip (sets.precast.skill)
	end

	if spell.english == "Reraise II" then
		equip (sets.precast.skill)
	end

	if spell.english == "Earie Eye" then
		equip (sets.precast.skill)
	end

	if spell.english == "Regal Scratch" then
		equip (sets.midcast.pbp)
	end

	if spell.english == "Regal Gash" then
		equip (sets.midcast.pbp)
	end

	if spell.english == "Level ? Holy" then
		equip (sets.midcast.mbp)
	end

	-- Special Avatar Section
	if spell.english == "Odin" then
		equip (sets.precast.skill)
	end

	if spell.english == "Alexander" then
		equip (sets.precast.skill)
	end

	if spell.english == "Atomos" then
		equip (sets.precast.skill)
	end

	-- Spirits Section
	if spell.english == "Fire Spirit" then
		equip (sets.precast.skill)
	end

	if spell.english == "Ice Spirit" then
		equip (sets.precast.skill)
	end

	if spell.english == "Air Spirit" then
		equip (sets.precast.skill)
	end

	if spell.english == "Earth Spirit" then
		equip (sets.precast.skill)
	end

	if spell.english == "Thunder Spirit" then
		equip (sets.precast.skill)
	end

	if spell.english == "Water Spirit" then
		equip (sets.precast.skill)
	end

	if spell.english == "Light Spirit" then
		equip (sets.precast.skill)
	end

	if spell.english == "Dark Spirit" then
		equip (sets.precast.skill)
	end

	if spell.english:startswith('Garland') then
		equip(sets.midcast.garland)
	end
end
-----------------------------------------------------------------------------------

	-- This section is the aftercast section that makes it so that after any of the above abilities you get put back into the correct gearset.
	-- You can create tp_mode gearsets for ANY purpose.  Just make sure you label them correctly.  All must be in the sets.aftercast section.  For instance sets.aftercast.dw40.
	-- Don't forget to create a new gearset section defining the gear you want in it if you don't want to use my predefined sets.  Ie create a gearset for sets.aftercast.storetp.
function aftercast(spell, act, spellMap, eventArgs)
    set = sets.aftercast
	if set[prep_mode] then
		set = set[prep_mode]
	end
	equip(set)
end

