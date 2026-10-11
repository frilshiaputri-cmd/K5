--========================================================--
-- K5-HUB Loader
--========================================================--
-- Jika loader gagal, lihat pesan [K5-HUB Loader] di console.
-- Gunakan hanya di environment yang mendukung HTTP dan loadstring.

local SCRIPT_URL = "https://raw.githubusercontent.com/frilshiaputri-cmd/K5/main/K5_HUB_REDEEM_UPDATED.txt"

local function fetchSource(url)
    -- Cara standar Roblox/executor
    local ok, result = pcall(function()
        return game:HttpGet(url)
    end)
    if ok and type(result) == "string" and #result > 0 then
        return result
    end

    -- Fallback untuk executor yang menyediakan request API
    local requestFn = (syn and syn.request)
        or http_request
        or (http and http.request)
        or request

    if type(requestFn) == "function" then
        local reqOk, response = pcall(function()
            return requestFn({ Url = url, Method = "GET" })
        end)
        if reqOk and type(response) == "table"
            and type(response.Body) == "string"
            and #response.Body > 0 then
            local status = tonumber(response.StatusCode or response.Status)
            if not status or (status >= 200 and status < 300) then
                return response.Body
            end
            error("HTTP status " .. tostring(status))
        elseif not reqOk then
            warn("[K5-HUB Loader] Request fallback gagal: " .. tostring(response))
        end
    end

    error("Tidak bisa mengunduh script. Periksa koneksi, izin HTTP, dan dukungan executor.")
end

print("[K5-HUB Loader] Mengunduh script...")
local ok, err = pcall(function()
    local source = fetchSource(SCRIPT_URL)
    assert(type(source) == "string" and #source > 0, "File sumber kosong.")

    local compiler = loadstring
    assert(type(compiler) == "function",
        "loadstring tidak tersedia pada executor ini.")

    local compiled, compileError = compiler(source)
    assert(type(compiled) == "function",
        "Gagal compile Lua: " .. tostring(compileError))

    print("[K5-HUB Loader] File berhasil diunduh; menjalankan K5-HUB...")
    compiled()
end)

if not ok then
    warn("[K5-HUB Loader] GAGAL: " .. tostring(err))
else
    print("[K5-HUB Loader] Eksekusi loader selesai.")
end
