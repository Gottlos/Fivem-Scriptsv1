Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        -- Deaktiviere das Spawnen von NPC's
        SetVehiclePopulationBudget(0)
        SetPedPopulationBudget(0)
        SetRandomVehicleDensityMultiplierThisFrame(0.0)
        SetParkedVehicleDensityMultiplierThisFrame(0.0)
        SetScenarioPedDensityMultiplierThisFrame(0.0, 0.0)
        SetGarbageTrucks(false)
        SetRandomBoats(false)
        SetCreateRandomCops(false)
        SetCreateRandomCopsNotOnScenarios(false)
        SetCreateRandomCopsOnScenarios(false)
    end
end)
