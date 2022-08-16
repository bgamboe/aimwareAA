--VARIABLES
local sweepSwitch = 1
local syncKnock = 20
-- END VARIABLES

local function JankAA(cmd) --JankAA
    if syncKnock >= 50 then --this is shit i hate it
        sweepSwitch = -sweepSwitch
        gui.SetValue('rbot.antiaim.base',179 * sweepSwitch)
        gui.SetValue('rbot.antiaim.base.rotation',20 * sweepSwitch)
        syncKnock = 20
        gui.SetValue( 'rbot.antiaim.base.lby', 180 * sweepSwitch)
    end
    if syncKnock ~= 50  and globals.TickCount() % 14 == 0 then
        syncKnock = syncKnock + 1
        if syncKnock % 2 == 0 then
            gui.SetValue('rbot.antiaim.base',180)
            gui.SetValue('rbot.antiaim.base.rotation',syncKnock * -sweepSwitch)
            gui.SetValue('rbot.antiaim.base.lby',(math.abs(gui.GetValue( 'rbot.antiaim.base.lby' ) ) - 6) * sweepSwitch)
        else
            gui.SetValue('rbot.antiaim.base',180)
            gui.SetValue('rbot.antiaim.base.rotation',syncKnock * sweepSwitch)
            gui.SetValue('rbot.antiaim.base.lby',(math.abs(gui.GetValue( 'rbot.antiaim.base.lby' ) ) - 6) * -sweepSwitch)
        end    
    end
end --end JankAA
