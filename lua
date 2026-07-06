-- Chuỗi nốt nhạc của bạn
local music_sheet = {
    -- Đoạn 1
    "[fh]", "j", "z", "[dg]", "j", "l", "[sf]", "h", "k", "[ad]", "f", "h",
    "[fh]", "j", "z", "[dg]", "j", "l", "[sf]", "h", "k", "s", "d", "f", "g",
    -- Đoạn 2
    "[sf]", "h", "k", "x", "[ad]", "f", "h", "z", "[ps]", "f", "h", "l", "[ad]", "f", "h", "k",
    "[sf]", "h", "k", "x", "[ad]", "f", "h", "z", "[ps]", "f", "h", "l", "j", "k", "l", "z",
    -- Đoạn 3
    "[fh]", "j", "z", "[dg]", "j", "l", "[sf]", "h", "k", "[ad]", "f", "h",
    "[fh]", "j", "z", "[dg]", "j", "l", "[sf]", "h", "k", "[ad]", "f", "h"
}

-- Hàm phụ trợ để giả lập bấm phím (Tùy thuộc vào phần mềm bạn dùng, hàm này có thể đổi tên)
-- Mặc định ở đây dùng hàm mô phỏng phổ biến: PressKey và ReleaseKey
local function press_single_key(key)
    KeyPress(key)
    Sleep(50) -- Giữ phím 50ms
    ReleaseKey(key)
end

-- Hàm chạy toàn bộ bản nhạc
local function play_music()
    Sleep(5000) -- Chờ 5 giây để bạn chuyển sang cửa sổ game/ứng dụng
    
    for _, note in ipairs(music_sheet) do
        -- Kiểm tra nếu là hợp âm bấm cùng lúc (Ví dụ: "[fh]")
        if string.sub(note, 1, 1) == "[" and string.sub(note, -1) == "]" then
            -- Bỏ dấu ngoặc vuông để lấy các ký tự bên trong
            local keys_str = string.sub(note, 2, -2)
            local keys = {}
            
            -- Tách từng chữ cái ra
            for i = 1, #keys_str do
                table.insert(keys, string.sub(keys_str, i, i))
            end
            
            -- Nhấn đồng thời tất cả các phím xuống
            for _, key in ipairs(keys) do
                KeyDown(key)
            end
            
            Sleep(50) -- Giữ các phím cùng lúc trong 50ms
            
            -- Thả đồng thời tất cả các phím ra
            for _, key in ipairs(keys) do
                KeyUp(key)
            end
            
        else
            -- Nếu là nốt đơn lẻ thông thường
            press_single_key(note)
        end
        
        -- Khoảng nghỉ giữa các nốt (Tốc độ nhạc). Đơn vị là mili-giây (ms).
        -- 200ms = 0.2 giây. Muốn nhạc nhanh hơn thì giảm số này xuống.
        Sleep(200) 
    end
end

-- Kích hoạt chạy bot
play_music()
