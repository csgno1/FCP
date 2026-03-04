-- FCP by Harpo

-- VO manufacturing helper plugin, mainly for items where many of the same are needed

-- version: 1.15 2026/02/14 - Bug fixes
-- version: 1.14 2024/01/12 - added /dbha for docking bay hanger assembly and /mos for the milinar optical sensor
-- version: 1.13 2024/01/07 - added /engine
-- version: 1.12 2023/01/26 - added Goliath /goli
-- version: 1.11 2021/09/21 - added PCB turrets: /pcb
-- version: 1.10 2017/12/13 - added /ihdpc
-- version: 1.09 2016/11/03 - added /TU mine launchers
-- version: 1.08 2015/01/14 - added Corvus Widowmakers: /cwm
-- version: 1.07 2014/12/06 - added Milanar Master Computing System: /mmc
-- version: 1.06 2014/12/05 - added External Hull Assembly: /eha
-- version: 1.05 2014/12/02 - Bug fixes, big nasty bugs
-- version: 1.04 2014/11/30 - added Internal Bulkhead Assembly: /iba
-- version: 1.03 2014/11/28 - added Merged Cybernetics Array: /mca
-- version: 1.02 2014/09/09 - added Firecracker turret: /fc or /firecracker
-- version: 1.01 2014/06/21 - added Reinforced Bulkhead: /rb or /rib
-- version: 1.0 2014/06/15  - Initial release

-- Planned improvements:
--	/TTM command for final trident mission

-- Dependancies: none

-- usage:
-- /fcp or /ffsa or /ffssa or /rb or /rib or /fc or /firecracker or /mca or /iba or /mmc or /engine or /goli or /dbha
-- For corvus widowmakers the station is the parameter:  /cwm "Bractus D-9"
-- To see more detail after typing one of the above, toggle the console by typing ' and look at the bottom

function harpo_fcp(_, args)
	local tally = {}
	local location = ""
	local iname = ""
	local qty = 0
	local lowest = 9999
	local limiter = ""
	tally.sss = 0; tally.ss = 0; tally.sh = 0; tally.ohp = 0; tally.ps = 0; tally.xa = 0; tally.ho = 0; tally.po = 0
	console_print("Item, Number of FCP's worth of item...")
	for i,v in PlayerInventoryPairs() do 
		location = ShortLocationStr(SplitStationID(GetInventoryItemLocation(i)))
		if location == "Latos I-8" then
			iname = GetInventoryItemName(i)
				qty = GetInventoryItemQuantity(i)
				if iname == "Synthetic Silksteel" 		then tally.sss = tally.sss + qty / 8 end
				if iname == "Silksteel" 				then tally.ss = tally.ss + qty / 8 end
				if iname == "Synthetic Hydrocarbons" 	then tally.sh = tally.sh + qty / 15 end
				if iname == "Outer Hull Plate" 			then tally.ohp = tally.ohp + qty / 15 end
				if iname == "Plasteel" 					then tally.ps = tally.ps + qty / 5 end
				if iname == "XiRite Alloy" 				then tally.xa = tally.xa + qty / 10 end
				if iname == "Heliocene Ore" 			then tally.ho = tally.ho + qty / 3 end
				if iname == "Pentric Ore" 				then tally.po = tally.po + qty / 2 end
		end
	end
	for i, v in pairs(tally) do
		console_print(i .. " -> " .. math.floor(v))
		if math.floor(v) < lowest then
			lowest = math.floor(v)
			limiter = i
		end
	end
	sectorprint("Can currently build maximum of " .. math.floor(lowest) .. " FCP using current inventory in i8, limited by " .. limiter)
end

function harpo_engine(_, args)
	local tally = {}
	local location = ""
	local iname = ""
	local qty = 0
	local lowest = 9999
	local limiter = ""
	tally.sss = 0; tally.fcp = 0; tally.lanth = 0; tally.ffsa = 0; tally.helio = 0; tally.HydraulicTappets = 0; 
	tally.ishik = 0;  tally.DataLinkConnectors = 0; tally.coolant = 0; tally.EnergyConversionModules = 0;
	tally.PowerRegulators = 0; tally.sh = 0; tally.xith = 0; tally.ferric = 0; tally.carbonic = 0;
	console_print("Item, Number of engine worth of item...")
	for i,v in PlayerInventoryPairs() do 
		location = ShortLocationStr(SplitStationID(GetInventoryItemLocation(i)))
		if location == "Latos I-8" then
			iname = GetInventoryItemName(i)
				qty = GetInventoryItemQuantity(i)
				-- console_print(location .. " " .. iname .. " " .. qty)
				if iname == "Synthetic Silksteel" 				then tally.sss = tally.sss + qty / 8 end
				if iname == "Fused Composite Plating" 			then tally.fcp = tally.fcp + qty / 8 end
				if iname == "Fluid Formable Silksteel Alloy" 	then tally.ffsa = tally.ffsa + qty / 25 end
				if iname == "Hydraulic Tappets" 				then 
											tally.HydraulicTappets = tally.HydraulicTappets + qty / 16 end
				if iname == "Premium Ishik Ore" 				then tally.ishik = tally.ishik + qty / 16 end
				if iname == "Heliocene Ore" 					then tally.helio = tally.helio + qty / 8 end
				if iname == "Lanthanic Ore" 					then tally.lanth = tally.lanth + qty / 22 end
				if iname == "Data Link Connectors" 				then 
											tally.DataLinkConnectors = tally.DataLinkConnectors + qty / 16 end
				if iname == "Coolant" 							then tally.coolant = tally.coolant + qty / 250 end
				if iname == "Energy Conversion Module" 			then 
											tally.EnergyConversionModules = tally.EnergyConversionModules + qty / 4 end
				if iname == "Power Regulators" 					then 
											tally.PowerRegulators = tally.PowerRegulators + qty / 90 end
				if iname == "Synthetic Hydrocarbons" 			then tally.sh = tally.sh + qty / 22 end
				if iname == "Premium Xithricite Ore" 			then tally.xith = tally.xith + qty / 50 end
				if iname == "Premium Ferric Ore" 				then tally.ferric = tally.ferric + qty / 180 end
				if iname == "Premium Carbonic Ore" 				then tally.carbonic = tally.carbonic + qty / 240 end
		end
	end
	for i, v in pairs(tally) do
		console_print(i .. " -> " .. math.floor(v))
		if math.floor(v) < lowest then
			lowest = math.floor(v)
			limiter = i
		end
	end
	sectorprint("Can currently build maximum of " .. math.floor(lowest) .. " engines using current inventory in i8, limited by " .. limiter)
end

function harpo_ihdpc(_, args)
	local tally = {}
	local location = ""
	local iname = ""
	local qty = 0
	local lowest = 9999
	local limiter = ""
	tally.sss = 0; 
	tally.sp = 0; 
	tally.co = 0; 
	tally.fo = 0; 
	tally.io = 0; 
	tally.va = 0
	tally.cc = 0
	tally.pr = 0
	tally.sm = 0
	tally.hic = 0
	console_print("Item, Number of IHDPC's worth of item...")
	for i,v in PlayerInventoryPairs() do 
		location = ShortLocationStr(SplitStationID(GetInventoryItemLocation(i)))
		if location == "Verasi E-14" then
			iname = GetInventoryItemName(i)
				qty = GetInventoryItemQuantity(i)
				if iname == "Synthetic Silksteel"		then tally.sss = tally.sss + qty / 1 end
				if iname == "Corrosive Chemicals"		then tally.cc = tally.cc + qty / 7 end
				if iname == "Premium Carbonic Ore"		then tally.co = tally.co + qty / 6 end
				if iname == "Simple Plastics"			then tally.sp = tally.sp + qty / 2 end
				if iname == "Power Regulators"			then tally.pr = tally.pr + qty / 1 end
				if iname == "Premium Ferric Ore"		then tally.fo = tally.fo + qty / 4 end
				if iname == "Premium Ishik Ore"			then tally.io = tally.io + qty / 2 end
				if iname == "Scrap Metal"				then tally.sm = tally.sm + qty / 3 end
				if iname == "Hydrogen Ion Collector"	then tally.hic = tally.hic + qty / 1 end
				if iname == "Premium VanAzek Ore"		then tally.va = tally.va + qty / 5 end
		end
	end
	for i, v in pairs(tally) do
		console_print(i .. " -> " .. math.floor(v))
		if math.floor(v) < lowest then
			lowest = math.floor(v)
			limiter = i
		end
	end
	sectorprint("Can currently build maximum of " .. math.floor(lowest) .. " IHDPC using current inventory in E-14, limited by " .. limiter)
end

function harpo_ffsa(_, args)
	local tally = {}
	local location = ""
	local iname = ""
	local qty = 0
	local lowest = 9999
	local limiter = ""
	tally.sss = 0; tally.ss = 0; tally.co = 0; tally.lo = 0; tally.ho = 0; tally.va = 0
	console_print("Item, Number of FFSA's worth of item...")
	for i,v in PlayerInventoryPairs() do 
		location = ShortLocationStr(SplitStationID(GetInventoryItemLocation(i)))
		if location == "Pelatus C-12" then
			iname = GetInventoryItemName(i)
				qty = GetInventoryItemQuantity(i)
				if iname == "Synthetic Silksteel"	then tally.sss = tally.sss + qty / 8 end
				if iname == "Silksteel"				then tally.ss = tally.ss + qty / 50 end
				if iname == "Premium Carbonic Ore"	then tally.co = tally.co + qty / 5 end
				if iname == "Heliocene Ore"			then tally.ho = tally.ho + qty / 3 end
				if iname == "Lanthanic Ore"			then tally.lo = tally.lo + qty / 6 end
				if iname == "Premium VanAzek Ore"	then tally.va = tally.va + qty / 10 end
		end
	end
	for i, v in pairs(tally) do
		console_print(i .. " -> " .. math.floor(v))
		if math.floor(v) < lowest then
			lowest = math.floor(v)
			limiter = i
		end
	end
	sectorprint("Can currently build maximum of " .. math.floor(lowest) .. " FFSA using current inventory in c12, limited by " .. limiter)
end

function harpo_rib(_, args)
	local tally = {}
	local location = ""
	local iname = ""
	local qty = 0
	local lowest = 9999
	local limiter = ""
	tally.ffsa = 0; tally.ss = 0; tally.fcp = 0; tally.io = 0; tally.ho = 0; tally.lo = 0
	console_print("Item, Number of RIB's worth of item...")
	for i,v in PlayerInventoryPairs() do 
		location = ShortLocationStr(SplitStationID(GetInventoryItemLocation(i)))
		if location == "Nyrius F-6" then
			iname = GetInventoryItemName(i)
			if iname == "Fluid Formable Silksteel Alloy" or iname == "Heliocene Ore" or iname == "Lanthanic Ore" 
						or iname == "Fused Composite Plating" or iname == "Premium Ishik Ore" or iname == "Silksteel" then
				qty = GetInventoryItemQuantity(i)
				if iname == "Fluid Formable Silksteel Alloy"	then tally.ffsa = tally.ffsa + qty / 5 end
				if iname == "Silksteel"							then tally.ss = tally.ss + qty / 6 end
				if iname == "Premium Ishik Ore"					then tally.io = tally.io + qty / 8 end
				if iname == "Heliocene Ore"						then tally.ho = tally.ho + qty / 2 end
				if iname == "Lanthanic Ore"						then tally.lo = tally.lo + qty / 4 end
				if iname == "Fused Composite Plating"			then tally.fcp = tally.fcp + qty / 2 end
			end
		end
	end
	for i, v in pairs(tally) do
		console_print(i .. " -> " .. math.floor(v))
		if math.floor(v) < lowest then
			lowest = math.floor(v)
			limiter = i
		end
	end
	sectorprint("Can currently build maximum of " .. math.floor(lowest) .. " RB using current inventory in f6, limited by " .. limiter)
end

function harpo_fury(_, args)
	local tally = {}
	local location = ""
	local iname = ""
	local qty = 0
	local lowest = 9999
	local limiter = ""
	tally.ApicineOre = 0; tally.XithriciteOre = 0; tally.Lanthanic = 0; tally.AqueanOre = 0; tally.lcd = 0; tally.gyro = 0; tally.GuardianProcessorCore = 0; tally.AdvancedLogisticsSystem = 0
	console_print("Item, Number of Furies worth of item...")
	for i,v in PlayerInventoryPairs() do 
		location = ShortLocationStr(SplitStationID(GetInventoryItemLocation(i)))
		if location == "Verasi E-14" then
			iname = GetInventoryItemName(i)
				qty = GetInventoryItemQuantity(i)
				if iname == "Premium Aquean Ore"		then tally.AqueanOre = tally.AqueanOre + qty / 40 end
				if iname == "Premium Xithricite Ore"	then tally.XithriciteOre = tally.XithriciteOre + qty / 30 end
				if iname == "Apicene Ore"				then tally.ApicineOre = tally.ApicineOre + qty / 10 end
				if iname == "LCD"						then tally.lcd = tally.lcd + qty / 6 end
				if iname == "Lanthanic Ore"				then tally.Lanthanic = tally.Lanthanic + qty / 20 end
				if iname == "Gyroscopes"				then tally.gyro = tally.gyro + qty / 6 end
				if iname == "Guardian Processor Core"	then tally.GuardianProcessorCore = tally.GuardianProcessorCore + qty / 3 end
				if iname == "Advanced Logistics System"	then tally.AdvancedLogisticsSystem = tally.AdvancedLogisticsSystem + qty / 1 end
		end
	end
	for i, v in pairs(tally) do
		console_print(i .. " -> " .. math.floor(v))
		if math.floor(v) < lowest then
			lowest = math.floor(v)
			limiter = i
		end
	end
	sectorprint("Can currently build maximum of " .. math.floor(lowest) .. " Fury(ies) using current inventory in e14, limited by " .. limiter)
end

function harpo_firecracker(_, args)
	local tally = {}
	local location = ""
	local iname = ""
	local qty = 0
	local lowest = 9999
	local limiter = ""
	tally.PowerReg = 0; tally.GuidedMissileCasings = 0; tally.SolidFuel = 0; tally.AdvancedTargetingSystems = 0; tally.Plasteel = 0; 
	tally.Helio = 0; tally.Pentric = 0; tally.SoidExplosives = 0; tally.DentekProcessor = 0
	console_print("Item, Number of Firecrackers worth of item...")
	for i,v in PlayerInventoryPairs() do 
		location = ShortLocationStr(SplitStationID(GetInventoryItemLocation(i)))
		if location == "Bractus M-14" then
			iname = GetInventoryItemName(i)
			qty = GetInventoryItemQuantity(i)
			if iname == "Power Regulators"				then tally.PowerReg = tally.PowerReg + qty / 1 end
			if iname == "Guided Missile Casings"		then tally.GuidedMissileCasings = tally.GuidedMissileCasings + qty / 6 end
			if iname == "Solid Fuel Packs"				then tally.SolidFuel = tally.SolidFuel + qty / 6 end
			if iname == "Plasteel"						then tally.Plasteel = tally.Plasteel + qty / 2 end
			if iname == "Heliocene Ore"					then tally.Helio = tally.Helio + qty / 4 end
			if iname == "Pentric Ore"					then tally.Pentric = tally.Pentric + qty / 2 end
			if iname == "Solid Explosives"				then tally.SoidExplosives = tally.SoidExplosives + qty / 3 end
			if iname == "Dentek Processor Core"			then tally.DentekProcessor = tally.DentekProcessor + qty / 2 end
			if iname == "Advanced Targeting Systems"	then tally.AdvancedTargetingSystems = tally.AdvancedTargetingSystems + qty / 1 end
		end
	end
	for i, v in pairs(tally) do
		console_print(i .. " -> " .. math.floor(v))
		if math.floor(v) < lowest then
			lowest = math.floor(v)
			limiter = i
		end
	end
	sectorprint("Can currently build maximum of " .. math.floor(lowest) .. " Firecracker(s) using current inventory in m14, limited by " .. limiter)
end

function harpo_mca(_, args)
	local tally = {}
	local location = ""
	local iname = ""
	local qty = 0
	local lowest = 9999
	local limiter = ""
	tally.Lanthanic = 0; tally.DataLinkConnectors = 0; tally.Superconductors = 0; tally.MilanarNeuralNodules = 0; 
	tally.ProsusNeuralNodules = 0; tally.CyberneticsGradeEE = 0;
	tally.ThermalInsulatorTiles = 0; tally.Pentric = 0; tally.SieposNeuralNodules = 0; tally.UnassembledCargoCrates = 0
	console_print("Item, Number of MCA worth of item...")
	for i,v in PlayerInventoryPairs() do 
		location = ShortLocationStr(SplitStationID(GetInventoryItemLocation(i)))
		if location == "Bractus M-14" then
			iname = GetInventoryItemName(i)
			qty = GetInventoryItemQuantity(i)
			if iname == "Lanthanic Ore"					then tally.Lanthanic = tally.Lanthanic + qty / 16 end
			if iname == "Data Link Connectors"			then tally.DataLinkConnectors = tally.DataLinkConnectors + qty / 20 end
			if iname == "Superconductors"				then tally.Superconductors = tally.Superconductors + qty / 12 end
			if iname == "Thermal Insulator Tiles"		then tally.ThermalInsulatorTiles = tally.ThermalInsulatorTiles + qty / 15 end
			if iname == "Unassembled Cargo Crates"		then tally.UnassembledCargoCrates = tally.UnassembledCargoCrates + qty / 1 end
			if iname == "Pentric Ore"					then tally.Pentric = tally.Pentric + qty / 6 end
			if iname == "Milanar Neural Nodule"			then tally.MilanarNeuralNodules = tally.MilanarNeuralNodules + qty / 1 end
			if iname == "Prosus Neural Nodule"			then tally.ProsusNeuralNodules = tally.ProsusNeuralNodules + qty / 1 end
			if iname == "Siepos Neural Nodule"			then tally.SieposNeuralNodules = tally.SieposNeuralNodules + qty / 1 end
			if iname == "Cybernetics Grade EE"			then tally.CyberneticsGradeEE = tally.CyberneticsGradeEE + qty / 4 end
		end
	end
	for i, v in pairs(tally) do
		console_print(i .. " -> " .. math.floor(v))
		if math.floor(v) < lowest then
			lowest = math.floor(v)
			limiter = i
		end
	end
	sectorprint("Can currently build maximum of " .. math.floor(lowest) .. " Merged Cybernetics Array(s) using current inventory in m14, limited by " .. limiter)
end

function harpo_iba(_, args)
	local tally = {}
	local location = ""
	local iname = ""
	local qty = 0
	local lowest = 9999
	local limiter = ""
	tally.Lanthanic = 0; tally.DataLinkConnectors = 0; tally.Carbonic = 0; tally.Heliocene = 0; 
	tally.ffsa = 0; tally.rb = 0; tally.xith = 0; tally.FireSuppressionSystem = 0;
	console_print("Item, Number of Internal Bulkhead Assembly worth of item...")
	for i,v in PlayerInventoryPairs() do 
		location = ShortLocationStr(SplitStationID(GetInventoryItemLocation(i)))
		if location == "Latos I-8" then
			iname = GetInventoryItemName(i)
			qty = GetInventoryItemQuantity(i)
			if iname == "Lanthanic Ore"						then tally.Lanthanic = tally.Lanthanic + qty / 9 end
			if iname == "Data Link Connectors"				then tally.DataLinkConnectors = tally.DataLinkConnectors + qty / 20 end
			if iname == "Heliocene Ore"						then tally.Heliocene = tally.Heliocene + qty / 7 end
			if iname == "Premium Carbonic Ore"				then tally.Carbonic = tally.Carbonic + qty / 90 end
			if iname == "Fluid Formable Silksteel Alloy"	then tally.ffsa = tally.ffsa + qty / 1 end
			if iname == "Reinforced Bulkhead"				then tally.rb = tally.rb + qty / 3 end
			if iname == "Premium Xithricite Ore"			then tally.xith = tally.xith + qty / 40 end
			if iname == "Fire-suppression system"			then tally.FireSuppressionSystem = tally.FireSuppressionSystem + qty / 1 end
		end
	end
	for i, v in pairs(tally) do
		console_print(i .. " -> " .. math.floor(v))
		if math.floor(v) < lowest then
			lowest = math.floor(v)
			limiter = i
		end
	end
	sectorprint("Can currently build maximum of " .. math.floor(lowest) .. " Internal Bulkhead Assembly(s) using current inventory in i8, limited by " .. limiter)
end

function harpo_eha(_, args)
	local tally = {}
	local location = ""
	local iname = ""
	local qty = 0
	local lowest = 9999
	local limiter = ""
	tally.Lanthanic = 0; tally.VanAzek = 0; tally.Carbonic = 0; tally.Heliocene = 0; tally.ffsa = 0; tally.fcp = 0; tally.iba = 0; tally.HullPanels = 0;
	console_print("Item, Number of External Hull Assembly(s) worth of item...")
	for i,v in PlayerInventoryPairs() do 
		location = ShortLocationStr(SplitStationID(GetInventoryItemLocation(i)))
		if location == "Latos I-8" then
			iname = GetInventoryItemName(i)
			qty = GetInventoryItemQuantity(i)
			if iname == "Lanthanic Ore"						then tally.Lanthanic = tally.Lanthanic + qty / 9 end
			if iname == "Premium VanAzek Ore"				then tally.VanAzek = tally.VanAzek + qty / 19 end
			if iname == "Heliocene Ore"						then tally.Heliocene = tally.Heliocene + qty / 7 end
			if iname == "Premium Carbonic Ore"				then tally.Carbonic = tally.Carbonic + qty / 70 end
			if iname == "Fluid Formable Silksteel Alloy"	then tally.ffsa = tally.ffsa + qty / 5 end
			if iname == "Fused Composite Plating"			then tally.fcp = tally.fcp + qty / 5 end
			if iname == "Internal Bulkhead Assembly"		then tally.iba = tally.iba + qty / 2 end
			if iname == "Hull Panels"						then tally.HullPanels = tally.HullPanels + qty / 250 end
		end
	end
	for i, v in pairs(tally) do
		console_print(i .. " -> " .. math.floor(v))
		if math.floor(v) < lowest then
			lowest = math.floor(v)
			limiter = i
		end
	end
	sectorprint("Can currently build maximum of " .. math.floor(lowest) .. " External Hull Assembly(s) using current inventory in i8, limited by " .. limiter)
end

function harpo_mmc(_, args)
	local tally = {}
	local location = ""
	local iname = ""
	local qty = 0
	local lowest = 9999
	local limiter = ""
	tally.Lanthanic = 0; tally.Ishik = 0; tally.DataLinkConnectors = 0; tally.mca = 0; tally.aggy = 0; tally.Superconductors = 0; 
	tally.ThermalInsulatorTiles = 0; tally.CybernetticsGradeFF = 0; tally.UnassembledCargoCrates = 0;
	console_print("Item, Number of Milanar Master Computing Systems worth of item...")
	for i,v in PlayerInventoryPairs() do 
		location = ShortLocationStr(SplitStationID(GetInventoryItemLocation(i)))
		if location == "Bractus M-14" then
			iname = GetInventoryItemName(i)
			qty = GetInventoryItemQuantity(i)
			if iname == "Lanthanic Ore"				then tally.Lanthanic = tally.Lanthanic + qty / 250 end
			if iname == "Ishik Ore"					then tally.Ishik = tally.Ishik + qty / 9 end
			if iname == "Data Link Connectors"		then tally.DataLinkConnectors = tally.DataLinkConnectors + qty / 256 end
			if iname == "Merged Cybernetics Array"	then tally.mca = tally.mca + qty / 64 end
			if iname == "Milanar Data Aggregator"	then tally.aggy = tally.aggy + qty / 1 end
			if iname == "Superconductors"			then tally.Superconductors = tally.Superconductors + qty / 64 end
			if iname == "Thermal Insulator Tiles"	then tally.ThermalInsulatorTiles = tally.ThermalInsulatorTiles + qty / 24 end
			if iname == "Cybernetics Grade FF"		then tally.CybernetticsGradeFF = tally.CybernetticsGradeFF + qty / 8 end
			if iname == "Unassembled Cargo Crates"	then tally.UnassembledCargoCrates = tally.UnassembledCargoCrates + qty / 1 end
		end
	end
	for i, v in pairs(tally) do
		console_print(i .. " -> " .. math.floor(v))
		if math.floor(v) < lowest then
			lowest = math.floor(v)
			limiter = i
		end
	end
	sectorprint("Can currently build maximum of " .. math.floor(lowest) .. " Milanar Master Computing Systems using current inventory in i8, limited by " .. limiter)
end

function harpo_cwm(_, args)
	local tally = {}
	local location = ""
	local place = ""
	local iname = ""
	local qty = 0
	local lowest = 9999
	local limiter = ""
	tally.Lanthanic = 0; tally.Heliocene = 0; tally.VanAzek = 0; 	tally.Carbonic = 0; tally.PowerRegulators = 0; 	tally.IonCore = 0; 
	tally.Silksteel = 0; tally.DentecProcessor = 0; tally.GuardianProcessor = 0;
	console_print("Item, Number of Widow Makers worth of item...")
	for i,v in PlayerInventoryPairs() do 
		location = ShortLocationStr(SplitStationID(GetInventoryItemLocation(i)))
		if args == nil then 
			place = "Bractus D-9"
		else
			place = args[1]
		end
		if string.lower(location) == string.lower(place) then
			iname = GetInventoryItemName(i)
			qty = GetInventoryItemQuantity(i)
			if iname == "Lanthanic Ore"				then tally.Lanthanic = tally.Lanthanic + qty / 15 end
			if iname == "Heliocene Ore"				then tally.Heliocene = tally.Heliocene + qty / 15 end
			if iname == "Premium VanAzek Ore"		then tally.VanAzek = tally.VanAzek + qty / 10 end
			if iname == "Premium Carbonic Ore"		then tally.Carbonic = tally.Carbonic + qty / 15 end
			if iname == "Power Regulators"			then tally.PowerRegulators = tally.PowerRegulators + qty / 2 end
			if iname == "Ion Core"					then tally.IonCore = tally.IonCore + qty / 1 end
			if iname == "Silksteel"					then tally.Silksteel = tally.Silksteel + qty / 10 end
			if iname == "Dentek Processor Core"		then tally.DentecProcessor = tally.DentecProcessor + qty / 2 end
			if iname == "Guardian Processor Core"	then tally.GuardianProcessor = tally.GuardianProcessor + qty / 1 end
		end
	end
	for i, v in pairs(tally) do
		console_print(i .. " -> " .. math.floor(v))
		if math.floor(v) < lowest then
			lowest = math.floor(v)
			limiter = i
		end
	end
	sectorprint("Can currently build maximum of " .. math.floor(lowest) .. " Corvus Widowmakers using current inventory in " .. place .. ", limited by " .. limiter)
end

function harpo_tu(_, args)
	local tally = {}
	local location = ""
	local place = ""
	local iname = ""
	local qty = 0
	local lowest = 9999
	local limiter = ""

	tally.Pentric = 0; 
	tally.VanAzek = 0; 
	tally.Carbonic = 0; 
	tally.Ferric = 0; 
	tally.Silicate = 0; 
	tally.Xithricite = 0; 
	tally.PowerRegulators = 0; 
	tally.HullPanels = 0;
	tally.SolidExplosives = 0;
	tally.Plasteel = 0;
	tally.AmplificationModules = 0;
	tally.PlasmaCores = 0;
	tally.XiriteAlloy = 0;
	tally.OuterHullPlates = 0;
	tally.ArtemisProcessor = 0;
	tally.GuardianProcessor = 0;
	tally.DentekProcessor = 0;
	tally.QueenProcessor = 0;

	console_print("Item, Number of TU(s) worth of item...")
	for i,v in PlayerInventoryPairs() do 
		location = ShortLocationStr(SplitStationID(GetInventoryItemLocation(i)))
				if args == nil then 
			place = "Latos I-8"
		else
			place = args[1]
		end
		if string.lower(location) == string.lower(place) then
			iname = GetInventoryItemName(i)
			qty = GetInventoryItemQuantity(i)
			if iname == "Pentric Ore"						then tally.Pentric = tally.Pentric + qty / 40 end
			if iname == "Premium VanAzek Ore"				then tally.VanAzek = tally.VanAzek + qty / 50 end
			if iname == "Power Regulators"					then tally.PowerRegulators = tally.PowerRegulators + qty / 16 end
			if iname == "Premium Carbonic Ore"				then tally.Carbonic = tally.Carbonic + qty / 280 end
			if iname == "Premium Ferric Ore"				then tally.Ferric = tally.Ferric + qty / 460 end
			if iname == "Premium Silicate Ore"				then tally.Silicate = tally.Silicate + qty / 80 end
			if iname == "Premium Xithricite Ore"			then tally.Xithricite = tally.Xithricite + qty / 60 end
			if iname == "Hull Panels"						then tally.HullPanels = tally.HullPanels + qty / 4 end
			if iname == "Solid Explosives"					then tally.SolidExplosives = tally.SolidExplosives + qty / 4 end
			if iname == "Plasteel"							then tally.Plasteel = tally.Plasteel + qty / 4 end
			if iname == "Amplification Module"				then tally.AmplificationModules = tally.AmplificationModules + qty / 20 end
			if iname == "Plasma Core"						then tally.PlasmaCores = tally.PlasmaCores + qty / 16 end
			if iname == "XiRite Alloy"						then tally.XiriteAlloy = tally.XiriteAlloy + qty / 10 end
			if iname == "Outer Hull Plate"					then tally.OuterHullPlates = tally.OuterHullPlates + qty / 6 end
			if iname == "Artemis Processor Core"			then tally.ArtemisProcessor = tally.ArtemisProcessor + qty / 24 end
			if iname == "Guardian Processor Core"			then tally.GuardianProcessor = tally.GuardianProcessor + qty / 16 end
			if iname == "Dentek Processor Core"				then tally.DentekProcessor = tally.DentekProcessor + qty / 4 end
			if iname == "Queen Processor Core"				then tally.QueenProcessor = tally.QueenProcessor + qty / 4 end
		end
	end
	for i, v in pairs(tally) do
		console_print(i .. " -> " .. math.floor(v))
		if math.floor(v) < lowest then
			lowest = math.floor(v)
			limiter = i
		end
	end
	sectorprint("Can currently build maximum of " .. math.floor(lowest) .. " TU(s) using current inventory in " .. place .. ", limited by " .. limiter)
end

function harpo_pcb(_, args)
	local tally = {}
	local location = ""
	local iname = ""
	local qty = 0
	local lowest = 9999
	local limiter = ""
	tally.Lanthanic = 0; tally.PowerRegulators = 0; tally.Carbonic = 0; tally.VanAzek = 0; tally.AdvancedTargetingSystems = 0;
	tally.Pentric = 0; tally.Lanthanic = 0; tally.Magnetometer = 0; tally.Silksteel = 0; tally.ArtemisProcessor = 0;
	console_print("Item, Number of PCB Turrets worth of item...")
	for i,v in PlayerInventoryPairs() do 
		location = ShortLocationStr(SplitStationID(GetInventoryItemLocation(i)))
		if location == "Pelatus C-12" then
			iname = GetInventoryItemName(i)
			qty = GetInventoryItemQuantity(i)
			if iname == "Lanthanic Ore"				then tally.Lanthanic = tally.Lanthanic + qty / 8 end
			if iname == "Power Regulators"			then tally.PowerRegulators = tally.PowerRegulators + qty / 10 end
			if iname == "Premium Carbonic Ore"		then tally.Carbonic = tally.Carbonic + qty / 20 end
			if iname == "Premium VanAzek Ore"		then tally.VanAzek = tally.VanAzek + qty / 30 end
			if iname == "Advanced Targeting Systems" then tally.AdvancedTargetingSystems = tally.AdvancedTargetingSystems + qty / 4 end
			if iname == "Pentric Ore"				then tally.Pentric = tally.Pentric + qty / 16 end
			if iname == "Magnetometer"				then tally.Magnetometer = tally.Magnetometer + qty / 1 end
			if iname == "Silksteel"					then tally.Silksteel = tally.Silksteel + qty / 10 end
			if iname == "Artemis Processor Core"	then tally.ArtemisProcessor = tally.ArtemisProcessor + qty / 2 end
		end
	end
	for i, v in pairs(tally) do
		console_print(i .. " -> " .. math.floor(v))
		if math.floor(v) < lowest then
			lowest = math.floor(v)
			limiter = i
		end
	end
	sectorprint("Can currently build maximum of " .. math.floor(lowest) .. " PCB Turrets using current inventory in c12, limited by " .. limiter)
end

function harpo_goli(_, args)
	local tally = {}
	local location = ""
	local iname = ""
	local qty = 0
	local lowest = 9999
	local limiter = ""

	tally.ArtemisProcessorCore = 0; tally.z200MWToroidalHyperPlasmaReactor = 0; tally.z80MWInvertedPulseDisplacementEngine = 0;
	tally.DockingBayHangerAssembly = 0; tally.EnginePylonAssembly = 0; tally.ExternalHullAssembly = 0;
	tally.FluidFormableSilksteelAlloy = 0; tally.FusedCompositePlating = 0; tally.InternalBulkheadAssembly = 0;
	tally.MilanarMasterComputingSystem = 0; tally.MilanarOpticalSensor = 0; tally.AdvancedTargetingSystems = 0;
	tally.AirlockMaintenanceSupplies = 0; tally.BasicTargetingSystems = 0; tally.BearingGrease = 0;
	tally.CommercialTextiles = 0; tally.CoolingSystems = 0; tally.DataLinkConnectors = 0;
	tally.DopplerArray = 0; tally.EscapeHatchSystem = 0; tally.ExhaustManifold = 0;
	tally.ExternalEquipmentMounts = 0; tally.ExternalThermalCouplers = 0; tally.ExtravehicularSuits = 0;
	tally.FireSuppressionsystem = 0; tally.FlightAssistControlModule = 0; tally.FrequencyModulators = 0;
	tally.Gyroscopes = 0; tally.InstrumentationPanel = 0; tally.LifeSupportSystem = 0; tally.NavigationUnit = 0; 
	tally.OuterHullPlate = 0; tally.OxygenRecyclingSystem = 0; tally.PilotSafetyHarness = 0; tally.PowerRegulators = 0;
	tally.ShipPaint = 0; tally.StabilizingSystems = 0; tally.HullPanels = 0; tally.ApiceneOre = 0; tally.DenicOre = 0;
	tally.HelioceneOre = 0; tally.LanthanicOre = 0; tally.PremiumFerricOre = 0; tally.PremiumSilicateOre = 0;
	tally.PremiumVanAzekOre = 0; tally.PremiumXithriciteOre = 0; tally.PremiumCarbonicOre = 0; tally.PremiumIshikOre = 0;

	console_print("Item, Number of Goliaths worth of item...")
	for i,v in PlayerInventoryPairs() do 
		location = ShortLocationStr(SplitStationID(GetInventoryItemLocation(i)))
		if location == "Latos M-7" then
			iname = GetInventoryItemName(i)
			qty = GetInventoryItemQuantity(i)
			if iname == "Artemis Processor Core" then tally.ArtemisProcessorCore = tally.ArtemisProcessorCore + qty / 100 end
			if iname == "200MW Toroidal Hyper-Plasma Reactor" then tally.z200MWToroidalHyperPlasmaReactor = tally.z200MWToroidalHyperPlasmaReactor + qty / 1 end
			if iname == "80MW Inverted Pulse Displacement Engine" then tally.z80MWInvertedPulseDisplacementEngine = tally.z80MWInvertedPulseDisplacementEngine + qty / 1 end
			if iname == "Docking Bay Hanger Assembly" then tally.DockingBayHangerAssembly = tally.DockingBayHangerAssembly + qty / 1 end
			if iname == "Engine Pylon Assembly" then tally.EnginePylonAssembly = tally.EnginePylonAssembly + qty / 1 end
			if iname == "External Hull Assembly" then tally.ExternalHullAssembly = tally.ExternalHullAssembly + qty / 2 end
			if iname == "Fluid Formable Silksteel Alloy" then tally.FluidFormableSilksteelAlloy = tally.FluidFormableSilksteelAlloy + qty / 8 end
			if iname == "Fused Composite Plating" then tally.FusedCompositePlating = tally.FusedCompositePlating + qty / 10 end
			if iname == "Internal Bulkhead Assembly" then tally.InternalBulkheadAssembly = tally.InternalBulkheadAssembly + qty / 2 end
			if iname == "Milanar Master Computing System" then tally.MilanarMasterComputingSystem = tally.MilanarMasterComputingSystem + qty / 1 end
			if iname == "Milanar Optical Sensor" then tally.MilanarOpticalSensor = tally.MilanarOpticalSensor + qty / 1 end
			if iname == "Advanced Targeting Systems" then tally.AdvancedTargetingSystems = tally.AdvancedTargetingSystems + qty / 2 end
			if iname == "Airlock Maintenance Supplies" then tally.AirlockMaintenanceSupplies = tally.AirlockMaintenanceSupplies + qty / 3 end
			if iname == "Basic Targeting Systems" then tally.BasicTargetingSystems = tally.BasicTargetingSystems + qty / 3 end
			if iname == "Bearing Grease" then tally.BearingGrease = tally.BearingGrease + qty / 7 end
			if iname == "Commercial Textiles" then tally.CommercialTextiles = tally.CommercialTextiles + qty / 4 end
			if iname == "Cooling Systems" then tally.CoolingSystems = tally.CoolingSystems + qty / 12 end
			if iname == "Data Link Connectors" then tally.DataLinkConnectors = tally.DataLinkConnectors + qty / 140 end
			if iname == "Doppler Array" then tally.DopplerArray = tally.DopplerArray + qty / 2 end
			if iname == "Escape Hatch System" then tally.EscapeHatchSystem = tally.EscapeHatchSystem + qty / 1 end
			if iname == "Exhaust Manifold" then tally.ExhaustManifold = tally.ExhaustManifold + qty / 2 end
			if iname == "External Equipment Mounts" then tally.ExternalEquipmentMounts = tally.ExternalEquipmentMounts + qty / 6 end
			if iname == "External Thermal Couplers" then tally.ExternalThermalCouplers = tally.ExternalThermalCouplers + qty / 6 end
			if iname == "Extravehicular Suits" then tally.ExtravehicularSuits = tally.ExtravehicularSuits + qty / 1 end
			if iname == "Fire-suppression system" then tally.FireSuppressionsystem = tally.FireSuppressionsystem + qty / 2 end
			if iname == "Flight Assist Control Module" then tally.FlightAssistControlModule = tally.FlightAssistControlModule + qty / 1 end
			if iname == "Frequency Modulators" then tally.FrequencyModulators = tally.FrequencyModulators + qty / 2 end
			if iname == "Gyroscopes" then tally.Gyroscopes = tally.Gyroscopes + qty / 2 end
			if iname == "Instrumentation Panel" then tally.InstrumentationPanel = tally.InstrumentationPanel + qty / 10 end
			if iname == "Life Support System" then tally.LifeSupportSystem = tally.LifeSupportSystem + qty / 2 end
			if iname == "Navigation Unit" then tally.NavigationUnit = tally.NavigationUnit + qty / 4 end
			if iname == "Outer Hull Plate" then tally.OuterHullPlate = tally.OuterHullPlate + qty / 25 end
			if iname == "Oxygen Recycling System" then tally.OxygenRecyclingSystem = tally.OxygenRecyclingSystem + qty / 6 end
			if iname == "Pilot Safety Harness" then tally.PilotSafetyHarness = tally.PilotSafetyHarness + qty / 2 end
			if iname == "Power Regulators" then tally.PowerRegulators = tally.PowerRegulators + qty / 30 end
			if iname == "Ship Paint" then tally.ShipPaint = tally.ShipPaint + qty / 45 end
			if iname == "Stabilizing Systems" then tally.StabilizingSystems = tally.StabilizingSystems + qty / 22 end
			if iname == "Hull Panels" then tally.HullPanels = tally.HullPanels + qty / 40 end
			if iname == "Apicene Ore" then tally.ApiceneOre = tally.ApiceneOre + qty / 60 end
			if iname == "Denic Ore" then tally.DenicOre = tally.DenicOre + qty / 100 end
			if iname == "Heliocene Ore" then tally.HelioceneOre = tally.HelioceneOre + qty / 75 end
			if iname == "Lanthanic Ore" then tally.LanthanicOre = tally.LanthanicOre + qty / 100 end
			if iname == "Premium Ferric Ore" then tally.PremiumFerricOre = tally.PremiumFerricOre + qty / 300 end
			if iname == "Premium Silicate Ore" then tally.PremiumSilicateOre = tally.PremiumSilicateOre + qty / 400 end
			if iname == "Premium VanAzek Ore" then tally.PremiumVanAzekOre = tally.PremiumVanAzekOre + qty / 80 end
			if iname == "Premium Xithricite Ore" then tally.PremiumXithriciteOre = tally.PremiumXithriciteOre + qty / 150 end
			if iname == "Premium Carbonic Ore" then tally.PremiumCarbonicOre = tally.PremiumCarbonicOre + qty / 600 end
			if iname == "Premium Ishik Ore" then tally.PremiumIshikOre = tally.PremiumIshikOre + qty / 100 end
		end
	end
	for i, v in pairs(tally) do
		console_print(i .. " -> " .. math.floor(v))
		if math.floor(v) < lowest then
			lowest = math.floor(v)
			limiter = i
		end
	end
	sectorprint("Can currently build maximum of " .. math.floor(lowest) .. " Goliaths using current inventory in m7, limited by " .. limiter)
end

function harpo_superlight(_, args)
	local tally = {}
	local location = ""
	local iname = ""
	local qty = 0
	local lowest = 9999
	local limiter = ""
	tally.InstrumentationPanels = 0; tally.Carbonic = 0; tally.VanAzek = 0;	tally.Ferric = 0; tally.Silicate = 0; tally.Xith = 0;
	tally.Pentric = 0; tally.ThrustRegulators = 0; tally.ThermalInsulatorTiles = 0; tally.EngineMounts = 0; 
	tally.DataLinkConnectors = 0; tally.PilotSafetyHarness = 0; tally.NavigationUnits = 0; tally.PropellantActuators = 0;
	tally.OuterHullPlate = 0; tally.HullPanels = 0; tally.GuardianProcessor = 0; tally.ArtemisProcessor = 0;
	console_print("Item, Number of Superlights worth of item...")
	for i,v in PlayerInventoryPairs() do 
		location = ShortLocationStr(SplitStationID(GetInventoryItemLocation(i)))
		if location == "Odia M-14" then
			iname = GetInventoryItemName(i)
			qty = GetInventoryItemQuantity(i)
			if iname == "Instrumentation Panel"		then tally.InstrumentationPanels = tally.InstrumentationPanels + qty / 2 end
			if iname == "Premium Carbonic Ore"		then tally.Carbonic = tally.Carbonic + qty / 70 end
			if iname == "Premium VanAzek Ore"		then tally.VanAzek = tally.VanAzek + qty / 50 end
			if iname == "Premium Ferric Ore"		then tally.Ferric = tally.Ferric + qty / 60 end
			if iname == "Premium Silicate Ore"		then tally.Silicate = tally.Silicate + qty / 19 end
			if iname == "Premium Xithricite Ore"	then tally.Xith = tally.Xith + qty / 45 end
			if iname == "Pentric Ore"				then tally.Pentric = tally.Pentric + qty / 10 end
			if iname == "Thrust Regulators"			then tally.ThrustRegulators = tally.ThrustRegulators + qty / 4 end
			if iname == "Thermal Insulator Tiles"	then tally.ThermalInsulatorTiles = tally.ThermalInsulatorTiles + qty / 15 end
			if iname == "Engine Mounts"				then tally.EngineMounts = tally.EngineMounts + qty / 8 end
			if iname == "Data Link Connectors"		then tally.DataLinkConnectors = tally.DataLinkConnectors + qty / 6 end
			if iname == "Pilot Safety Harness"		then tally.PilotSafetyHarness = tally.PilotSafetyHarness + qty / 1 end
			if iname == "Navigation Unit" 			then tally.NavigationUnits = tally.NavigationUnits + qty / 2 end
			if iname == "Propellant Actuators"		then tally.PropellantActuators = tally.PropellantActuators + qty / 4 end
			if iname == "Outer Hull Plate"			then tally.OuterHullPlate = tally.OuterHullPlate + qty / 6 end
			if iname == "Hull Panels"				then tally.HullPanels = tally.HullPanels + qty / 15 end
			if iname == "Guardian Processor Core"	then tally.GuardianProcessor = tally.GuardianProcessor + qty / 4 end
			if iname == "Artemis Processor Core"	then tally.ArtemisProcessor = tally.ArtemisProcessor + qty / 8 end
		end
	end
	for i, v in pairs(tally) do
		console_print(i .. " -> " .. math.floor(v))
		if math.floor(v) < lowest then
			lowest = math.floor(v)
			limiter = i
		end
	end
	sectorprint("Can currently build maximum of " .. math.floor(lowest) .. " Superlights using current inventory in m14, limited by " .. limiter)
end

function harpo_rep(_, args)
	local tally = {}
	local location = ""
	local iname = ""
	local qty = 0
	local lowest = 9999
	local limiter = ""
	tally.PowerRegulators = 0; 
	tally.GuidedMissleCasings = 0; 
	tally.SolidFuelPacks = 0; 
	tally.AdvancedTargetingSystems = 0;
	tally.Plasteel = 0; 
	tally.Helio = 0; 
	tally.Pentric = 0; 
	tally.DentekProcessor = 0;
	console_print("Item, Number of Repair Turrets worth of item...")
	for i,v in PlayerInventoryPairs() do 
		location = ShortLocationStr(SplitStationID(GetInventoryItemLocation(i)))
		if location == "Latos I-8" then
			iname = GetInventoryItemName(i)
			qty = GetInventoryItemQuantity(i)
			if iname == "Power Regulators"			then tally.PowerRegulators = tally.PowerRegulators + qty / 1 end
			if iname == "Guided Missile Casings"	then tally.GuidedMissleCasings = tally.GuidedMissleCasings + qty / 6 end
			if iname == "Solid Fuel Packs"			then tally.SolidFuelPacks = tally.SolidFuelPacks + qty / 6 end
			if iname == "Advanced Targeting Systems" then tally.AdvancedTargetingSystems = tally.AdvancedTargetingSystems + qty / 1 end
			if iname == "Plasteel"					then tally.Plasteel = tally.Plasteel + qty / 2 end
			if iname == "Heliocene Ore"				then tally.Helio = tally.Helio + qty / 4 end
			if iname == "Pentric Ore" 				then tally.Pentric = tally.Pentric + qty / 2 end
			if iname == "Dentek Processor Core"	then tally.DentekProcessor = tally.DentekProcessor + qty / 1 end
		end
	end
	for i, v in pairs(tally) do
		console_print(i .. " -> " .. math.floor(v))
		if math.floor(v) < lowest then
			lowest = math.floor(v)
			limiter = i
		end
	end
	sectorprint("Can currently build maximum of " .. math.floor(lowest) .. " Repair Turrets using current inventory in i8, limited by " .. limiter)
end

function harpo_dbha(_, args)
	local tally = {}
	local location = ""
	local iname = ""
	local qty = 0
	local lowest = 9999
	local limiter = ""

	-- Fused Composite Plating 	5
	-- Internal Bulkhead Assembly 	2
	-- Fluid Formable Silksteel Alloy 	2
	-- Outer Hull Plate 	10
	-- Data Link Connectors 	2
	-- Engine Mounts 	32
	-- Radiation Containment Kit 	16
	-- Premium Ferric Ore 	131
	-- Heliocene Ore 	4
	-- Lanthanic Ore 	10
	tally.FusedCompositePlating = 0; tally.InternalBulkheadAssembly = 0; tally.FluidFormableSilksteelAlloy = 0;
	tally.OuterHullPlate = 0; tally.DataLinkConnectors = 0; tally.EngineMounts = 0; tally.RadiationContainmentKit = 0;
	tally.PremiumFerricOre = 0; tally.HelioceneOre = 0; tally.LanthanicOre = 0;

	console_print("Item, Number of DBHA worth of item...")
	for i,v in PlayerInventoryPairs() do 
		location = ShortLocationStr(SplitStationID(GetInventoryItemLocation(i)))
		if location == "Bractus M-14" then
			iname = GetInventoryItemName(i)
			qty = GetInventoryItemQuantity(i)
			if iname == "Fused Composite Plating" then tally.FusedCompositePlating = tally.FusedCompositePlating + qty / 5 end
			if iname == "Internal Bulkhead Assembly" then tally.InternalBulkheadAssembly = tally.InternalBulkheadAssembly + qty / 2 end
			if iname == "Fluid Formable Silksteel Alloy" then tally.FluidFormableSilksteelAlloy = tally.FluidFormableSilksteelAlloy + qty / 2 end
			if iname == "Outer Hull Plate" then tally.OuterHullPlate = tally.OuterHullPlate + qty / 10 end
			if iname == "Data Link Connectors" then tally.DataLinkConnectors = tally.DataLinkConnectors + qty / 2 end
			if iname == "Engine Mounts" then tally.EngineMounts = tally.EngineMounts + qty / 32 end
			if iname == "Radiation Containment Kit" then tally.RadiationContainmentKit = tally.RadiationContainmentKit + qty / 16 end
			if iname == "Premium Ferric Ore" then tally.PremiumFerricOre = tally.PremiumFerricOre + qty / 131 end
			if iname == "Heliocene Ore" then tally.HelioceneOre = tally.HelioceneOre + qty / 4 end
			if iname == "Lanthanic Ore" then tally.LanthanicOre = tally.LanthanicOre + qty / 10 end
		end
	end
	for i, v in pairs(tally) do
		console_print(i .. " -> " .. math.floor(v))
		if math.floor(v) < lowest then
			lowest = math.floor(v)
			limiter = i
		end
	end
	sectorprint("Can currently build maximum of " .. math.floor(lowest) .. " DBHA using current inventory in M14, limited by " .. limiter)
end

function harpo_pylon(_, args)
	local tally = {}
	local location = ""
	local iname = ""
	local qty = 0
	local lowest = 9999
	local limiter = ""

	tally.FusedCompositePlating = 0; tally.InternalBulkheadAssembly = 0; tally.FluidFormableSilksteelAlloy = 0;
	tally.OuterHullPlate = 0; tally.DataLinkConnectors = 0; tally.EngineMounts = 0; tally.RadiationContainmentKit = 0;
	tally.PremiumXithOre = 0; tally.HelioceneOre = 0; tally.LanthanicOre = 0;

	console_print("Item, Number of Pylons worth of item...")
	for i,v in PlayerInventoryPairs() do 
		location = ShortLocationStr(SplitStationID(GetInventoryItemLocation(i)))
		if location == "Pelatis C-12" then
			iname = GetInventoryItemName(i)
			qty = GetInventoryItemQuantity(i)
			if iname == "Fused Composite Plating" then tally.FusedCompositePlating = tally.FusedCompositePlating + qty / 10 end
			if iname == "Internal Bulkhead Assembly" then tally.InternalBulkheadAssembly = tally.InternalBulkheadAssembly + qty / 1 end
			if iname == "Fluid Formable Silksteel Alloy" then tally.FluidFormableSilksteelAlloy = tally.FluidFormableSilksteelAlloy + qty / 5 end
			if iname == "Outer Hull Plate" then tally.OuterHullPlate = tally.OuterHullPlate + qty / 60 end
			if iname == "Data Link Connectors" then tally.DataLinkConnectors = tally.DataLinkConnectors + qty / 10 end
			if iname == "Engine Mounts" then tally.EngineMounts = tally.EngineMounts + qty / 32 end
			if iname == "Radiation Containment Kit" then tally.RadiationContainmentKit = tally.RadiationContainmentKit + qty / 16 end
			if iname == "Heliocene Ore" then tally.HelioceneOre = tally.HelioceneOre + qty / 11 end
			if iname == "Lanthanic Ore" then tally.LanthanicOre = tally.LanthanicOre + qty / 14 end
		end
	end
	for i, v in pairs(tally) do
		console_print(i .. " -> " .. math.floor(v))
		if math.floor(v) < lowest then
			lowest = math.floor(v)
			limiter = i
		end
	end
	sectorprint("Can currently build maximum of " .. math.floor(lowest) .. " Pylons using current inventory in C12, limited by " .. limiter)
end

function harpo_reactor(_, args)
	local tally = {}
	local location = ""
	local iname = ""
	local qty = 0
	local lowest = 9999
	local limiter = ""

	tally.FusedCompositePlating = 0; tally.FluidFormableSilksteelAlloy = 0;tally.PremiumIshikOre = 0; 
	tally.DataLinkConnectors = 0; tally.Coolant = 0; tally.PowerRegulators = 0; tally.Plasteel = 0; 
	tally.EnergyConversionModules = 0; tally.RadiationContainmentKit = 0; tally.PremiumXithOre = 0; 
	tally.PremiumFerricOre = 0; tally.PremiumCarbonicOre = 0; tally.HelioceneOre = 0; 
	tally.LanthanicOre = 0; tally.SyntheticSilksteel = 0; tally.Samoflange = 0; 

	console_print("Item, Number of Reactors worth of item...")
	for i,v in PlayerInventoryPairs() do 
		location = ShortLocationStr(SplitStationID(GetInventoryItemLocation(i)))
		if location == "Pelatus C-12" then
			iname = GetInventoryItemName(i)
			qty = GetInventoryItemQuantity(i)
			if iname == "Fused Composite Plating" then tally.FusedCompositePlating = tally.FusedCompositePlating + qty / 16 end
			if iname == "Fluid Formable Silksteel Alloy" then tally.FluidFormableSilksteelAlloy = tally.FluidFormableSilksteelAlloy + qty / 20 end
			if iname == "Radiation Containment Kit" then tally.RadiationContainmentKit = tally.RadiationContainmentKit + qty / 30 end
			if iname == "Premium Ishik Ore" then tally.PremiumIshikOre = tally.PremiumIshikOre + qty / 19 end
			if iname == "Heliocene Ore" then tally.HelioceneOre = tally.HelioceneOre + qty / 10 end
			if iname == "Lanthanic Ore" then tally.LanthanicOre = tally.LanthanicOre + qty / 15 end
			if iname == "Data Link Connectors" then tally.DataLinkConnectors = tally.DataLinkConnectors + qty / 64 end
			if iname == "Coolant" then tally.Coolant = tally.Coolant + qty / 500 end
			if iname == "Energy Conversion Module" then tally.EnergyConversionModules = tally.EnergyConversionModules + qty / 128 end
			if iname == "Power Regulators" then tally.PowerRegulators = tally.PowerRegulators + qty / 256 end
			if iname == "Plasteel" then tally.Plasteel = tally.Plasteel + qty / 60 end
			if iname == "Premium Xithricite Ore" then tally.PremiumXithOre = tally.PremiumXithOre + qty / 50 end
			if iname == "Premium Ferric Ore" then tally.PremiumFerricOre = tally.PremiumFerricOre + qty / 220 end
			if iname == "Synthetic Silksteel" then tally.SyntheticSilksteel = tally.SyntheticSilksteel + qty / 15 end
			if iname == "Premium Carbonic Ore" then tally.PremiumCarbonicOre = tally.PremiumCarbonicOre + qty / 180 end
			if iname == "Samoflange" then tally.Samoflange = tally.Samoflange + qty / 1 end
		end
	end
	for i, v in pairs(tally) do
		console_print(i .. " -> " .. math.floor(v))
		if math.floor(v) < lowest then
			lowest = math.floor(v)
			limiter = i
		end
	end
	sectorprint("Can currently build maximum of " .. math.floor(lowest) .. " Reactors using current inventory in C12, limited by " .. limiter)
end

function harpo_mos(_, args)
	local tally = {}
	local location = ""
	local iname = ""
	local qty = 0
	local lowest = 9999
	local limiter = ""
	tally.MilanarObserverOptics = 0; tally.DataLinkConnectors = 0; tally.Optics = 0; tally.ThermalInsulatorTiles = 0; 
	tally.BasicTargetingSystems = 0; tally.Plasteel = 0; tally.Apicene = 0; tally.Denic = 0; tally.ThermalImagers = 0; 
	tally.ScannerCircutBoards = 0; tally.UnassembledCargoCrates = 0;
	console_print("Item, Number of Milanar Optical Sensors worth of item...")
	for i,v in PlayerInventoryPairs() do 
		location = ShortLocationStr(SplitStationID(GetInventoryItemLocation(i)))

		--iname = GetInventoryItemName(i)
		--qty = GetInventoryItemQuantity(i)
		--console_print(iname, location, qty)

		if location == "Bractus M-14" then
			iname = GetInventoryItemName(i)
			qty = GetInventoryItemQuantity(i)
			if iname == "Milanar Observer Optics"	then tally.MilanarObserverOptics = tally.MilanarObserverOptics + qty / 2 end
			if iname == "Data Link Connectors"		then tally.DataLinkConnectors = tally.DataLinkConnectors + qty / 16 end
			if iname == "Optics"					then tally.Optics = tally.Optics + qty / 20 end
			if iname == "Thermal Insulator Tiles"	then tally.ThermalInsulatorTiles = tally.ThermalInsulatorTiles + qty / 10 end
			if iname == "Basic Targeting Systems"	then tally.BasicTargetingSystems = tally.BasicTargetingSystems + qty / 4 end
			if iname == "Plasteel"					then tally.Plasteel = tally.Plasteel + qty / 200 end
			if iname == "Apicene Ore"				then tally.Apicene = tally.Apicene + qty / 17 end
			if iname == "Denic Ore"					then tally.Denic = tally.Denic + qty / 6 end
			if iname == "Thermal Imagers"			then tally.ThermalImagers = tally.ThermalImagers + qty / 2 end
			if iname == "Scanner Circuit Boards"	then tally.ScannerCircutBoards = tally.ScannerCircutBoards + qty / 4 end
			if iname == "Unassembled Cargo Crates"	then tally.UnassembledCargoCrates = tally.UnassembledCargoCrates + qty / 1 end
		end
	end
	for i, v in pairs(tally) do
		console_print(i .. " -> " .. math.floor(v))
		if math.floor(v) < lowest then
			lowest = math.floor(v)
			limiter = i
		end
	end
	sectorprint("Can currently build maximum of " .. math.floor(lowest) .. " Milanar Optical Sensors using current inventory in M14, limited by " .. limiter)
end

RegisterUserCommand("goli", harpo_goli)
RegisterUserCommand("tu", harpo_tu)
RegisterUserCommand("pcb", harpo_pcb)
RegisterUserCommand("fcp", harpo_fcp)
RegisterUserCommand("ffsa", harpo_ffsa)
RegisterUserCommand("ffssa", harpo_ffsa)
RegisterUserCommand("rib", harpo_rib)
RegisterUserCommand("rb", harpo_rib)
RegisterUserCommand("fury", harpo_fury)
RegisterUserCommand("firecracker", harpo_firecracker)
RegisterUserCommand("fc", harpo_firecracker)
RegisterUserCommand("mca", harpo_mca)
RegisterUserCommand("iba", harpo_iba)
RegisterUserCommand("eha", harpo_eha)
RegisterUserCommand("mmc", harpo_mmc)
RegisterUserCommand("cwm", harpo_cwm)
RegisterUserCommand("ihdpc", harpo_ihdpc)
RegisterUserCommand("superlight", harpo_superlight)
RegisterUserCommand("sl", harpo_superlight)
RegisterUserCommand("rep", harpo_rep)
RegisterUserCommand("engine", harpo_engine)
RegisterUserCommand("dbha", harpo_dbha)
RegisterUserCommand("pylon", harpo_pylon)
RegisterUserCommand("reactor", harpo_reactor)
RegisterUserCommand("mos", harpo_mos)
