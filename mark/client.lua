ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(100)
	end
end)


ConfHs0              = {}
ConfHs0.DrawDistance = 100
ConfHs0.Size         = {x = 1.0, y = 1.0, z = 1.0}
ConfHs0.Color        = {r = 255, g = 255, b = 255}
ConfHs0.Type         = 36

local position = {
        {x = -1614.08,   y = 188.93,  z = 60.03},        
}  

RMenu.Add('trx_location', 'main', RageUI.CreateMenu("Mark", "Salut gamin ! Qu'est ce qui t'ammène ?"))


Citizen.CreateThread(function()
    while true do

        RageUI.IsVisible(RMenu:Get('trx_location', 'main'), true, true, true, function()

            RageUI.Separator("↓ ~y~   Véhicules  ~s~↓")

            RageUI.ButtonWithStyle("Bmx", nil, {RightLabel = "~g~Gratuit"},true, function(Hovered, Active, Selected)
            if (Selected) then   
                TriggerServerEvent('trx_location:vehicule', 0)
                spawnCar("bmx")
                RageUI.CloseAll()
            end
            end)


        end, function()
        end)

        Citizen.Wait(0)
    end
end)



Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
    
            for k in pairs(position) do
    
                local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)
    
                if dist <= 1.0 then
                    RageUI.Text({
                        message = "Appuyez sur [~b~E~w~] pour parler avec Mark",
                        time_display = 1
                    })
                    if IsControlJustPressed(1,51) then
                        RageUI.Visible(RMenu:Get('trx_location', 'main'), not RageUI.Visible(RMenu:Get('trx_location', 'main')))
                    end   
                end
            end
        end
    end)

function spawnCar(car)
    local car = GetHashKey(car)

    RequestModel(car)
    while not HasModelLoaded(car) do
        RequestModel(car)
        Citizen.Wait(0)
    end

    local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
    local vehicle = CreateVehicle(car, -1612.69, 185.65, 59.8, 201.43, true, false)
    SetEntityAsMissionEntity(vehicle, true, true)
    local plaque = "HS0LOCAT"
    SetVehicleNumberPlateText(vehicle, plaque) 
    SetPedIntoVehicle(GetPlayerPed(-1),vehicle,-1) 
end

Citizen.CreateThread(function()
    local hash = GetHashKey("a_m_y_stbla_01")

    while not HasModelLoaded(hash) do
        RequestModel(hash)
        Wait(20)
    end

    ped = CreatePed("PED_TYPE_APPLE", "a_m_y_stbla_01", -1614.77, 188.8, 59.1, 205.67, false, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    SetEntityInvincible(ped, true)
    FreezeEntityPosition(ped, true)
end)