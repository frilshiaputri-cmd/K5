-- K5 HUB Loader
-- URL tetap; update cukup dilakukan pada file utama di GitHub.

local URL = "https://raw.githubusercontent.com/frilshiaputri-cmd/K5/refs/heads/main/K5_HUB_AntiLag_Max_LogoUpdated_NEW_CODES.txt"

local success, err = pcall(function()
    local source = game:HttpGet(URL)
    local script = loadstring(source)

    if not script then
        error("Gagal meng-compile script K5 HUB")
    end

    script()
end)

if not success then
    warn("[K5 HUB Loader] Gagal memuat script: " .. tostring(err))
end
