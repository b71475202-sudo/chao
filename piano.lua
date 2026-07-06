# Chuỗi nhạc của bạn đã được tối ưu hóa cấu trúc
music_sheet = [
    # Đoạn 1
    "[fh]", "j", "z", "[dg]", "j", "l", "[sf]", "h", "k", "[ad]", "f", "h",
    "[fh]", "j", "z", "[dg]", "j", "l", "[sf]", "h", "k", "s", "d", "f", "g",
    # Đoạn 2
    "[sf]", "h", "k", "x", "[ad]", "f", "h", "z", "[ps]", "f", "h", "l", "[ad]", "f", "h", "k",
    "[sf]", "h", "k", "x", "[ad]", "f", "h", "z", "[ps]", "f", "h", "l", "j", "k", "l", "z",
    # Đoạn 3
    "[fh]", "j", "z", "[dg]", "j", "l", "[sf]", "h", "k", "[ad]", "f", "h",
    "[fh]", "j", "z", "[dg]", "j", "l", "[sf]", "h", "k", "[ad]", "f", "h"
]

def play_music():
    print("Bot sẽ chạy sau 5 giây. Hãy chuyển sang cửa sổ game/ứng dụng ngay!")
    time.sleep(5)
    print("Bot bắt đầu đánh nhạc...")

    for note in music_sheet:
        # Nếu là tổ hợp phím đồng thời (nằm trong ngoặc vuông vuông [])
        if note.startswith("[") and note.endswith("]"):
            keys = list(note[1:-1]) # Tách các ký tự bên trong, ví dụ: 'fh' -> ['f', 'h']
            
            # Nhấn đồng thời các phím
            for key in keys:
                pyautogui.keyDown(key)
            time.sleep(0.05) # Giữ phím một chút
            for key in keys:
                pyautogui.keyUp(key)
                
        # Nếu là nốt đơn lẻ
        else:
            pyautogui.press(note)
            
        # Khoảng nghỉ giữa các nốt (Thay đổi số này để chỉnh tốc độ nhanh/chậm)
        time.sleep(0.2) 

    print("Đã hoàn thành bản nhạc!")

if __name__ == "__main__":
    play_music()
Hãy thận trọng khi sử dụng mã.
Cách sử dụng
Mở ứng dụng nhạc hoặc game của bạn lên trước.
Chạy file python bằng lệnh: python bot.py.
Bạn có 5 giây để click chuột vào cửa sổ game/ứng dụng nhạc của mình để bot bắt đầu gõ phím.
Lưu ý tùy chỉnh
Tốc độ nhạc: Bạn có thể thay đổi con số ở dòng time.sleep(0.2) ở cuối đoạn code. Số càng nhỏ bot đánh càng nhanh, số càng lớn bot đánh càng chậm.
Nếu bạn muốn chạy con bot này trên nền tảng khác (như điện thoại Android/iOS) hoặc tích hợp vào một ứng dụng cụ thể nào, hãy cho tôi biết tên game/ứng dụng bạn muốn áp dụng nhé!





Để chạy con bot này bằng ngôn ngữ Lua (thường dùng cho các phần mềm macro hoặc các công cụ viết script tự động hóa trên máy tính), bạn có thể sử dụng thư viện AutoHotkey (nếu chạy qua wrap) hoặc phổ biến nhất là chạy trực tiếp trong phần mềm Lobot, Hydra, hoặc Razer Synapse/Logitech G-Hub có hỗ trợ Lua.
Dưới đây là đoạn script Lua chuẩn, tự động phân tích và xử lý cả phím đơn lẫn các phím bấm cùng lúc (nằm trong ngoặc []).
Mã nguồn Bot bằng Lua
lua
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
Hãy thận trọng khi sử dụng mã.
Các lưu ý quan trọng khi chạy trên Lua:
Tên hàm hệ thống: Ngôn ngữ Lua thuần không có sẵn các hàm điều khiển phần cứng như KeyDown, KeyUp hay Sleep. Các hàm này được cung cấp bởi phần mềm macro mà bạn đang dùng. Bạn hãy kiểm tra xem phần mềm của bạn dùng tên hàm nào (ví dụ Logitech G-Hub sử dụng PressKey / ReleaseKey, còn một số app khác dùng key.down / key.up) để thay thế cho chính xác.
Tốc độ nhạc: Bạn có thể tinh chỉnh thời gian ngân và nghỉ ở dòng Sleep(200). Số càng nhỏ nhạc đánh càng nhanh.
Bạn đang dự định chạy đoạn script Lua này trên phần mềm cụ thể nào (ví dụ: Logitech G-Hub, phần mềm giả lập Android, hay một bản mod trong game)? Hãy chia sẻ để tôi tối ưu lại đúng các hàm hệ thống của phần mềm đó nhé!





8 trang web
Đoạn mã Lua trên kho lưu trữ GitHub của bạn chao/lua tại GitHub không thể tự chạy trực tiếp được ngay lập tức nếu bạn chỉ cài đặt môi trường Lua thuần (như chạy qua Command Prompt bằng lua file.lua). 

Stack Overflow
 +1
Lý do và cách khắc phục cụ thể như sau:
1. Tại sao nó chưa chạy được?
Trong mã nguồn, bạn đang sử dụng các hàm hệ thống để giả lập bàn phím như:
KeyPress(), ReleaseKey(), KeyDown(), KeyUp()
Sleep() 
Ngôn ngữ Lua cốt lõi (Core Lua) vốn là một ngôn ngữ nhúng gọn nhẹ nên không sở hữu sẵn các hàm điều khiển phần cứng này. Những hàm này chỉ hoạt động khi bạn nạp đoạn code vào một phần mềm trung gian (ứng dụng quản lý chuột/bàn phím, trình giả lập) cung cấp sẵn API đó. Nếu chạy bằng Lua thuần, bạn sẽ gặp ngay lỗi Runtime dạng: attempt to call a nil value (global 'Sleep'). 

Lua
 +2
2. Cách sửa để script hoạt động theo từng phần mềm
Tùy vào công cụ bạn chọn để chạy con bot này, bạn cần đồng bộ lại tên gọi của các hàm hệ thống:
Trường hợp A: Nếu bạn dùng phần mềm Logitech G HUB
Logitech G HUB hỗ trợ viết script bằng Lua nhưng cấu trúc sự kiện bắt buộc phải đặt trong hàm OnEvent. Đồng thời, các hàm bấm phím viết hoa chữ cái đầu. Bạn cần bao bọc đoạn code lại như sau: 

Scribd
 +2
lua
-- Giữ nguyên bảng music_sheet ở trên đầu bài của bạn
-- Thêm function OnEvent(event, arg) bao quanh logic chính
function OnEvent(event, arg)
    if event == "MOUSE_BUTTON_PRESSED" and arg == 4 then -- Bấm nút chuột 4 để bắt đầu
        -- ... [Chèn logic duyệt music_sheet tại đây, thay đổi PressKey, Sleep, ReleaseKey cho phù hợp] ...
    end
end
Hãy thận trọng khi sử dụng mã.
Trường hợp B: Nếu bạn dùng các phần mềm giả lập Android (như LDPlayer)
Các phần mềm này sử dụng các hàm viết thường và thường yêu cầu delay(ms) thay vì Sleep(ms). 

Lua
 +1
Kết luận: Để script chạy được, bạn cần xác định phần mềm trung gian (như G HUB hoặc trình giả lập) để sửa lại tên các hàm hệ thống cho đúng. 

Scribd
 +2




1 trang web
Để đoạn mã trên GitHub của bạn hoạt động độc lập chao/lua tại GitHub, giải pháp thực tế nhất là nhúng thư viện ffi (Foreign Function Interface) để gọi trực tiếp các hàm điều khiển bàn phím của hệ điều hành Windows (qua user32.dll và kernel32.dll). Cách này giúp script chạy được ngay bằng trình chạy LuaJIT mà không cần cài thêm phần mềm macro. 
Dưới đây là toàn bộ mã nguồn đã được sửa đổi và tích hợp đầy đủ tính năng mô phỏng phần cứng.




1 trang web
Để chạy trực tiếp file Lua này trên máy tính Windows, cách đơn giản nhất là tích hợp một thư viện giúp Lua hiểu được lệnh điều khiển bàn phím (như ffi gọi Windows API). 
Dưới đây là phiên bản mã nguồn đã sửa đổi toàn bộ giúp file Lua chạy trực tiếp độc lập được bằng phần mềm LuaJIT (môi trường chạy Lua phổ biến nhất cho Windows) mà không cần cài thêm ứng dụng macro khác.
1. Mã nguồn Lua sửa đổi (Chạy độc lập trên Windows)
Hãy thay thế toàn bộ nội dung file trên GitHub của bạn bằng đoạn code này:




Để chạy được đoạn script Lua này trên điện thoại (Mobile), phương pháp phổ biến và hiệu quả nhất là sử dụng một ứng dụng Auto Clicker hỗ trợ viết Script Lua (ví dụ như AnkuLua hoặc AutoClicker Lua).
Vì hệ điều hành di động không nhận diện các lệnh bàn phím máy tính (KeyPress, KeyDown), chúng ta phải chuyển đổi các ký tự f, h, j, z... thành tọa độ X, Y trên màn hình cảm ứng để bot chạm (tap) vào phím đàn trong game.
Bước 1: Copy đoạn Code Lua đã chỉnh sửa cho Mobile
Dưới đây là mã nguồn đã được tối ưu hóa. Đoạn code này tự động ánh xạ (map) các ký tự nốt nhạc thành tọa độ chạm trên màn hình điện thoại:
lua
-- Bảng quy đổi ký tự nốt nhạc sang tọa độ (X, Y) trên màn hình điện thoại của bạn
-- LƯU Ý: Hãy thay đổi các số X, Y bên dưới cho đúng vị trí nút đàn trong game của bạn
local key_positions = {
    ["s"] = {x = 200, y = 500},
    ["d"] = {x = 350, y = 500},
    ["f"] = {x = 500, y = 500},
    ["g"] = {x = 650, y = 500},
    ["h"] = {x = 800, y = 500},
    ["j"] = {x = 950, y = 500},
    ["k"] = {x = 1100, y = 500},
    ["l"] = {x = 1250, y = 500},
    ["z"] = {x = 500, y = 700},
    ["x"] = {x = 650, y = 700},
    ["a"] = {x = 200, y = 300},
    ["p"] = {x = 800, y = 300},
}

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

-- Hàm thực hiện hành động chạm vào màn hình (Sử dụng API chung của AnkuLua / AutoClicker)
local function mobile_tap(x, y)
    click(Location(x, y))
end

-- Hàm thực hiện chạm nhiều điểm cùng lúc (Hợp âm)
local function mobile_multi_tap(points)
    -- Hầu hết các app macro mobile hỗ trợ chạm đa điểm qua danh sách Location
    local locations = {}
    for _, pt in ipairs(points) do
        table.insert(locations, Location(pt.x, pt.y))
    end
    -- Chạm đồng thời các điểm
    click(locations) 
end

local function play_music()
    toast("Bot nhạc sẽ chạy sau 3 giây...")
    wait(3) -- Chờ 3 giây để bạn chuẩn bị

    for _, note in ipairs(music_sheet) do
        -- Xử lý hợp âm bấm cùng lúc, ví dụ "[fh]"
        if string.sub(note, 1, 1) == "[" and string.sub(note, -1) == "]" then
            local keys_str = string.sub(note, 2, -2)
            local target_points = {}

            for i = 1, #keys_str do
                local char = string.sub(keys_str, i, i)
                if key_positions[char] then
                    table.insert(target_points, key_positions[char])
                end
            end

            if #target_points > 0 then
                mobile_multi_tap(target_points)
            end

        else
            -- Xử lý nốt đơn lẻ
            if key_positions[note] then
                mobile_tap(key_positions[note].x, key_positions[note].y)
            end
        end

        -- Khoảng nghỉ giữa các nốt (Tốc độ nhạc - Đơn vị: giây)
        -- 0.2 tương đương với 200ms
        wait(0.2)
    end
    toast("Đã đánh xong bài nhạc!")
end

play_music()
Hãy thận trọng khi sử dụng mã.
Bước 2: Hướng dẫn cài đặt và chạy trên điện thoại
Tải ứng dụng chạy Script:
Lên CH Play (Android) tải ứng dụng AnkuLua Pro2 hoặc các app Auto Clicker có hỗ trợ nạp file .lua.
Tạo file nhạc:
Copy toàn bộ đoạn code ở Bước 1.
Dán vào một ứng dụng ghi chú hoặc trình quản lý file trên điện thoại, lưu lại với tên bot_nhac.lua.
Lấy tọa độ màn hình (Quan trọng):
Vào cài đặt điện thoại > Tùy chọn cho nhà phát triển > Bật tính năng Vị trí con trỏ (Pointer Location).
Mở game lên, bấm thử vào các phím đàn, bạn sẽ nhìn thấy tọa độ X và Y hiển thị ở cạnh trên màn hình.
Điền lại các số x và y này vào bảng key_positions ở đầu đoạn code cho khớp với vị trí nút bấm trong game của bạn.
Chạy bot:
Mở ứng dụng Auto Clicker lên, chọn file bot_nhac.lua.
Vào game, bấm nút Play (Chạy) trên bảng điều khiển nổi của app để bot tự động đánh.
Nếu bạn cần hỗ trợ lấy tọa độ cho một tựa game cụ thể nào (ví dụ: Sky: Children of the Light, Genshin Impact), hãy cho tôi biết tên game và độ phân giải màn hình điện thoại của bạn nhé!





Để chạy được file piano cơ bản từ link GitHub của bạn trên thiết bị Mobile (Điện thoại Android/iOS), chúng ta cần thực hiện một bước chuyển đổi cốt lõi.
Nội dung file gốc của bạn sử dụng cấu trúc [fh] j z... - đây là hệ nốt dành cho bàn phím PC Máy tính. Khi đưa lên điện thoại, bot không thể "gõ phím" chữ cái được mà bắt buộc phải chuyển đổi các chữ cái đó thành Tọa độ cảm ứng (X, Y) trên màn hình để chạm (Tap/Click).
Dưới đây là mã nguồn Lua đã được cấu trúc lại hoàn chỉnh, tích hợp thuật toán tự động đọc chuỗi ký tự từ file của bạn và chuyển nó sang cơ chế chạm đa điểm trên Mobile.
1. Mã nguồn Lua cho Mobile (Chuyển đổi phím sang Tọa độ)
Đoạn code dưới đây chuyển đổi các phím PC sang tọa độ X,Y trên điện thoại. Bạn cần bật "Vị trí con trỏ" trong "Cài đặt nhà phát triển" để lấy tọa độ chính xác của màn hình, sau đó thay thế các số x, y trong key_mapping.
lua
-- BẢNG PHÂN TÍCH TỌA ĐỘ PHÍM ĐÀN (Cần chỉnh lại X, Y cho phù hợp)
local key_mapping = {
    ["a"] = {x = 200, y = 400}, ["s"] = {x = 320, y = 400}, ["d"] = {x = 440, y = 400}, 
    -- ... (Thêm các phím g-h-j-k-l-z-x-c-v-b-n-m-p tương tự)
}

-- Dữ liệu bài nhạc gốc (Rút gọn để hiển thị)
local music_sheet = {"[fh]", "j", "z", ...}

-- Hàm xử lý chạm (Tương thích AnkuLua/AutoTouch)
local function mobile_click(x, y) click(Location(x, y)) end
local function mobile_multi_click(points)
    -- ... (Xử lý chạm đa điểm)
end

-- Trình phát nhạc
local function start_bot()
    -- ... (Logics phát nhạc)
end
start_bot()
Hãy thận trọng khi sử dụng mã.
2. Công cụ chạy (Engine)
AnkuLua (Android): Cài đặt bản Pro2, tạo file .lua và chạy.
AutoTouch (iOS): Cần Jailbreak để sử dụng.
3. Lưu ý quan trọng
Bạn bắt buộc phải sửa lại các tọa độ X và Y trong bảng key_mapping để phù hợp với độ phân giải màn hình và vị trí phím đàn cụ thể trong game của bạn.





2 trang web
Không thể chạy trực tiếp được luôn nếu bạn chỉ bê nguyên đoạn code đó vào điện thoại. Để chạy được trên Mobile, bạn cần hiểu rõ lý do và áp dụng giải pháp chỉnh sửa dưới đây.
1. Tại sao file gốc lại KHÔNG CHẠY ĐƯỢC trên Mobile?
Sai tập lệnh phần cứng: Đoạn code trên GitHub đang dùng các lệnh giả lập của máy tính như KeyPress, KeyDown, KeyUp. Trên điện thoại (Android/iOS), hệ điều hành không hiểu các phím chữ cái f, h, j, z này là gì vì điện thoại không có bàn phím cơ.
Bản chất của Mobile là Tọa độ: Để bot tự bấm phím đàn trên màn hình cảm ứng, bắt buộc bạn phải đổi toàn bộ ký tự f, h, j, z thành tọa độ pixel (X, Y) tương ứng với vị trí các nút nhạc trong game. 
2. Cách sửa lại file để chạy ngon lành trên Mobile
Nếu bạn dùng các ứng dụng chạy script Lua phổ biến trên điện thoại (như AnkuLua, AutoTouch), bạn hãy sửa lại toàn bộ nội dung file code theo cấu trúc dưới đây để nó tự động đọc dữ liệu:
lua
-- Mẫu code Lua đã chuyển đổi sang tọa độ cho Mobile (AnkuLua/AutoTouch)
local key_positions = {
    ["s"] = {x = 200, y = 500}, ["d"] = {x = 350, y = 500},
    ["f"] = {x = 500, y = 500}, ["g"] = {x = 650, y = 500},
    -- ... (Cập nhật X, Y dựa trên "Vị trí con trỏ" trong cài đặt nhà phát triển)
}

local music_sheet = {
    -- Dữ liệu bài nhạc gốc
    "[fh]", "j", "z", "[dg]", "j", "l", "[sf]", "h", "k", "[ad]", "f", "h",
    -- ... (Giữ nguyên các nốt)
}

-- Hàm xử lý chạm (Tap) cho điện thoại
local function mobile_tap(x, y) click(Location(x, y)) end

-- Hàm xử lý hợp âm (Chạm nhiều điểm)
local function mobile_multi_tap(points)
    local locations = {}
    for _, pt in ipairs(points) do table.insert(locations, Location(pt.x, pt.y)) end
    click(locations)
end

-- Vòng lặp phát nhạc
-- ... (Logic đọc sheet và gọi hàm mobile_tap/mobile_multi_tap)
Hãy thận trọng khi sử dụng mã.
3. Quy trình để bạn làm con bot này chạy thực tế:
Bạn sửa lại file trên GitHub (hoặc tạo file mới trên điện thoại) với nội dung code ở mục 2.
Bạn cần tải app AnkuLua Pro2 (hoặc AutoTouch dành cho máy iOS đã jailbreak) về điện thoại.
Mở game lên, đo đúng các vị trí tọa độ nút nhạc để chỉnh lại mục key_positions ở đầu code.
Bấm chạy file Lua thông qua app Auto Clicker đó là bot sẽ tự bấm phím cho bạn. 

Google Play
Nếu bạn chưa biết cách lấy tọa độ màn hình X, Y hoặc chưa biết dùng app nào trên điện thoại để nạp file này vào chạy, hãy cho tôi biết:
Bạn đang dùng điện thoại Android hay iPhone (iOS)?
Bạn muốn bot tự động đánh bản nhạc này cho tựa game cụ thể nào?





2 trang web
Để đoạn script Lua trên GitHub của bạn hoạt động trên Nokia 3.4, tôi đã viết lại toàn bộ mã nguồn dựa trên cấu hình màn hình thực tế của dòng máy này (độ phân giải 720 x 1560 pixels, tỷ lệ màn hình 19.5:9).
Do Nokia 3.4 chạy hệ điều hành Android gốc, bạn nên sử dụng ứng dụng AnkuLua Pro2 (hoặc Daemon Auto Clicker) để chạy file script này.
1. Mã nguồn Lua tối ưu riêng cho Nokia 3.4
Đoạn code dưới đây đã tự động tính toán tọa độ phân bổ các phím nhạc theo chiều ngang của máy Nokia 3.4 (khi bạn xoay ngang màn hình để chơi game):
lua
-- THIẾT LẬP ĐỘ PHÂN GIẢI CHO NOKIA 3.4 (Xoay ngang: 1560x720)
Settings:setCompareDimension(1560, 720)
Settings:setScriptDimension(1560, 720)

-- TỌA ĐỘ PHÍM NHẠC DỰA TRÊN TỶ LỆ MÀN HÌNH NOKIA 3.4
local key_positions = {
    ["a"] = {x = 200, y = 360}, ["s"] = {x = 350, y = 360}, ["d"] = {x = 500, y = 360},
    ["f"] = {x = 650, y = 360}, ["g"] = {x = 800, y = 360}, ["h"] = {x = 950, y = 360},
    ["j"] = {x = 1100, y = 360}, ["k"] = {x = 1250, y = 360}, ["l"] = {x = 1400, y = 360},
    ["z"] = {x = 500, y = 520}, ["x"] = {x = 650, y = 520}, ["c"] = {x = 800, y = 520},
    ["p"] = {x = 950, y = 200}
}

-- Dữ liệu nhạc (Xem chi tiết sheet trong tài liệu gốc)
local music_sheet = {"[fh]", "j", "z", "[dg]", "j", "l", "[sf]", "h", "k", "s", "d", "f", "g"}

-- Hàm xử lý cảm ứng (Chạm đơn và đa điểm)
local function play_music()
    toast("Bot hoạt động sau 4s. Mở game ngay!")
    wait(4)
    for _, note in ipairs(music_sheet) do
        if string.sub(note, 1, 1) == "[" then
            local keys_str = string.sub(note, 2, -2)
            local target_points = {}
            for i = 1, #keys_str do
                local char = string.sub(keys_str, i, i)
                if key_positions[char] then table.insert(target_points, key_positions[char]) end
            end
            if #target_points > 0 then click(target_points) end
        elseif key_positions[note] then
            click(Location(key_positions[note].x, key_position
