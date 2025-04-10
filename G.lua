–[[ Найди строку StarterGui и рядом + нажми выбери LocalScript 
Дважды кликни и вставь этот код
]]
local size = 25 -- число размера (можно отрегулировать)
local love = Instance.new("ScreenGui", script.Parent)
love.IgnoreGuiInset = true
local back = Instance.new("Frame", love)
back.BackgroundTransparency = 1
back.Position = UDim2.new(-0.125, 1, -0.358, 216)
back.Size = UDim2.fromOffset(1000,1000)
back.ClipsDescendants = true
back.Draggable = true
back.Active = true
local frame = Instance.new("Frame")
frame.BackgroundColor3 = Color3.new(1,1,1)
frame.BackgroundTransparency = 0.65
frame.Size = UDim2.fromOffset(size, size)
frame.ClipsDescendants = true
frame.BorderSizePixel = 0

local function CreateHeart(count, cd, position)
  frame.Position = UDim2.fromOffset(position.X.Offset, position.Y.Offset)
  for i = 1, count do
    local nframe = frame:Clone()
    frame.Position = frame.Position - UDim2.fromOffset(0, frame.Size.Y.Offset)
    nframe.Parent = back
    wait(cd)
  end
end

local function AnimHeart(cd1, cd2, folder)
  local TweenService = game:GetService("TweenService")
  local tweenInfo = TweenInfo.new(cd1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
  if folder then
    for _, frame in pairs(folder:GetChildren()) do
      if frame then
        TweenService:Create(frame, tweenInfo, {BackgroundTransparency = 0}):Play()
        TweenService:Create(frame, tweenInfo, {Position = (frame.Position - UDim2.fromOffset(0,2.5))}):Play()
        TweenService:Create(frame, tweenInfo, {Size = (frame.Size + UDim2.fromOffset(2.5,2.5))}):Play()
        TweenService:Create(frame, tweenInfo, {BackgroundColor3 = Color3.fromRGB(255,0,0)}):Play()
      end
    end
    wait(cd2)
    for _, frame in pairs(folder:GetChildren()) do
      if frame then
        TweenService:Create(frame, tweenInfo, {BackgroundTransparency = 0.65}):Play()
        TweenService:Create(frame, tweenInfo, {Position = (frame.Position + UDim2.fromOffset(0,2.5))}):Play()
        TweenService:Create(frame, tweenInfo, {Size = (frame.Size - UDim2.fromOffset(2.5,2.5))}):Play()
        TweenService:Create(frame, tweenInfo, {BackgroundColor3 = Color3.fromRGB(255,255,255)}):Play()
      end
    end
    wait(cd2)
  end
end

local startXY = UDim2.fromOffset(back.Size.X.Offset - frame.Size.X.Offset, back.Size.Y.Offset - frame.Size.Y.Offset)
print(startXY)

--[Six]
CreateHeart(6, 0.05, UDim2.fromOffset(startXY.X.Offset/2, startXY.Y.Offset/2))
CreateHeart(6, 0.05, UDim2.fromOffset(startXY.X.Offset/2-frame.Size.X.Offset, startXY.Y.Offset/2-frame.Size.Y.Offset))
CreateHeart(6, 0.05, UDim2.fromOffset(startXY.X.Offset/2+frame.Size.X.Offset, startXY.Y.Offset/2-frame.Size.Y.Offset))
CreateHeart(6, 0.05, UDim2.fromOffset(startXY.X.Offset/2-(frame.Size.X.Offset * 2), startXY.Y.Offset/2-(frame.Size.Y.Offset * 2)))
CreateHeart(6, 0.05, UDim2.fromOffset(startXY.X.Offset/2+(frame.Size.X.Offset * 2), startXY.Y.Offset/2-(frame.Size.Y.Offset * 2)))
--[Five]
CreateHeart(5, 0.05, UDim2.fromOffset(startXY.X.Offset/2-(frame.Size.X.Offset * 3), startXY.Y.Offset/2-(frame.Size.Y.Offset * 3)))
CreateHeart(5, 0.05, UDim2.fromOffset(startXY.X.Offset/2+(frame.Size.X.Offset * 3), startXY.Y.Offset/2-(frame.Size.Y.Offset * 3)))
--[Three]
CreateHeart(3, 0.05, UDim2.fromOffset(startXY.X.Offset/2-(frame.Size.X.Offset * 4), startXY.Y.Offset/2-(frame.Size.Y.Offset * 4)))
CreateHeart(3, 0.05, UDim2.fromOffset(startXY.X.Offset/2+(frame.Size.X.Offset * 4), startXY.Y.Offset/2-(frame.Size.Y.Offset * 4)))

while wait() do
AnimHeart(0.5, 1.2, back)
end
