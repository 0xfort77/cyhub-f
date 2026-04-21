    
if game.PlaceId == 101325745836000 then
    
    
    local _Version = "Cyan-Fatty v1.1.01"

    --// call Library
    local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()


    --// create window
    local Window = Rayfield:CreateWindow({
        Name = _Version,
        Icon = "ham", -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
        LoadingTitle = "Cyan Hubs",
        LoadingSubtitle = "by 4NTHOcyan",
        ShowText = "Rayfield", -- for mobile users to unhide Rayfield, change if you'd like
        Theme = "Serenity", -- Check https://docs.sirius.menu/rayfield/configuration/themes
        
        ToggleUIKeybind = "K", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)
        
        DisableRayfieldPrompts = true,
        DisableBuildWarnings = true, -- Prevents Rayfield from emitting warnings when the script has a version mismatch with the interface.
        
        ConfigurationSaving = {
           Enabled = false,
           FolderName = nil, -- Create a custom folder for your hub/game
           FileName = "Big Hub"
        },
    
        Discord = {
           Enabled = true, -- Prompt the user to join your Discord server if their executor supports it
           Invite = "9vxK5cdGy4", -- The Discord invite code, do not include Discord.gg/. E.g. Discord.gg/ ABCD would be ABCD
           RememberJoins = true -- Set this to false to make them join the Discord every time they load it up
        },
    
        KeySystem = false, -- Set this to true to use our key system
        KeySettings = {
           Title = "Untitled",
           Subtitle = "Key System",
           Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
           FileName = "Key", -- It is recommended to use something unique, as other scripts using Rayfield may overwrite your key file
           SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
           GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
           Key = {"Hello"} -- List of keys that the system will accept, can be RAW file links (pastebin, github, etc.) or simple strings ("hello", "key22")
        }
    })

    --// Local VAR
    local my_person = game.Players.LocalPlayer
    local my_char = my_person.Character
    local my_HRP = my_char:FindFirstChild("HumanoidRootPart")

    local winpads = workspace.Activations.Pads

    local win_toggle = false -- win toggle flag
    local selected_win = nil -- win dropdown capture
    local upgrade_menu_toggle = false -- upgrade ui flag
    local rebirth_flag = false
    local egg_flag = false
    local title_flag = false
    local eating_flag = false

    local index1
   
    local options_table = {
    "1", "5", "12", 
    "40", "100", "250",
    "750", "2000", "10K",
    "40K", "100K", "300K",
    "1M", "5M",
    }

    local menu_ui = game:GetService("Players").LocalPlayer.PlayerGui.GameUI.Menus
    local upgrade_ui = game:GetService("Players").LocalPlayer.PlayerGui.GameUI.Menus.Upgrades

    ----------
    --// Main

    Rayfield:Notify({
        Title = "Welcome!",
        Content = "Thanks for using CyanHub by 4NTHOcyan",
        Duration = 6.5,
        Image = "heart",
        })

    Rayfield:Notify({
        Title = "Notification",
        Content = "Some features have been removed because of the developer's anti-cheat implementations",
        Duration = 15,
        Image = 4483362458,
        })

    local AlterPtab = Window:CreateTab("Player", "user")
    local Tab = Window:CreateTab("Wins", "trophy") -- Title, Image

    --// Create Tab (player)

    local speedSlider = AlterPtab:CreateSlider({
        Name = "Speed",
        Range = {30, 150},
        Increment = 2,
        Suffix = "",
        CurrentValue = 30,
        Flag = "PlayerSlider1", -- A flag is the identifier for the configuration file; make sure every element has a different flag if you're using configuration saving to ensure no overlaps
        Callback = function(Value)
        
            my_char.Humanoid.WalkSpeed = Value
        end,
    })

    local Divider = AlterPtab:CreateDivider()

    local Button = AlterPtab:CreateButton({
        Name = "Rebirth",
        Callback = function()
            local args = {
	            {
	            	{},

	            	")"
	            }
            }
            game:GetService("ReplicatedStorage"):WaitForChild("BridgeNet2"):WaitForChild("dataRemoteEvent"):FireServer(unpack(args))

        end,
    })

    local Divider = AlterPtab:CreateDivider()

    --//Main Tab (Wins)

    local Dropdown = Tab:CreateDropdown({
        Name = "Select Available Win",
        Options = options_table,
        CurrentOption = Options,
        MultipleOptions = false,
        Flag = "WinDropdown1", -- A flag is the identifier for the configuration file; make sure every element has a different flag if you're using configuration saving to ensure no overlaps
        Callback = function(Options)
                
            index1 = Options[1]

        end,
    })

    
    local Toggle = Tab:CreateToggle({
        Name = "Auto Win",
        CurrentValue = false,
        Flag = "WinToggle1", -- A flag is the identifier for the configuration file; make sure every element has a different flag if you're using configuration saving to ensure no overlaps
        Callback = function(Value)
            win_toggle = Value

            if win_toggle then
                Rayfield:Notify({
                    Title = "Auto Win enabled",
                    Content = "Please wait...",
                    Duration = 4,
                    Image = 4483362458,
                })
            end

            local function win_touch()
                for i, v in ipairs(options_table) do

                    if v == index1 then
                        local actual_index = i
                        --print(tostring(actual_index))
                        local winbox = winpads[i].Hitbox

                        firetouchinterest(my_HRP, winbox, 0)
                        task.wait()
                        firetouchinterest(my_HRP, winbox, 1)
                    end
                    task.wait(0.25)

                end
            end

            while win_toggle do
                
                pcall(win_touch)

            end

        end,
    })

    -- no afk rebirth?
    -- upgrade menu buggy
    -- 
end

   
