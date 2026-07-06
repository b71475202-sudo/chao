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
