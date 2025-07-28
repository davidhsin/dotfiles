-- alt = option
-- cmd = command
-- ctrl = control

-- 來源：https://superuser.com/questions/1606630/toggle-background-opacity-option-in-alacritty
hs.hotkey.bind({"cmd"}, "u", function()
  alacritty_file_name = string.format("%s/.config/alacritty/alacritty.toml", os.getenv("HOME"))

  opaque = "opacity = 1"
  transparent = "opacity = 0.6"

  local file = io.open(alacritty_file_name)

  local content = file:read "*a"
  file:close()

  if string.match(content, opaque) then
    content = string.gsub(content, opaque, transparent)
  else
    content = string.gsub(content, transparent, opaque)
  end

  local fileedited = io.open(alacritty_file_name, "w")
  fileedited:write(content)
  fileedited:close()
end)

d = hs.application("Dock")
for i=1,9 do
    hs.hotkey.bind({"alt"}, tostring(i), function()
        iconNumber = i
        icon = hs.axuielement.applicationElement(d)[1][iconNumber]
        if icon:attributeValue("AXRole") == "AXDockItem" then
            icon:performAction("AXPress")
        else
            print("not an application")
        end
    end)
end

-- 參考資料1：https://blog.csdn.net/u012123989/article/details/88667562
-- 參考資料2：https://gist.github.com/ysimonson/fea48ee8a68ed2cbac12473e87134f58   
-- 用來檢查命令是否正確執行，該函數會被bluetooth(power)使用
function checkBluetoothResult(rc, stderr, stderr)
    -- rc是命令退出代碼，0表示成功，1表示失敗，退出代碼通常表示命令是否執行成功
    -- 判斷rc是否不等於0
    if rc ~= 0 then
        print(string.format("Unexpected result executing `blueutil`: \
                rc=%d stderr=%s stdout=%s", rc ,stderr, stdout))
    end
end

function bluetooth(power)
    print("Setting bluetooth to " .. power)
    -- 設定新任務 hs.task.new()用於執行外部任務
    -- task.new("command", 處理命令結果，rc=0時才會print出字串, )
    local t = hs.task.new("/opt/homebrew/bin/blueutil", 
                            checkBluetoothResult,{"--power", power})
    t:start()
    -- print(t) --在console印出命令 power on/off 命令
end

function toggleBluetooth()
    local statusStr = hs.execute("/opt/homebrew/bin/blueutil -p")
    local status = tonumber(statusStr)
    if status == 0 then
        bluetooth("on")
        hs.alert.show("Bluetooth on")
    else
        bluetooth("off")
        hs.alert.show("Bluetooth off")
    end
end

hs.hotkey.bind({"ctrl"}, "b", toggleBluetooth)

--  control + w 開啟wi-fi
hs.hotkey.bind("ctrl", 'w', function()
    -- Returns a table containing details about the wireless interface.
    -- .power is a attribute which means current status of Wi-Fi 
    wifiState = hs.wifi.interfaceDetails().power
    if wifiState == false then
        hs.wifi.setPower(true)
        hs.alert.show("Wi-Fi on")
    else
        hs.wifi.setPower(false)
        hs.alert.show("Wi-Fi off")
    end
end)

-- 更改快捷鍵 for 將dock從隱藏狀態改成顯示狀態
hs.hotkey.bind({"alt"}, "`", function()
    hs.eventtap.keyStroke({"alt", "cmd"}, "D")
end)

-- test fullscreen (do not work :(  )
hs.hotkey.bind("ctrl", "f", function()
	hs.eventtap.keyStroke({"ctrl", "cmd"}, "F")
end)

-- 更改快捷鍵，將cmd + Right改成cmd + h
-- 註：cmd + Right 跳至句首 
-- July 25 改成 backward one word
hs.hotkey.bind({"cmd"}, "H", function()
    -- hs.eventtap.keyStroke({"cmd"}, "Left")
    hs.eventtap.keyStroke({"alt"}, "Left")
end)

-- 更改快捷鍵，將cmd + Left改成cmd + L 
-- 註：cmd + Left 跳至句尾 
-- July 25 改成 forward one word
hs.hotkey.bind({"cmd"}, "L", function()
    -- hs.eventtap.keyStroke({"cmd"}, "Right")
    hs.eventtap.keyStroke({"alt"}, "Right")
end)

hs.hotkey.bind('ctrl', 's', function()
    hs.alert.show("•ࡇ•  Poewr: " .. hs.battery.percentage() .. "%")
    -- hs.alert.show(' •ࡇ•')
    -- app = hs.application.frontmostApplication()
    -- hs.alert.show(app:name()) --顯示當前app的名稱
end)

-- Half Screen to the right
hs.hotkey.bind("alt", "Right", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + (max.w / 2)
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h
    win:setFrame(f)
end)

-- Half Screen to the left 
hs.hotkey.bind("alt", "Left", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h 
    win:setFrame(f)
end)

-- 其實可以合併，不一定要單獨寫再呼叫
function FullScreen()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y
    f.w = max.w 
    f.h = max.h
    win:setFrame(f)
end

hs.hotkey.bind("alt", "Up", FullScreen)

-- hs.hotkey.bind({}, "escape", function()
--     hs.eventtap.keyStroke({"cmd"}, "M")
-- end)

-- for i=1,9 do
--     -- 如果這個app是開啟的狀態下，則動作以下程式碼：
--     hs.hotkey.bind({"alt"}, tostring(i), function()
--         app = hs.application.frontmostA pplication()


--         if app then
--             hs.eventtap.keyStroke("cmd", "M")
--         else
--             print("app is not running")
--         end

--     end)
-- end

-- axuielement means Accessibility User Interface Element (存取使用者互動元素)
-- 这些元素是通过辅助功能接口让辅助工具、自动化脚本和屏幕阅读器等工具能够与应用程序和用户界面进行交互的方式。
-- 使用hs.axuielement函數獲取Dock應用程式的UI元素，並選擇指定索引的圖標（iconNumber）。Dock的UI元素可以被看作是一個列表，索引從1開始，表示Dock中的第一個應用程式圖標。

-- 原本的code
-- https://github.com/Hammerspoonhammerspoon/issues/953
-- d = hs.application("Dock")
-- for i=1,9 do
--     hs.hotkey.bind({"alt"}, tostring(i), function()
--         iconNumber = i
--         icon = hs.axuielement.applicationElement(d)[1][iconNumber]
--         if icon:attributeValue("AXRoleDescription") == "application dock item" then
--             icon:performAction("AXPress")
--         else
--             print ("not an application")
--         end
--     end)
-- end

function dragWindow()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local mouse = hs.mouse.getAbsolutePosition()
    f.x = mouse.x - (f.w / 2)
    f.y = mouse.y - (f.h / 2)
    win:setFrame(f)
end
