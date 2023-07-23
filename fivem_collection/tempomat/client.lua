local vehicleCruiser = 'off'

function GetCurrentSpeedInKMH(vehicle)
    local vehicleSpeed = GetEntitySpeed(vehicle)
    local kmhSpeed = math.ceil(vehicleSpeed * 3.6)
    return kmhSpeed
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        local player = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(player, false)

        if IsControlJustPressed(1, 306) and GetPedInVehicleSeat(vehicle, -1) == player then
            local vehicleClass = GetVehicleClass(vehicle)
            if vehicleClass ~= 13 and vehicleClass ~= 15 and vehicleClass ~= 16 then
                if vehicleCruiser == 'on' then
                    vehicleCruiser = 'off'
                    SetEntityMaxSpeed(vehicle, GetVehicleMaxSpeed(vehicle))
                    TriggerEvent('okokNotify:Alert', 'Tempomat', 'Tempomat deaktiviert', 5000, 'info')
                else
                    local kmhSpeed = GetCurrentSpeedInKMH(vehicle)
                    if kmhSpeed > 20 then
                        vehicleCruiser = 'on'
                        SetEntityMaxSpeed(vehicle, GetEntitySpeed(vehicle))
                        TriggerEvent('okokNotify:Alert', 'Tempomat', 'Tempomat aktiviert\nAktuelle Geschwindigkeit: ' .. kmhSpeed .. ' KMH', 5000, 'info')
                    end
                end
            end
        end
    end
end)
