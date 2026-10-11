--[[
    K5-HUB Loader
    File sumber: K5_HUB_REDEEM_UPDATED.txt
    Update isi file sumber di branch main; loader ini tidak perlu diubah
    selama nama file dan lokasinya tetap sama.
]]

local SCRIPT_URL = "https://raw.githubusercontent.com/frilshiaputri-cmd/K5/refs/heads/main/K5_HUB_REDEEM_UPDATED.txt"

local ok, err = pcall(function()
    local source = game:HttpGet(SCRIPT_URL)
    assert(type(source) == "string" and #source > 0,
        "File script kosong atau gagal diunduh.")

    local compiled, compileError = loadstring(source)
    assert(compiled, "Script Lua tidak valid: " .. tostring(compileError))

    compiled()
end)

if not ok then
    warn("[K5-HUB Loader] " .. tostring(err))
end
