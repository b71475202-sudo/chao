local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Rayfield:CreateWindow({
   Name = "we your",
   LoadingTitle = "RayField UI",
   LoadingSubtitle = "By your name",
   ConfigurationSaving = {
      Enabled = true,
      Folder = "MyRayField", -- Tên thư mục lưu config
      FileName = "conFig"    -- Tên file config
   },
   Discord = {
      Enabled = false,
      Invite = "noinvitelink", -- Link Discord nếu có
      RememberJoins = true
   },
   KeySystem = false, -- Đổi thành true nếu muốn dùng key
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided",
      FileName = "Key",
      SaveKey = true,
      GrabKeyFromUrl = false,
      Key = {"Hello"}
   }
})
local  LINK_NHAC = "https://githubusercontent.com"
local TOC_DO = 0.1 -- Thời gian trễ giữa các nốt (giây)

local VirtualInputManager = game:GetService("VirtualInputManager")
local function bamPhim(chuCai)
    local keyCode
    pcall(function() keyCode = Enum.KeyCode[string.upper(chuCai)] end)
    if keyCode then
        if keypress and keyrelease then
            keypress(keyCode.Value)
            task.wait(0.01)
            keyrelease(keyCode.Value)
        else
            VirtualInputManager:SendKeyEvent(true, keyCode, false, game)
            task.wait(0.01)
            VirtualInputManager:SendKeyEvent(false, keyCode, false, game)
        end
    end
end

print("Dang tai bai hat tu GitHub...")
local success, sheetNhac = pcall(function() return game:HttpGet(https://"www.google.com/search?q=tr%C6%B0%E1%BB%9Bc+khi+em+t%E1%BB%93n+t%E1%BA%A1i+piano&sca_esv=ee96f3d42c6f5c08&biw=411&sxsrf=APpeQnse1PFMO5fKpZkbhr4ZhrwoNoLYyQ%3A1783324041247&ei=iV1Lap7UDoiJvr0P0d3qoAw&bih=779&oq=tr%C6%B0%E1%BB%9Bc+khi+em+t%E1%BB%93n+t%E1%BA%A1i+piano&gs_lp=EhNtb2JpbGUtZ3dzLXdpei1zZXJwIiF0csaw4bubYyBraGkgZW0gdOG7k24gdOG6oWkgcGlhbm8yBRAAGIAEMgUQABiABDIFEAAYgAQyBRAAGIAEMgUQABiABDIFEAAYgAQyBhAAGBYYHjIGEAAYFhgeSK8iUABYxR1wAHgBkAEAmAG6AqABkAuqAQcwLjQuMi4xuAEDyAEA-AEBmAIHoAKMDMICChAAGIAEGEMYigXCAgoQLhiABBhDGIoFwgIFEC4YgASYAwCSBwcwLjQuMi4xoAeBLrIHBzAuNC4yLjG4B4wMwgcFMy02LjHIB3iACAA&sclient=mobile-gws-wiz-serp#fpstate=ive&vld=cid:a3c681d1,vid:jtFsZRHUyPE,st:0") end)

if not success or not sheetNhac then
    warn("Loi: Khong the tai du lieu. Hay dam bao ban dang dung link HTTPS da ma hoa!")
    return
end

print("Tai thanh cong! Ban co 3 giay de click chon cay dan Piano...")
task.wait(3)

local i = 1
while i <= #sheetNhac do
    local kyTu = sheetNhac:sub(i, i)
    
    if kyTu == "[" then
        local hopAm = ""
        i = i + 1
        while i <= #sheetNhac do
            local kyTuTiepTheo = sheetNhac:sub(i, i)
            if kyTuTiepTheo == "]" then break end
            hopAm = hopAm .. kyTuTiepTheo
            i = i + 1
        end
        for notTrongHopAm in hopAm:gmatch(".") do
            task.spawn(bamPhim, notTrongHopAm)
        end
    elseif kyTu:match("%s") or kyTu == "|" or kyTu == "-" then
        task.wait(TOC_DO)
    else
        bamPhim(kyTu)
    end
    
    task.wait(TOC_DO)
    i = i + 1
end
print("Da tu dong danh xong bai hat!")
