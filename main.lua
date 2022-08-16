--[[
                                  Jank AA                                  
                            Made by bgamboe#7767                           
                   https://aimware.net/forum/user/403502                   
                                                                           
                    This shouldn't work, but it does...                    
                        so do what yo want with it.                        
                                                                           
       I made this AA as a part of a private script I cant give out.       
                        I made this part so I can.                         
                                                                           
                                                                           
                      Docs: https://docs.aimware.net/                      
]]--

--VARIABLES
local sweepSwitch = 1
local syncKnock = 20
-- END VARIABLES

local function JankAA(cmd) --JankAA
    if syncKnock >= 50 then --this is shit i hate it
        sweepSwitch = -sweepSwitch
        syncKnock = 20
    
        gui.SetValue('rbot.antiaim.base',179 * sweepSwitch) -- base rotation (backwards)
        gui.SetValue('rbot.antiaim.base.rotation',20 * sweepSwitch) -- desync (this moves the REAL from the FAKE, rotates REAL 20 degrees)
        gui.SetValue( 'rbot.antiaim.base.lby', 180 * sweepSwitch) -- rotates lby
    end
    if syncKnock ~= 50  and globals.TickCount() % 14 == 0 then
        syncKnock = syncKnock + 1
    
        if syncKnock % 2 == 0 then
            gui.SetValue('rbot.antiaim.base',180) -- base rotation (backwards)
            gui.SetValue('rbot.antiaim.base.rotation',syncKnock * -sweepSwitch) -- desync (this moves the REAL from the FAKE, rotates REAL 20 degrees)
            gui.SetValue('rbot.antiaim.base.lby',(math.abs(gui.GetValue( 'rbot.antiaim.base.lby' ) ) - 6) * sweepSwitch) -- rotates lby
        else
            gui.SetValue('rbot.antiaim.base',180) -- base rotation (backwards)
            gui.SetValue('rbot.antiaim.base.rotation',syncKnock * sweepSwitch) -- desync (this moves the REAL from the FAKE, rotates REAL 20 degrees)
            gui.SetValue('rbot.antiaim.base.lby',(math.abs(gui.GetValue( 'rbot.antiaim.base.lby' ) ) - 6) * -sweepSwitch) -- rotates lby
        end    
    end
end --end JankAA
