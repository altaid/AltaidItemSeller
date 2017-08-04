local frame = CreateFrame("Frame")
seller = {}
frame:RegisterEvent("MERCHANT_SHOW")
local function eventHandler(self, event, ...)
    seller:sell()
    seller:repair()
end
frame:SetScript("OnEvent", eventHandler)

function seller:sell()
    for bag = 0, 4 do
    for i = 1, GetContainerNumSlots(bag) do
        local _, _, _, quality = GetContainerItemInfo(bag, i)
        local itemLink = GetContainerItemLink(bag, i)

        if itemLink then
            if quality == 0 then
                UseContainerItem(bag, i)
            end
        end
    end
end
end

function seller:repair()
    if CanMerchantRepair() == true then
        RepairAllItems(1)
        RepairAllItems()
    end
end