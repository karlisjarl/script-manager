-- PLUGIN IS LICENSED. REUPLOADING / PIRATING IS PROHIBITTED

-- variables
local http = game:GetService('HttpService')
local runservice = game:GetService('RunService')
local studioservice = game:GetService('StudioService')
local scriptservice = game:GetService('ScriptEditorService')
local tween = game:GetService('TweenService')

-- checking if player is ingame
if runservice:IsRunning() then
	return
end

-- modules
local ui = require(script.UI)
local selection = require(script.SelectionFunctions)
shared.explorericons = require(script.Icons)
local explorericons = shared.explorericons

-- http requests
local versionurl = 'https://raw.githubusercontent.com/O3O2WasntAvailable/script-manager/main/version'

-- studio
local mouse = plugin:GetMouse()
local theme = settings().Studio.Theme

shared.scriptoverview = {
	version = 1.1;
	theme = {
		closeimage = 'rbxassetid://12712444278';
		
		themetype = theme;
		
		background = theme:GetColor(Enum.StudioStyleGuideColor.MainBackground);
		hovercolor = theme:GetColor(Enum.StudioStyleGuideColor.Button);
		selected = Color3.fromRGB(11, 90, 175); -- couldnt find the studio theme color
		
		textcolor = theme:GetColor(Enum.StudioStyleGuideColor.SubText);
		selectedtextcolor = theme:GetColor(Enum.StudioStyleGuideColor.BrightText);
		
		hover = theme:GetColor(Enum.StudioStyleGuideColor.Button);
	};
}

local scriptoverview = shared.scriptoverview
theme = shared.scriptoverview.theme

-- scripted variables
local isrunningcurrentversion = true
local buttons = {}
local activescripts = {}
local selectedbutton = nil

-- button
local toolbar = plugin:CreateToolbar("O3_O2's Plugins")
local button = toolbar:CreateButton('Script Manager', 'Better script navigation','')
button.ClickableWhenViewportHidden = true

-- widget
local widgetinfo = DockWidgetPluginGuiInfo.new(Enum.InitialDockState.Left,true,false,150,150,150,150)

local widget = plugin:CreateDockWidgetPluginGui("UI_Editor", widgetinfo)
widget.ZIndexBehavior = Enum.ZIndexBehavior.Global
widget.Title = 'Script Manager'

-- button pressed
button.Click:Connect(function()
	widget.Enabled = not widget.Enabled
end)

-- ui
local main = ui.create('ScrollingFrame',{
	BackgroundTransparency = 1;
	BorderSizePixel = 0;
	AutomaticCanvasSize = Enum.AutomaticSize.Y;
	CanvasSize = UDim2.new(0,0,0,0);
	ScrollBarThickness = 0;
	Size = UDim2.new(1,0,1,0);
	
	Parent = widget;
})
local list = ui.create('UIListLayout',{
	Parent = main;
})
-- not running latest version gui
local fade = ui.create('Frame',{
	Visible = false;
	BackgroundTransparency = 1;
	Size = UDim2.new(1,0,1,0);
	BackgroundColor3 = Color3.new(0,0,0);
	
	Parent = widget
})
local fadetext = ui.create('TextLabel',{
	Text = 'Your plugin is not running on the latest version. Please update it (Plugins>Manage Plugins>Script Manager>Update)';
	TextColor3 = theme.textcolor;
	BackgroundTransparency = 1;
	TextTransparency = 1;
	Size = UDim2.new(1,-20,1,-20);
	TextWrapped = true;
	Position = UDim2.new(0,10,0,10);
	TextSize = 14;
	Font = Enum.Font.SourceSans;

	Parent = fade;
})

-- version
local function checkversion()
	-- detecting version
	local realversion = tonumber(http:GetAsync(versionurl))
	if shared.scriptoverview.version ~=  realversion then
		isrunningcurrentversion = false
	end
	
	if not isrunningcurrentversion then
		list:Destroy()
		fade.Visible = true
		fadetext.Visible = true
		tween:Create(fade,TweenInfo.new(0.5),{BackgroundTransparency = 0.5}):Play()
		tween:Create(fadetext,TweenInfo.new(0.5),{TextTransparency = 0}):Play()
	end
end

checkversion()

spawn(function()
	while task.wait(60) do
		checkversion()
	end
end)

-- script instances ui
local function selectbutton(script)
	local old = selectedbutton
	
	selectedbutton = buttons[script]
	
	if selectedbutton then
		if old ~= nil then
			old.BackgroundColor3 = theme.background
			if old:FindFirstChild('TextLabel') then
				old.TextLabel.TextColor3 = theme.textcolor
			end
		end
		selectedbutton.BackgroundColor3 = theme.selected
		selectedbutton.TextLabel.TextColor3 = theme.selectedtextcolor
	end
end

function scriptoverview.addbutton(script,callback)
	if not isrunningcurrentversion then return end
	local button = ui.create('TextButton',{
		BackgroundColor3 = theme.background;
		AutoButtonColor = false;
		BorderSizePixel = 0;
		Size = UDim2.new(1,0,0,20);
		Text = '';
		
		Parent = main;
	})
	local image = ui.create('ImageLabel',{
		ImageColor3 = Color3.new(1,1,1);
		BackgroundTransparency = 1;
		Size = UDim2.new(0,16,0,16);
		Position = UDim2.new(0,2,0,2);
		Image = explorericons[script.ClassName];
		
		Parent = button;
	})
	local text = ui.create('TextLabel',{
		Text = script.Name;
		TextColor3 = theme.textcolor;
		BackgroundTransparency = 1;
		TextXAlignment = 'Left';
		Size = UDim2.new(0,0,1,0);
		Position = UDim2.new(0,20,0,0);
		TextSize = 14;
		Font = Enum.Font.SourceSans;
		
		Parent = button;
	})
	
	if (script:IsA('Script') or script:IsA('LocalScript')) and not script.Enabled then
		image.ImageTransparency = 0.5
		text.TextTransparency = 0.5
	end
	
	--[[
	local close = ui.create('ImageButton',{
		ImageColor3 = tostring(settings().Studio.Theme) == 'Dark' and Color3.new(1,1,1) or Color3.new(0,0,0);
		BackgroundTransparency = 1;
		Size = UDim2.new(0,16,0,16);
		Position = UDim2.new(1,-2,0,2);
		Image = theme.closeimage;
		AnchorPoint = Vector2.new(1,0);

		Parent = button;
	})
	
	close.MouseButton1Click:Connect(function()
		button:Destroy()
		buttons[script] = nil
	end)
	]]
	
	button.MouseEnter:Connect(function()
		if selectedbutton ~= button then
			button.BackgroundColor3 = theme.hovercolor
		end
	end)
	button.MouseLeave:Connect(function()
		if selectedbutton ~= button then
			button.BackgroundColor3 = theme.background
		end
	end)
	button.MouseButton1Click:Connect(function()
		selectbutton(script)
		callback()
	end)
	
	buttons[script] = button
	
	return button
end

mouse.Button1Down:Connect(function()
	selectbutton(nil)
end)

-- selection and buttons
local function updateactive()
	runservice.RenderStepped:Wait()
	local active = studioservice.ActiveScript
	
	local open = scriptservice:GetScriptDocuments()
	
	activescripts = open
	
	for _,v in pairs(buttons) do
		v:Destroy()
		v = nil
	end
	
	for _,script in pairs(activescripts) do
		if script.Name ~= 'CommandBar' then
			local split = string.split(script.Name,'.')
			local source = 'shared.newscript = game'
			
			for i,v in pairs(split) do
				source = source .. '["'
				source = source .. v
				source = source .. '"]'
			end
			
			loadstring(source)()
			
			local newscript = shared.newscript
			
			local button2 = scriptoverview.addbutton(newscript,function()
				scriptservice:OpenScriptDocumentAsync(newscript)
			end)
		end
	end
	
	selectbutton(active)
end

updateactive()

studioservice:GetPropertyChangedSignal("ActiveScript"):Connect(updateactive)
