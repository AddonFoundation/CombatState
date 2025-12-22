-- =========================
-- Combat State Flash
-- =========================

local DISPLAY_TIME = 3.0   -- seconds visible
local FADE_TIME    = 0.6   -- fade out duration

--------------------------------------------------
-- Frame
--------------------------------------------------
local frame = CreateFrame("Frame", "CombatStateFrame", UIParent)
frame:SetSize(260, 60)
frame:SetPoint("CENTER", 0, 100)
frame:SetAlpha(0)
frame:Hide()

--------------------------------------------------
-- Text
--------------------------------------------------
local text = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalHuge")
text:SetAllPoints()
text:SetJustifyH("CENTER")
text:SetJustifyV("MIDDLE")

--------------------------------------------------
-- State
--------------------------------------------------
local timer = 0
local mode = nil  -- "show" or "fade"

--------------------------------------------------
-- OnUpdate
--------------------------------------------------
frame:SetScript("OnUpdate", function(self, elapsed)
    if not mode then return end

    timer = timer + elapsed

    if mode == "show" then
        if timer >= DISPLAY_TIME then
            timer = 0
            mode = "fade"
        end

    elseif mode == "fade" then
        local alpha = 1 - (timer / FADE_TIME)
        if alpha <= 0 then
            frame:SetAlpha(0)
            frame:Hide()
            mode = nil
        else
            frame:SetAlpha(alpha)
        end
    end
end)

--------------------------------------------------
-- Trigger helper
--------------------------------------------------
local function FlashCombat(textLabel, r, g, b)
    text:SetText(textLabel)
    text:SetTextColor(r, g, b)

    frame:SetAlpha(1)
    frame:Show()

    timer = 0
    mode = "show"
end

--------------------------------------------------
-- Events
--------------------------------------------------
frame:RegisterEvent("PLAYER_REGEN_DISABLED")
frame:RegisterEvent("PLAYER_REGEN_ENABLED")

frame:SetScript("OnEvent", function(self, event)
    if event == "PLAYER_REGEN_DISABLED" then
        -- ++Combat (enter)
        FlashCombat("++Combat", 1.0, 0.1, 0.1)

    elseif event == "PLAYER_REGEN_ENABLED" then
        -- --Combat (exit)
        FlashCombat("--Combat", 0.1, 1.0, 0.1)
    end
end)
