	--  Welcome to Logical's Ninja Lua.  This Lua is used for cancelling shadows when they cannot be overwritten by your current casting.
	--  It will also cancel shadows for you when necessary to recast new shadows.
	--  Please refer to my video on my NextGames YouTube channel for how to properly utilize this LUA.  

  function precast(spell, act)

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

end